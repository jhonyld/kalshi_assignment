import 'package:flutter/material.dart';
import 'package:kalshi_assignment/views/widgets/score_bar.dart';
import '../models/financial_score.dart';

class ResultPage extends StatelessWidget {
  final FinancialScore score;
  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    final result = _getResult(score);

    return Scaffold(
      backgroundColor: Color(0xFFF4F8FA),
      appBar: AppBar(
        title: const Text(
          'Kalshi',
          style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Here\'s your ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF001C95),
                        ),
                      ),
                      TextSpan(
                        text: "financial wellness\nscore.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF001C95),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        Center(
                          child: Image.asset('assets/logo.png', height: 64),
                        ),
                        const SizedBox(height: 12),
                        ScoreBar(score: score),
                        const SizedBox(height: 24),
                        Text(
                          result['title']!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1E2A32),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Text(
                          result['message']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4D6475),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                color: Colors.indigo[900]!,
                                width: 2,
                              ),
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
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF001C95),
                              ),
                            ),
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
          'message': 'Your financial wellness score is\nHealthy.',
        };
      case FinancialScore.medium:
        return {
          'title': 'There is room for improvement.',
          'message': 'Your financial wellness score is\nAverage.',
        };
      case FinancialScore.low:
        return {
          'title': 'Caution!',
          'message': 'Your financial wellness score is\nUnhealthy.',
        };
    }
  }
}
