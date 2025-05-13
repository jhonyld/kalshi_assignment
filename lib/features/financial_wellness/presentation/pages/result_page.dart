import 'package:flutter/material.dart';
import '../../domain/entities/financial_score.dart';

class ResultPage extends StatelessWidget {
  final FinancialScore score;
  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final result = _getResult(score);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Center(child: Image.asset('assets/logo.png', height: 64)),
                const SizedBox(height: 24),
                Text(
                  "Here's your financial wellness score.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        _ScoreBar(score: score),
                        const SizedBox(height: 24),
                        Text(
                          result['title']!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          result['message']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.indigo[900]!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 32,
                            ),
                          ),
                          child: const Text(
                            'Return',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Image.asset(
                    'assets/lock.png',
                    height: 40,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Your financial information is encrypted and secure. We\'ll never share or sell any of your personal data.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Map<String, String> _getResult(FinancialScore score) {
    switch (score) {
      case FinancialScore.healthy:
        return {
          'title': 'Congratulations!',
          'message': 'Your financial wellness score is Healthy.',
        };
      case FinancialScore.medium:
        return {
          'title': 'There is room for improvement.',
          'message': 'Your financial wellness score is Average.',
        };
      case FinancialScore.low:
        return {
          'title': 'Caution!',
          'message': 'Your financial wellness score is Unhealthy.',
        };
    }
  }
}

class _ScoreBar extends StatelessWidget {
  final FinancialScore score;
  const _ScoreBar({required this.score});

  @override
  Widget build(BuildContext context) {
    Color color;
    double percent;
    switch (score) {
      case FinancialScore.healthy:
        color = Colors.green;
        percent = 1.0;
        break;
      case FinancialScore.medium:
        color = Colors.amber;
        percent = 0.66;
        break;
      case FinancialScore.low:
        color = Colors.red;
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
