/**
 * @fileoverview Utility functions for the Transaktor Chrome Extension
 * Contains core functionality for date parsing and API communication
 */

const utils = {
    /**
     * Parses and standardizes date strings to YYYY-MM-DD format
     * Handles multiple date formats including ISO strings with time (YYYY-MM-DDTHH:MM:SS)
     * 
     * @param {string} dateString - The date string to parse
     * @returns {string} Date in YYYY-MM-DD format
     */
    parseDate(dateString) {
        try {
            const date = new Date(dateString);
            if (isNaN(date.getTime())) {
                // Handle T format (YYYY-MM-DDTHH:MM:SS)
                if (dateString.includes('T')) {
                    return dateString.split('T')[0];
                }
                throw new Error('Invalid date format');
            }
            return date.toISOString().split('T')[0];
        } catch (error) {
            console.error('Error parsing date:', error);
            return dateString;
        }
    },

    /**
     * Uploads transaction data to the Transaktor backend
     * 
     * @param {Object} transactions - Transaction data to upload
     * @param {string} transactions[].id - Unique identifier for the transaction
     * @param {string} transactions[].date - Transaction date in YYYY-MM-DD format
     * @param {string} transactions[].description - Transaction description
     * @param {number} transactions[].amount - Transaction amount (negative for debits)
     * @param {Object} transactions[].metadata - Additional transaction metadata
     * @param {string} transactions[].source - Source bank identifier
     * @returns {Promise<Object>} Response data from the server
     */
};

// Make utilities available globally
window.utils = utils;