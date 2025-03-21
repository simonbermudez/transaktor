/**
 * @fileoverview Main entry point for the Transaktor Chrome Extension
 * Implements transaction import functionality for multiple banks
 * 
 * Dependencies (load order matters):
 * 1. utils/functions.js - Core utilities
 * 2. services/services.js - Bank services
 * 3. banks/*.js - Bank-specific configurations
 * 
 * Extension Architecture:
 * - Modular bank configurations in banks/
 * - Each bank supports API and/or DOM scraping methods
 * - Automatic fallback from API to scraping if needed
 * - Standardized transaction format across all banks
 * 
 * Transaction Object Format:
 * {
 *   id: string,          // Unique transaction identifier
 *   date: string,        // YYYY-MM-DD format
 *   description: string, // Transaction description
 *   amount: number,      // Negative for debits, positive for credits
 *   metadata: Object,    // Bank-specific additional data
 *   source: string       // Bank identifier
 * }
 */

// Main execution
async function init() {
    const currentUrl = window.location.href;
    
    // Iterate through registered bank configurations
    for (const [bank, config] of Object.entries(window.banks)) {
        if (currentUrl.includes(config.urlPattern)) {
            try {
                // Attempt to fetch transactions using configured methods
                const transactions = await window.bankService.getTransactions(config);
                if (transactions && transactions.length > 0) {
                    // Upload successful transactions to Transaktor
                    await window.utils.uploadToTransaktor(transactions);
                }
            } catch (error) {
                console.error('Failed to process transactions:', error);
                alert('Failed to process transactions. Please try again or contact support.');
            }
            break;
        }
    }
}

// Start the extension when page loads
init();
