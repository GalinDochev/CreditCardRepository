import 'package:debit_card_scanner/widgets/card_widget.dart'; // Assuming you have this widget
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
      // Directly provide the values to CreditCardWidget in the home property
      home:  Scaffold(
        appBar: AppBar(
          title: const Text('Credit Card UI'),
        ),
        body: const Center(
          child: CreditCardWidget(
            color: Colors.blueAccent, // Background color for the card
            cardNumber: '1234 5678 9012 3456', // Card number
            cardHolder: 'John Doe', // Cardholder name
            cardExpiration: '12/24', // Expiration date
            bankName: 'masterCard', // Bank name
            logoPath: 'assets/logos/mastercard.png', // Path to logo
          ),
        ),
      ),
    );
  }
}
