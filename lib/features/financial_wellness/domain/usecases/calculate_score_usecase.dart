import '../entities/financial_info.dart';
import '../entities/financial_score.dart';

class CalculateScoreUseCase {
  FinancialScore call(FinancialInfo info) {
    final netIncome = info.annualIncome * 0.92;
    final annualCosts = info.monthlyCosts * 12;
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
