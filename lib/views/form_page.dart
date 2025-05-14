import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../viewmodels/financial_form_viewmodel.dart';
import 'result_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final viewModel = FinancialFormViewModel();
  final incomeController = TextEditingController();
  final costsController = TextEditingController();

  @override
  void dispose() {
    incomeController.dispose();
    costsController.dispose();
    super.dispose();
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      viewModel.annualIncome = double.parse(incomeController.text);
      viewModel.monthlyCosts = double.parse(costsController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: viewModel.calculateScore()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Let's find out your ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF001C95),
                        ),
                      ),
                      TextSpan(
                        text: "financial\nwellness score.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF001C95),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Card(
                  color: Colors.white,
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: Image.asset('assets/logo.png', height: 64),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Financial wellness test',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1E2A32),
                            ),
                            textAlign: TextAlign.center,
                          ),

                          Text(
                            'Enter your financial information below',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blueGrey[400],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Annual income',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1E2A32),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: incomeController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF4D6475),
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/dollar-sign.png',
                                  height: 16,
                                  width: 14,
                                ),
                              ),
                            ),
                            validator: viewModel.validateCurrency,
                          ),
                          const SizedBox(height: 16),

                          Text(
                            'Monthly Costs',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1E2A32),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextFormField(
                            controller: costsController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF4D6475),
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/dollar-sign.png',
                                  height: 16,
                                  width: 14,
                                ),
                              ),
                            ),
                            validator: viewModel.validateCurrency,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF001C95),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
