/**
 * @fileoverview Background service worker for the Transaktor Chrome Extension
 * Handles extension lifecycle events and cross-script communication
 */

// Listen for extension installation or update
chrome.runtime.onInstalled.addListener((details) => {
  if (details.reason === 'install') {
    console.log('Transaktor extension installed');
  } else if (details.reason === 'update') {
    console.log('Transaktor extension updated');
  }
});

// Listen for messages from content scripts
chrome.runtime.onMessage.addListener((message, sender, sendResponse) => {
  // Handle any future message-based features here
  sendResponse({ received: true });
});