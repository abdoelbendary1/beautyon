import 'package:flutter/material.dart';

class FormErrorWidget extends StatelessWidget {
  final String? errorMessage; // Error message to display

  const FormErrorWidget({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null || errorMessage!.isEmpty) {
      return SizedBox.shrink(); // Return nothing if no error
    }
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Spacing between field and error
      child: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 16),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              errorMessage!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
