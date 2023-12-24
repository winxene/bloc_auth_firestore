// score_field.dart
import 'package:flutter/material.dart';

class ScoreField extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController valueController;
  final int index;

  ScoreField({
    required this.nameController,
    required this.valueController,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Score Name ${index + 1}',
            ),
          ),
        ),
        const SizedBox(width: 16.0), // Add some spacing between the fields
        Expanded(
          child: TextFormField(
            controller: valueController,
            decoration: InputDecoration(
              labelText: 'Score Value ${index + 1}',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
