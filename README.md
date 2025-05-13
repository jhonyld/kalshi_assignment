# Kalshi Financial Wellness Score

## Overview
This Flutter app helps users assess their financial wellness by entering their annual income and monthly costs. The app calculates a score (Healthy, Medium, Low) based on business rules and presents it in a user-friendly way.

## Architecture
- **Clean Architecture (Simple)**: Divided into core, features (data, domain, presentation).
- **Separation of Concerns**: Business logic is isolated from UI for easy testing and maintenance.
- **No External Packages**: Only Flutter SDK is used for simplicity and reliability.

### Folder Structure
```
lib/
│
├── core/
│   └── utils/           # Input validators and helpers
│
├── features/
│   └── financial_wellness/
│       ├── domain/
│       │   ├── entities/    # Business entities (FinancialInfo, FinancialScore)
│       │   └── usecases/    # CalculateScoreUseCase
│       └── presentation/
│           ├── controllers/ # Simple controller for form logic
│           └── pages/       # Screens (FormPage, ResultPage)
│
└── main.dart
```

## Business Rules
- 8% tax on annual income.
- Score is based on annual costs as a percentage of net income:
  - ≤ 25%: Healthy
  - > 25% and ≤ 75%: Medium
  - > 75%: Low

## Validation
- Both fields required and > 0
- Only numbers allowed

## How to Run
1. Clone the repo
2. Run `flutter pub get`
3. Run `flutter run`

## Extending the App
- Add persistence by implementing a repository in the data layer.
- Add more features by following the same folder structure.

## Testing
- Business logic is in the domain layer and can be unit tested easily.

## Author & Notes
- Built for Kalshi assignment
- No external dependencies, simple and maintainable structure
