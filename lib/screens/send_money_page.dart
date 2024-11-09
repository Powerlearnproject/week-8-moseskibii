import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class SendMoneyPage extends StatefulWidget {
  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final _formKey = GlobalKey<FormState>();
  String? recipientName;
  double? amount;
  String? paymentMethod;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Send Money')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Recipient Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter recipient name';
                  }
                  return null;
                },
                onChanged: (value) => recipientName = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null || double.parse(value) <= 0) {
                    return 'Please enter a positive amount';
                  }
                  return null;
                },
                onChanged: (value) => amount = double.tryParse(value),
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Payment Method'),
                value: paymentMethod,
                items: ['Credit Card', 'Debit Card', 'Bank Transfer'].map((String method) {
                  return DropdownMenuItem<String>(
                    value: method,
                    child: Text(method),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value;
                  });
                },
              ),
              SwitchListTile(
                title: Text('Mark as Favorite'),
                value: isFavorite,
                onChanged: (bool value) {
                  setState(() {
                    isFavorite = value;
                  });
                },
              ),
              SizedBox(height: 20),
              CustomButton(
                label: 'Send Money',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with the transaction
                    Navigator.pushNamed(context, '/dashboard');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

