import '../models/financial_score.dart';

class FinancialFormViewModel {
  double? annualIncome;
  double? monthlyCosts;

  String? validateCurrency(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (double.parse(value) <= 0) {
      return 'Value must be greater than 0';
    }
    return null;
  }

  FinancialScore calculateScore() {
    final annualTax = 0.08;
    final netIncome = annualIncome! * (1.00 - annualTax);
    final annualCosts = monthlyCosts! * 12;
    final percent = annualCosts / netIncome;

    if (percent <= 0.25) {
      return FinancialScore.healthy;
    } else if (percent <= 0.75) {
      return FinancialScore.medium;
    } else {
      return FinancialScore.low;
    }
  }
}
