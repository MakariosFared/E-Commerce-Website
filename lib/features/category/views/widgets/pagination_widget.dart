import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  const PaginationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildArrowButton(Icons.chevron_left),
          const SizedBox(width: 8),
          _buildPageNumber('1', isSelected: true),
          const SizedBox(width: 8),
          _buildPageNumber('2'),
          const SizedBox(width: 8),
          _buildPageNumber('3'),
          const SizedBox(width: 8),
          const Text('...', style: TextStyle(color: Colors.grey, fontSize: 16)),
          const SizedBox(width: 8),
          _buildPageNumber('12'),
          const SizedBox(width: 8),
          _buildArrowButton(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildArrowButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Icon(icon, size: 24, color: Colors.black54),
    );
  }

  Widget _buildPageNumber(String number, {bool isSelected = false}) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        number,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
