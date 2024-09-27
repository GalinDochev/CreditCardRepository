import 'package:debit_card_scanner/extensions/build_context_extensions.dart';
import 'package:debit_card_scanner/screens/bloc/credit_card_event.dart';
import 'package:debit_card_scanner/widgets/card_widget.dart';
import 'package:debit_card_scanner/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/app_constants.dart';
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
          forceMaterialTransparency: true,
          title: const Text(AppConstants.appTitle),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: BlocListener<CreditCardBloc, CreditCardState>(
              listener: (context, state) {
                if (state.errorMessage.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                  context.read<CreditCardBloc>().add(ClearErrorMessage());
                }

                // Check if the scan was successful and update the controllers
                if (state.scanSuccessful) {
                  cardNumberController.text = state.cardNumber;
                  cardHolderController.text = state.cardHolder;
                  expirationController.text = state.expiration;
                  cvvController.text = state.cvvNumber;
                }
              },
              child: BlocBuilder<CreditCardBloc, CreditCardState>(
                builder: (context, state) {
                  return Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Credit Card Widget
                        CreditCardWidget(
                          color: Colors.blueAccent,
                          cardNumber: state.cardNumber.isNotEmpty
                              ? state.cardNumber
                              : AppConstants.defaultCardNumber,
                          cardHolder: state.cardHolder.isNotEmpty
                              ? state.cardHolder
                              : AppConstants.defaultCardHolder,
                          cardExpiration: state.expiration.isNotEmpty
                              ? state.expiration
                              : AppConstants.expirationHint,
                          bankName: AppConstants.bankName,
                          logoPath: AppConstants.logoPath,
                          cvvCardNumber: state.cvvNumber.isNotEmpty
                              ? state.cvvNumber
                              : AppConstants.defaultCvvNumber,
                        ),
                        SizedBox(height: context.setHeight(3)),
                        TextFieldWidget(
                          hintText: AppConstants.cardNumberHint,
                          prefixIcon: Icons.credit_card,
                          controller: cardNumberController,
                          onChanged: (value) {
                            final sanitizedValue = value.replaceAll(' ', '');
                            context.read<CreditCardBloc>().add(
                                UpdateCardNumber(cardNumber: sanitizedValue));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.cardNumberEmptyMessage;
                            }

                            final sanitizedValue = value.replaceAll(' ', '');

                            if (!RegExp(r'^\d+$').hasMatch(sanitizedValue)) {
                              return AppConstants.cardNumberDigitMessage;
                            }

                            if (sanitizedValue.length != 16) {
                              return AppConstants.cardNumberLengthMessage;
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: context.setHeight(1.5)),
                        TextFieldWidget(
                          hintText: AppConstants.nameHint,
                          prefixIcon: Icons.person,
                          controller: cardHolderController,
                          onChanged: (value) {
                            final uppercasedValue = value.toUpperCase();
                            cardHolderController.value = TextEditingValue(
                              text: uppercasedValue,
                              selection: TextSelection.collapsed(
                                  offset: uppercasedValue.length),
                            );

                            context.read<CreditCardBloc>().add(
                                UpdateCardHolder(cardHolder: uppercasedValue));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.nameEmptyMessage;
                            }

                            if (!RegExp(r"^[A-Z\s]+$").hasMatch(value)) {
                              return AppConstants.nameLetterMessage;
                            }

                            List<String> nameParts =
                                value.trim().split(RegExp(r'\s+'));
                            if (nameParts.length < 2) {
                              return AppConstants.namePartsMessage;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: context.setHeight(1.5)),
                        TextFieldWidget(
                          hintText: AppConstants.expirationHint,
                          prefixIcon: Icons.calendar_today,
                          controller: expirationController,
                          onChanged: (value) {
                            String sanitizedValue = value.replaceAll('/', '');
                            if (sanitizedValue.length >= 2) {
                              sanitizedValue =
                                  '${sanitizedValue.substring(0, 2)}/${sanitizedValue.substring(2)}';
                            }
                            if (expirationController.text != sanitizedValue) {
                              expirationController.text = sanitizedValue;
                              expirationController.selection =
                                  TextSelection.collapsed(
                                      offset: sanitizedValue.length);
                            }
                            context.read<CreditCardBloc>().add(
                                UpdateCardExpiration(
                                    expiration: sanitizedValue));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.expirationEmptyMessage;
                            }
                            final RegExp expFormat =
                                RegExp(r'^(0[1-9]|1[0-2])/\d{2}$');
                            if (!expFormat.hasMatch(value)) {
                              return AppConstants.expirationFormatMessage;
                            }

                            final int month = int.parse(value.substring(0, 2));
                            final int year = int.parse(value.substring(3));

                            if (month < 1 || month > 12) {
                              return AppConstants.monthInvalidMessage;
                            }

                            if (month < 10 && year == 24 || year < 24) {
                              return AppConstants.cardExpiredMessage;
                            }

                            return null;
                          },
                        ),
                        SizedBox(height: context.setHeight(1.5)),
                        TextFieldWidget(
                          hintText: AppConstants.cvvHint,
                          prefixIcon: Icons.lock,
                          controller: cvvController,
                          onChanged: (value) {
                            context
                                .read<CreditCardBloc>()
                                .add(UpdateCardCvvNumber(cvvNumber: value));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppConstants.cvvEmptyMessage;
                            }
                            final RegExp cvvFormat = RegExp(r'^\d{3}$');
                            if (!cvvFormat.hasMatch(value)) {
                              return AppConstants.cvvFormatMessage;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: context.setHeight(2.5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(AppConstants
                                            .validationSuccessMessage)),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(AppConstants
                                            .validationErrorMessage)),
                                  );
                                }
                              },
                              child: const Text(AppConstants.submitButtonText),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context
                                    .read<CreditCardBloc>()
                                    .add(FillCardDetails());
                              },
                              child: const Text(
                                  AppConstants.scanCardDetailsButtonText),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
