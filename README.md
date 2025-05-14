# Kalshi Financial Wellness Score

A Flutter application that calculates a user's financial wellness score based on their annual income and monthly costs.

## Project Structure

The project follows the MVVM (Model-View-ViewModel) architecture pattern:

```
assets/ # Assets
lib/
├── models/
│   └── # Models
├── viewmodels/
│   └── # Business logic
├── views/
│   ├── # UI
│   └── widgets/
│       └── # Custom widgets
└── main.dart                    
```

### Architecture Components

- **Models**: Contains the data models
  - `FinancialScore`: Enum representing different financial wellness levels (Healthy, Medium, Low)

- **ViewModels**: Handles the business logic and data processing
  - `FinancialFormViewModel`: Manages form validation and score calculation

- **Views**: Contains the UI components
  - `FormPage`: Input form for annual income and monthly costs
  - `ResultPage`: Displays the calculated financial wellness score

## Features

- Clean MVVM architecture implementation
- Input validation for financial data
- Real-time score calculation
- Visual score representation
- Modern and responsive UI

## Getting Started

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

## Dependencies

- Flutter SDK
- Material Design components
- Custom widgets for UI elements
