import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/colors.dart';
import '../../home/views/widgets/footer_section.dart';
import '../widgets/checkout_step_indicator.dart';
import 'steps/address_step.dart';
import 'steps/shipping_step.dart';
import 'steps/payment_step.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 1;

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() => _currentStep++);
    } else {
      // Logic for complete order
      context.go('/');
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    } else {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
      ),
      body: Column(
        children: [
          CheckoutStepIndicator(currentStep: _currentStep),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [_buildCurrentStep(), const FooterSection()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentStep() {
    switch (_currentStep) {
      case 1:
        return AddressStep(onNext: _nextStep, onBack: _previousStep);
      case 2:
        return ShippingStep(onNext: _nextStep, onBack: _previousStep);
      case 3:
        return PaymentStep(onNext: _nextStep, onBack: _previousStep);
      default:
        return AddressStep(onNext: _nextStep, onBack: _previousStep);
    }
  }
}
