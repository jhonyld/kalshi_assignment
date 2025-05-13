import '../../domain/entities/financial_info.dart';
import '../../domain/entities/financial_score.dart';
import '../../domain/usecases/calculate_score_usecase.dart';
import '../../../../core/utils/validators.dart';

class FinancialFormController {
  double? annualIncome;
  double? monthlyCosts;

  String? validateAnnualIncome(String? value) {
    final numValue = double.tryParse(value ?? '');
    return Validators.validateRequired(numValue, 'Annual income');
  }

  String? validateMonthlyCosts(String? value) {
    final numValue = double.tryParse(value ?? '');
    return Validators.validateRequired(numValue, 'Monthly costs');
  }

  bool get isValid =>
      annualIncome != null &&
      annualIncome! > 0 &&
      monthlyCosts != null &&
      monthlyCosts! > 0;

  FinancialScore calculateScore() {
    final useCase = CalculateScoreUseCase();
    return useCase(
      FinancialInfo(annualIncome: annualIncome!, monthlyCosts: monthlyCosts!),
    );
  }
}
