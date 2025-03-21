// API configuration
const API_CONFIG = {
    baseUrl: 'https://transaktor.bermudez.com',  // Update this with your production URL
    endpoints: {
        transactions: '/api/transactions/',
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

// Generic API call function with API key authentication
async function callApi(endpoint, method = 'GET', data = null) {
    const apiKey = await getApiKey();
    
    if (!apiKey) {
        throw new Error('API key not found. Please configure your API key in the extension settings.');
    }

    const response = await fetch(`${API_CONFIG.baseUrl}${endpoint}`, {
        method,
        headers: {
            'Content-Type': 'application/json',
            'X-API-Key': apiKey
        },
        body: data ? JSON.stringify(data) : undefined
    });

    if (!response.ok) {
        const error = await response.json().catch(() => ({ message: 'Unknown error' }));
        throw new Error(error.message || `HTTP error! status: ${response.status}`);
    }

    return response.json();
}

// Upload transactions to Transaktor
async function uploadToTransaktor(transactions) {
    try {
        return await callApi(API_CONFIG.endpoints.transactions, 'POST', transactions);
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

// Export functions
export {
    getApiKey,
    saveApiKey,
    uploadToTransaktor,
    parseDate
};