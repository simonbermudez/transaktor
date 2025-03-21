/**
 * Bank Service
 * Provides methods for fetching and processing bank transactions
 */

// API configuration
const API_CONFIG = {
    baseUrl: 'https://transaktor.bermudez.ca',  // Update this with your production URL
    endpoints: {
        transactions: '/transactions/upload/',
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
async function uploadToTransaktor(transactions) {
    try {
        const apiKey = await getApiKey();
        if (!apiKey) {
            throw new Error('API key not found. Please configure your API key in the extension settings.');
        }

        const response = await fetch(`${API_CONFIG.baseUrl}${API_CONFIG.endpoints.transactions}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-API-Key': apiKey,
                'Accept': 'application/json',
                'Origin': chrome.runtime.getURL('')
            },
            mode: 'cors',
            credentials: "same-origin", // include, *same-origin, omit
            redirect: "follow", // manual, *follow, error
            referrerPolicy: "no-referrer", // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
            body: JSON.stringify(transactions), // body data type must match "Content-Type" header
        });

        if (!response.ok) {
            const error = await response.json().catch(() => ({ message: 'Unknown error' }));
            throw new Error(error.message || `HTTP error! status: ${response.status}`);
        }

        return response.json();
    } catch (error) {
        console.error('Error uploading transactions:', error);
        throw error;
    }
}

// Parse date function (kept from original)
function parseDate(dateStr) {
    const date = new Date(dateStr);
    return date.toISOString().split('T')[0];
}

window.bankService = {
    /**
     * Fetches transactions using the provided bank configuration
     * @param {Object} config - Bank configuration object containing API and/or scraping methods
     * @returns {Promise<Array>} Array of standardized transaction objects
     */
    async getTransactions(config) {
        try {
            // First attempt API method if available and enabled
            if (config.api && config.api.enabled !== false) {
                try {
                    const path = window.location.pathname;
                    const endpoint = config.api.endpoint(path);
                    const apiKey = await getApiKey();
                    
                    const response = await fetch(endpoint, {
                        method: 'GET',
                        credentials: 'include',
                        headers: {
                            'Accept': 'application/json',
                            'X-API-Key': apiKey,
                            'Origin': chrome.runtime.getURL(''),
                            'Content-Type': 'application/json'
                        },
                        mode: 'cors'
                    });

                    if (!response.ok) {
                        throw new Error(`API request failed: ${response.status}`);
                    }

                    const data = await response.json();
                    const transformed = config.api.transformResponse(data);
                    
                    // Allow bank configs to handle their own response structure
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
    }
};

// Export functions
window.utils = {
    getApiKey,
    saveApiKey,
    parseDate,
    uploadToTransaktor
};