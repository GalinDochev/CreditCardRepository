import 'package:debit_card_scanner/widgets/card_widget.dart'; // Assuming you have this widget
import 'package:debit_card_scanner/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credit Card UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Credit Card UI'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Credit Card Widget Display
                const CreditCardWidget(
                  color: Colors.blueAccent,
                  // Background color for the card
                  cardNumber: '1234 5678 9012 3456',
                  // Card number
                  cardHolder: 'John Doe',
                  // Cardholder name
                  cardExpiration: '12/24',
                  // Expiration date
                  bankName: 'MasterCard',
                  // Bank name
                  logoPath: 'assets/logos/mastercard.png', // Path to logo
                ),
                const SizedBox(height: 20),

                TextFieldWidget(
                  context,
                  hintText: 'Card Number',
                  prefixIcon: Icons.credit_card,
                  onChanged: (value) {}, // Handle changes as needed
                ),

                const SizedBox(height: 12),

                // Cardholder Name Input Field
                TextFieldWidget(
                  context,
                  hintText: 'Full Name',
                  prefixIcon: Icons.person,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 12),

                // Expiration Date Input Field
                TextFieldWidget(
                  context,
                  hintText: 'MM/YY',
                  prefixIcon: Icons.calendar_today,
                  onChanged: (value) {}, // Handle changes as needed
                ),
                const SizedBox(height: 12),

                // CVV Input Field
                TextFieldWidget(
                  context,
                  hintText: 'CVV',
                  prefixIcon: Icons.lock,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
