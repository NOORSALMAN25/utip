import 'package:flutter/material.dart';

class BillAmountField extends StatelessWidget {
  const BillAmountField({
    super.key, required this.billAmount, required this.onChanged,
  });

  final String billAmount ;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged:(String value) {
        onChanged(value);
      } ,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Bill Amount',
        prefixIcon: Icon(Icons.attach_money),
        
      ),
    );
  }
}


