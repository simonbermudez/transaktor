# Transaktor

<img src="https://simonbermudez.com/logo.png" width="200" alt="Transaktor Logo">

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
git clone https://github.com/yourusername/transaktor.git
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
git clone https://github.com/yourusername/transaktor.git
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
