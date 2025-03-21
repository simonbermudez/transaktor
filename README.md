# Transaktor

![Transaktor Dashboard](https://github.com/simonbermudez/transaktor/blob/main/media/dashboard.png)


A powerful, modern expense tracking and financial analytics application built with Django.

## 🚀 Features

### Comprehensive Financial Dashboard
- **Expense Tracking**: Automatically categorize and track all your expenses
- **Smart Categorization**: Automatic transaction categorization based on description patterns
- **Budget Management**: Set and track budgets for different expense categories
- **Financial Analytics**: Rich visualizations to understand your spending habits

### Intuitive Data Visualization
- **Monthly Distribution Chart**: See where your money goes each month
- **Spending Trends**: Track how your expenses evolve over time
- **Budget vs. Actual**: Compare your planned budget against actual spending
- **Daily Spending Patterns**: Identify high-spending days
- **Top Expenses**: Quick view of your largest spending categories
- **Savings Rate**: Monitor your savings percentage over time
- **Category Trends**: Analyze spending patterns by category

### User Experience
- **Responsive Design**: Works seamlessly on desktop and mobile devices
- **Dark/Light Mode**: Choose your preferred theme or sync with system preferences
- **Accessibility Features**: Color-coded budget status with WCAG-compliant contrast
- **Shareable Insights**: URL parameters for sharing specific month views

## 🛠️ Technology Stack

- **Backend**: Django 5.0+, Django REST Framework
- **Database**: PostgreSQL 13
- **Frontend**: HTML5, CSS3, JavaScript, Chart.js
- **Styling**: Bootstrap 5, Custom CSS Variables
- **Containerization**: Docker, Docker Compose
- **Dependencies**: See requirements.txt for full list

## 🔧 Installation & Setup

### Prerequisites
- Docker and Docker Compose
- Git

### Quick Start

1. Clone the repository
```bash
git clone https://github.com/simonbermudez/transaktor.git
cd transaktor
```

2. Start the application using Docker Compose
```bash
docker-compose up -d
```

3. Access the application
```
http://localhost:7346
```

### Manual Setup (Without Docker)

1. Clone the repository
```bash
git clone https://github.com/simonbermudez/transaktor.git
cd transaktor
```

2. Create a virtual environment and install dependencies
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Set up PostgreSQL database and update settings.py with your database credentials

4. Run migrations and start the development server
```bash
python manage.py migrate
python manage.py runserver
```

5. Access the application at http://localhost:8000

## 📊 Data Model

### Core Entities
- **Transaction**: Records of financial transactions with amount, date, description
- **Category**: Expense categories with optional budget limits
- **Association**: Keyword-to-category mappings for automatic categorization

### Smart Features
- Automatic duplicate transaction detection and cleanup
- Pattern-based transaction categorization
- Budget tracking and visualization

## 🔒 Security

- Content Security Policy implementation
- Environment variable-based configuration
- Secure database credentials management

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Contact

Simon Bermudez - [Website](https://simonbermudez.com)

---

Made with ❤️ by Simon Bermudez

## Transaktor Chrome Extension

A Chrome extension for automatically importing bank transactions into Transaktor. Supports multiple banks through a modular architecture with both API and DOM scraping capabilities.

## Features

- Automatic transaction import from supported banks
- Dual import methods: API and DOM scraping
- Modular bank configuration system
- Standardized transaction format
- Error handling and fallback mechanisms
- Real-time transaction upload to Transaktor

## Installation

1. Clone this repository
2. Open Chrome and navigate to `chrome://extensions/`
3. Enable "Developer mode" in the top right
4. Click "Load unpacked" and select the `chrome_extension` directory

## Project Structure

```
chrome_extension/
├── utils/
│   └── functions.js      # Core utility functions
├── services/
│   └── services.js       # Bank service functions
├── banks/
│   └── scotiabank.js     # Bank-specific configurations
├── content.js            # Main extension script
└── manifest.json         # Extension configuration
```

## Adding Support for a New Bank

1. Create a new configuration file in the `banks` directory
2. Implement the required configuration object:

```javascript
const bankConfig = {
    urlPattern: 'bankurl.com',
    api: {
        enabled: true,
        endpoint: (path) => `https://api.bank.com/transactions`,
        transformResponse: (data) => ({
            pending: [],
            settled: []
        }),
        transactionMapper: (t) => ({
            id: '',
            date: '',
            description: '',
            amount: 0,
            metadata: {},
            source: 'bankname'
        })
    },
    scraping: {
        enabled: true,
        selectors: {
            accountName: '',
            transactionTables: '',
            transactionRow: '',
            // ... other selectors
        },
        transactionMapper: (row, accountName) => ({
            // ... transaction mapping logic
        })
    }
};
```

## Transaction Object Format

All bank configurations must map their transactions to this standard format:

```javascript
{
    id: string,          // Unique transaction identifier
    date: string,        // YYYY-MM-DD format
    description: string, // Transaction description
    amount: number,      // Negative for debits, positive for credits
    metadata: Object,    // Bank-specific additional data
    source: string       // Bank identifier
}
```

## Development

### Prerequisites

- Chrome browser
- Node.js (for development tools)
- Basic understanding of Chrome extension APIs

### Testing

1. Make changes to the code
2. Reload the extension in Chrome
3. Test on supported bank websites
4. Check the console for errors and debug information

### Best Practices

1. Always implement both API and scraping methods when possible
2. Use descriptive selectors for DOM scraping
3. Handle errors gracefully with user feedback
4. Follow the standardized transaction format
5. Document new bank configurations thoroughly

## Troubleshooting

Common issues and solutions:

1. **Transactions not importing**
   - Check if you're on a supported bank page
   - Verify API endpoints and selectors
   - Check console for error messages

2. **Extension not loading**
   - Ensure manifest.json is properly configured
   - Verify all required files are present
   - Check file paths in manifest.json

3. **API method failing**
   - Verify API endpoints are accessible
   - Check network tab for request/response details
   - Ensure proper error handling is in place

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## License

MIT License - See LICENSE file for details
