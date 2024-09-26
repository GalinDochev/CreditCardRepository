import 'package:debit_card_scanner/screens/bloc/credit_card_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:debit_card_scanner/widgets/card_widget.dart';
import 'package:debit_card_scanner/widgets/text_form_widget.dart';

import 'bloc/credit_card_bloc.dart';
import 'bloc/credit_card_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController cardHolderController = TextEditingController();
    final TextEditingController expirationController = TextEditingController();
    final TextEditingController cvvController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => CreditCardBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Credit Card APP SCANNER'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BlocBuilder<CreditCardBloc, CreditCardState>(
              builder: (context, state) {
                return Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CreditCardWidget(
                        color: Colors.blueAccent,
                        cardNumber: state.cardNumber.isNotEmpty
                            ? state.cardNumber
                            : '**** **** **** ****',
                        cardHolder: state.cardHolder.isNotEmpty
                            ? state.cardHolder
                            : 'John Doe',
                        cardExpiration: state.expiration.isNotEmpty
                            ? state.expiration
                            : 'MM/YY',
                        bankName: 'MasterCard',
                        logoPath: 'assets/logos/mastercard.png',
                        cvvCardNumber: state.cvvNumber,
                      ),
                      const SizedBox(height: 20),

                      TextFieldWidget(
                        hintText: 'Card Number',
                        prefixIcon: Icons.credit_card,
                        controller: cardNumberController,
                        onChanged: (value) {
                          final sanitizedValue = value.replaceAll(' ', '');
                          context.read<CreditCardBloc>().add(UpdateCardNumber(cardNumber: sanitizedValue));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a card number';
                          }

                          final sanitizedValue = value.replaceAll(' ', '');

                          if (sanitizedValue.length != 16 || !RegExp(r'^\d+$').hasMatch(sanitizedValue)) {
                            return 'Card number must be exactly 16 digits and contain only digits';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      TextFieldWidget(
                        hintText: 'Full Name',
                        prefixIcon: Icons.person,
                        controller: cardHolderController,
                        onChanged: (value) {
                          context.read<CreditCardBloc>().add(UpdateCardHolder(cardHolder: value));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          if (!RegExp(r"^[a-zA-Z]+\s+[a-zA-Z]+$").hasMatch(value)) {
                            return 'Name must contain only letters and must include both first and last names';
                          }

                          List<String> nameParts = value.trim().split(' ');
                          if (nameParts.length < 2) {
                            return 'Please enter both first and last name';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFieldWidget(
                        hintText: 'MM/YY',
                        prefixIcon: Icons.calendar_today,
                        controller: expirationController,
                        onChanged: (value) {
                          context.read<CreditCardBloc>().add(UpdateCardExpiration(expiration: value));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter expiration date';
                          }
                          final RegExp expFormat = RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$');
                          if (!expFormat.hasMatch(value)) {
                            return 'Invalid expiration date format. Use MM/YY';
                          }

                          final int month = int.parse(value.substring(0, 2));
                          final int year = int.parse(value.substring(3));

                          if (month < 1 || month > 12) {
                            return 'Invalid month. Must be between 01 and 12';
                          }

                          if (year < 24) {
                            return 'Invalid year. Must be 2024 or later';
                          }

                          if (month < 10 && year == 24) {
                            return 'card expired';
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      TextFieldWidget(
                        hintText: 'CVV',
                        prefixIcon: Icons.lock,
                        controller: cvvController,
                        onChanged: (value) {
                          context.read<CreditCardBloc>().add(UpdateCardCvvNumber(cvvNumber: value));
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter CVV';
                          }
                          final RegExp cvvFormat = RegExp(r'^\d{3}$');
                          if (!cvvFormat.hasMatch(value)) {
                            return 'CVV must be exactly 3 digits';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('All inputs are valid!')),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Please correct the errors')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
