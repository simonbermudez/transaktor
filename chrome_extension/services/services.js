/**
 * Bank Service
 * Provides methods for fetching and processing bank transactions
 */

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
                    
                    const response = await fetch(endpoint, {
                        method: 'GET',
                        credentials: 'include',
                        headers: {
                            'Accept': 'application/json'
                        }
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