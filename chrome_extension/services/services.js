/**
 * Bank Service
 * Provides methods for fetching and processing bank transactions
 */

// API configuration
const API_CONFIG = {
    baseUrl: 'https://transaktor.bermudez.ca',
    endpoints: {
        transactions: '/transactions/upload/',
        transfers: '/transfers/upload/'
    }
};

// Get API key from storage
async function getApiKey() {
    return new Promise((resolve) => {
        chrome.storage.sync.get(['apiKey'], (result) => {
            resolve(result.apiKey);
        });
    });
}

// Save API key to storage
async function saveApiKey(apiKey) {
    return new Promise((resolve) => {
        chrome.storage.sync.set({ apiKey }, resolve);
    });
}

// Upload transactions to Transaktor
async function uploadToTransaktor(transactions, areTransfers = false) {
    try {
        const apiKey = await getApiKey();
        if (!apiKey) {
            throw new Error('API key not found. Please configure your API key in the extension settings.');
        }

        const url = areTransfers ? `${API_CONFIG.baseUrl}${API_CONFIG.endpoints.transfers}` : `${API_CONFIG.baseUrl}${API_CONFIG.endpoints.transactions}`;

        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-API-Key': apiKey
            },
            mode: 'cors',
            body: JSON.stringify(transactions)
        });

        if (!response.ok) {
            const error = await response.json().catch(() => ({ message: 'Unknown error' }));
            throw new Error(error.message || `HTTP error! status: ${response.status}`);
        }

        const data = await response.json();
        if (data.created) {
            let uncategorizedTransactions = data.created.filter(t => !t.category);
            alert(`${data.created.length} Transactions uploaded successfully to Transaktor, ${uncategorizedTransactions.length} of them are uncategorized. Please categorize them in Transaktor.`);
            console.log(`${data.created.length} Transactions uploaded successfully to Transaktor`);
        }
        return data;
    } catch (error) {
        console.error('Error uploading transactions:', error);
        throw error;
    }
}

function parseDate(dateStr) {
    const date = new Date(dateStr);
    return date.toISOString().split('T')[0];
}

const bankService = {
    async getTransactions(config) {
        try {
            if (!config) {
                throw new Error('Bank configuration is required');
            }

            let transactions = [];

            // Try API method first
            if (config.api && config.api.enabled !== false) {
                try {
                    const path = window.location.pathname;
                    const endpoint = config.api.endpoint(path);
                    const apiKey = await getApiKey();
                    
                    const response = await fetch(endpoint);

                    if (!response.ok) {
                        throw new Error(`API request failed: ${response.status}`);
                    }

                    const data = await response.json();
                    const transformed = config.api.transformResponse(data);
                    
                    // Handle both array and object responses
                    const transactions = Array.isArray(transformed) ? transformed :
                        [...(transformed.pending || []), ...(transformed.settled || [])];
                    
                    if (transactions.length > 0) {
                        return transactions.map(t => config.api.transactionMapper(t));
                    }
                } catch (error) {
                    console.warn('API method failed, falling back to scraping:', error);
                }
            }

            // Fallback to DOM scraping if API fails or not available
            if (config.scraping && config.scraping.enabled !== false) {
                const { selectors } = config.scraping;
                const rows = Array.from(document.querySelectorAll(selectors.transactionRow));
                const accountName = document.querySelector(selectors.accountName)?.textContent?.trim() || '';
                
                const transactions = rows
                    .map(row => config.scraping.transactionMapper(row, accountName))
                    .filter(t => t !== null);

                if (transactions.length > 0) {
                    return transactions;
                }
            }

            throw new Error('No valid transaction fetch method available');
        } catch (error) {
            console.error('Error fetching transactions:', error);
            throw error;
        }
    },
    async getHistoricalTransactionsDebit() {
        transactions = [];
        let cursor = '';
        let acccount_id = "" // Set your account ID here
        // fetch transactions and save them to tranzactions
        while (true) {
            let response = await fetch(`https://secure.scotiabank.com/api/transactions/deposit-accounts/${acccount_id}?fromDate=2023-06-25&toDate=2025-06-25&cursor=${cursor}`)
            let data = await response.json();
            transactions.push(...data.data.map(t => ({
                id: t.key,
                date: window.utils.parseDate(t.transactionDate),
                description: t.description,
                amount: t.transactionType === "DEBIT" ? -t.transactionAmount.amount : t.transactionAmount.amount,
                metadata: t,
                source: 'scotiabank'
            })));
            cursor = data.nextCursorKey;
            console.log(`Fetched ${transactions.length} transactions so far...`);
            // If no more cursor, break the loop
            if (!cursor) {
                break;
            }
        }
        return transactions;
    },
    async getHistoricalTransfers() {
        let transfers = [];
        let cursor = '';
        while (true) { 
            let response = await fetch(`/external-transfer/api/e-transfers/transactions?cursor=${cursor}`)
            let data = await response.json();
            transfers.push(...data.data.map(t => ({
                id: t.id,
                date: window.utils.parseDate(t.date),
                description: t.description,
                amount: t.transactionType === "OutgoingTransfer" ? -t.amount.value : t.amount.value,
                metadata: t,
                source: 'scotiabank'
            })));
            cursor = data.nextCursorKey;
            console.log(`Fetched ${transfers.length} transfers so far...`);
            // If no more cursor, break the loop
            // less than 2 years ago
            if (!cursor || data.data[data.data.length - 1].date < new Date(Date.now() - 2 * 365 * 24 * 60 * 60 * 1000).toISOString()) {
                break;
            }
        }
        return transfers;
    } 
};

// Make services available globally
window.utils = {
    getApiKey,
    saveApiKey,
    parseDate,
    uploadToTransaktor
};

window.bankService = bankService;