import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;


  MyTextFormField({
    super.key,
    this.onChanged,
    this.keyboardType,
 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: TextFormField(
        
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: const InputDecoration(
            border: InputBorder.none, // Remove the default border
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          ),
        ),
      ),
    );
  }
}
