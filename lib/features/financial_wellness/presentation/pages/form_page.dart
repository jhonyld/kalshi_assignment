import 'package:flutter/material.dart';
import '../controllers/financial_form_controller.dart';
import 'result_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final formKey = GlobalKey<FormState>();
  final controller = FinancialFormController();
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
      controller.annualIncome = double.parse(incomeController.text);
      controller.monthlyCosts = double.parse(costsController.text);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ResultPage(score: controller.calculateScore()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Center(child: Image.asset('assets/logo.png', height: 64)),
                const SizedBox(height: 24),
                Text(
                  "Let's find out your financial wellness score.",
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
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            'Financial wellness test',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Enter your financial information below',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[600],
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Text('Annual income'),
                          TextFormField(
                            controller: incomeController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/dollar-sign.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            validator: controller.validateAnnualIncome,
                          ),
                          const SizedBox(height: 16),
                          Text('Monthly Costs'),
                          TextFormField(
                            controller: costsController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                  'assets/dollar-sign.png',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                            validator: controller.validateMonthlyCosts,
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: submit,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: const Text(
                              'Continue',
                              style: TextStyle(fontSize: 20),
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
}
