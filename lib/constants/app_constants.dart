import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstants {
  static const String appTitle = 'Credit Card SCANNER APP';
  static const String cardNumberHint = 'Card Number';
  static const String nameHint = 'Full Name';
  static const String expirationHint = 'MM/YY';
  static const String cvvHint = 'CVV';
  static const String submitButtonText = 'Submit';
  static const String fillCardDetailsButtonText = 'Fill Card Details';
  static const String cardNumberEmptyMessage = 'Please enter a card number';
  static const String cardNumberDigitMessage = 'Card number must contain only digits';
  static const String cardNumberLengthMessage = 'Card number must be exactly 16 digits';
  static const String nameEmptyMessage = 'Please enter your name';
  static const String nameLetterMessage = 'Name must contain only letters';
  static const String namePartsMessage = 'Please enter both first and last name';
  static const String expirationEmptyMessage = 'Please enter expiration date';
  static const String expirationFormatMessage = 'Invalid expiration date format. Use MM/YY';
  static const String monthInvalidMessage = 'Invalid month. Must be between 01 and 12';
  static const String cardExpiredMessage = 'Card expired';
  static const String cvvEmptyMessage = 'Please enter CVV';
  static const String cvvFormatMessage = 'CVV must be exactly 3 digits';
  static const String validationSuccessMessage = 'All inputs are valid!';
  static const String validationErrorMessage = 'Please correct the errors';
  static const String scanningErrorMessage = 'Scanning Incomplete. Please try again or fill out the information manually';
  static const String cardholderLabel = 'CARDHOLDER';
  static const String validThruLabel = 'VALID THRU';
  static const String chipImagePath = "assets/images/chip.png";
  static const String contactLessIconPath = "assets/icons/contact_less.png";
  static const String defaultCardNumber = '**** **** **** ****';
  static const String defaultCardHolder = 'John Doe';
  static const String bankName = 'MasterCard';
  static const String logoPath = 'assets/logos/mastercard.png';
  static const double cardElevation = 4.0;
  static const double cardRadius = 14.0;
  static const double cardHolderFontSize = 20.0;
  static const double cardNumberFontSize = 21.0;
  static const double detailsLabelFontSize = 10.0;
  static const double detailsValueFontSize = 15.0;
  static const double letterSpacing = 1.0;
  static const double detailsLetterSpacing = 0.5;
  static const Color textColor = Colors.white;
  static const Color detailsTextColor = Colors.black;
}
