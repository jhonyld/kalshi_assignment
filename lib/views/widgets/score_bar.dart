import 'package:flutter/material.dart';

import '../../models/financial_score.dart';

class ScoreBar extends StatelessWidget {
  final FinancialScore score;
  const ScoreBar({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Color color;
    double percent;
    switch (score) {
      case FinancialScore.healthy:
        color = Color(0xFF04C761);
        percent = 1.0;
        break;
      case FinancialScore.medium:
        color = Color(0xFFFFC032);
        percent = 0.66;
        break;
      case FinancialScore.low:
        color = Color(0xFFD32A36);
        percent = 0.33;
        break;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: LinearProgressIndicator(
        value: percent,
        backgroundColor: Colors.grey[300],
        color: color,
        minHeight: 12,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
