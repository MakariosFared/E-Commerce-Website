import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/typography.dart';

class PaymentStep extends StatefulWidget {
  final VoidCallback onNext;
  final VoidCallback onBack;

  const PaymentStep({super.key, required this.onNext, required this.onBack});

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  int selectedPaymentIndex = 0;
  bool sameAsBilling = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Text('Payment', style: AppTypography.h3),
        ),
        _buildPaymentTabs(),
        const SizedBox(height: 24),
        _buildCreditCard(),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildInputField('Cardholder Name'),
              const SizedBox(height: 16),
              _buildInputField('Card Number'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildInputField('Exp. Date')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildInputField('CVV')),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: sameAsBilling,
                    onChanged: (val) => setState(() => sameAsBilling = val!),
                    activeColor: Colors.black,
                  ),
                  Text(
                    'Same as billing address',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton(
                    onPressed: widget.onBack,
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton(
                    onPressed: widget.onNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Pay'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentTabs() {
    final List<String> tabs = ['Credit Card', 'PayPal', 'PayPal Credit'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(tabs.length, (index) {
          bool isSelected = selectedPaymentIndex == index;
          return GestureDetector(
            onTap: () => setState(() => selectedPaymentIndex = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? Colors.black : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tabs[index],
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCreditCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(24),
      height: 200,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.credit_card, color: Colors.white, size: 32),
              const Icon(Icons.wifi, color: Colors.white, size: 24),
            ],
          ),
          const Spacer(),
          Text(
            '4085  9536  8475  9530',
            style: AppTypography.h3.copyWith(
              color: Colors.white,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cardholder',
                    style: AppTypography.caption.copyWith(
                      color: Colors.white54,
                    ),
                  ),
                  Text(
                    'Cardholder Name',
                    style: AppTypography.bodyMedium.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-10, 0),
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: AppTypography.bodySmall.copyWith(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
