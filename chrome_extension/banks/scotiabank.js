/**
 * @fileoverview ScotiaBank configuration for the Transaktor Chrome Extension
 * Provides both API and DOM scraping methods for transaction extraction
 */

/**
 * Complete configuration for ScotiaBank integration
 * @type {Object}
 */
const scotiabankConfig = {
    /** URL pattern to identify ScotiaBank pages */
    urlPattern: 'scotiabank',

    /**
     * API Method Configuration
     * Primary method for fetching transactions using ScotiaBank's API
     */
    api: {
        /** Whether API method is enabled */
        enabled: true,

        /**
         * Generates the API endpoint URL
         * @param {string} path - Current page path
         * @returns {string} Complete API URL
         */
        endpoint: (path) => {
            // parse the path and get the last part without query parameters with regex 
            if (!path) return null;
            console.log(path);
            const accountId = path.match(/\/accounts\/(?:credit|chequing)\/([^/?]+)/)[1];
            console.log(accountId)
            if (path.includes('chequing')) {
                return `https://secure.scotiabank.com/api/transactions/deposit-accounts/${accountId}?limit=100`;
            }
            // For credit cards, use a different endpoint
            return `https://secure.scotiabank.com/api/credit/${accountId}/transactions?limit=300`
        },

        /**
         * Transforms API response into standard format
         * @param {Object} data - Raw API response
         * @returns {Object} Transformed data with pending and settled transactions
         */
        transformResponse: (data) => ({
            pending: data.data.pending ? data.data.pending : [],
            settled: data.data.settled ? data.data.settled : data.data
        }),

        /**
         * Maps API transaction data to standard format
         * @param {Object} t - Raw transaction data
         * @returns {Object} Standardized transaction object
         */
        transactionMapper: (t) => ({
            id: t.key,
            date: window.utils.parseDate(t.transactionDate),
            description: t.description,
            amount: t.transactionType == "DEBIT" ? -t.transactionAmount.amount : t.transactionAmount.amount,
            metadata: t,
            source: 'scotiabank'
        })
    },

    /**
     * DOM Scraping Method Configuration
     * Fallback method when API is not available
     */
    scraping: {
        /** Whether scraping method is enabled */
        enabled: false,

        /**
         * CSS Selectors for DOM scraping
         * Used to locate transaction elements in the page
         */
        selectors: {
            /** Selector for account name element */
            accountName: '.regular-data-account-details > h3',
            /** Selector for transaction tables (pending and posted) */
            transactionTables: '.thtable',
            /** Selector for individual transaction rows */
            transactionRow: 'tr:not([class])',
            /** Selector for transaction date */
            date: 'th',
            /** Selector for transaction description */
            description: 'td:nth-child(2)',
            /** Selector for debit amount */
            debitAmount: 'td:nth-child(3)',
            /** Selector for credit amount */
            creditAmount: 'td:nth-child(4)'
        },

        /**
         * Maps scraped DOM elements to standard transaction format
         * @param {Element} row - DOM element containing transaction data
         * @param {string} accountName - Name of the account
         * @returns {Object|null} Standardized transaction object or null if parsing fails
         */
        transactionMapper: (row, accountName) => {
            try {
                const dateElem = row.querySelector('th');
                const descElem = row.querySelector('td:nth-child(2)');
                const debitElem = row.querySelector('td:nth-child(3)');
                const creditElem = row.querySelector('td:nth-child(4)');

                if (!dateElem || !descElem) return null;

                const amount = debitElem.innerText ? 
                    -Number(debitElem.innerText) : 
                    Number(creditElem.innerText || '0');

                return {
                    id: `${accountName}-${window.utils.parseDate(dateElem.innerText)}-${descElem.innerText}-${amount}`.replaceAll(" ", "-"),
                    date: window.utils.parseDate(dateElem.innerText),
                    description: descElem.innerText.split("\n")[0],
                    amount: amount || 0,
                    metadata: { source: 'scraping' },
                    source: 'scotiabank'
                };
            } catch (e) {
                console.error('Error processing transaction row:', e);
                return null;
            }
        }
    }
};

// Register ScotiaBank configuration globally
window.banks = window.banks || {};
window.banks.scotiabank = scotiabankConfig;