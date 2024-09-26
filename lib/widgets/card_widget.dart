import 'package:debit_card_scanner/constants/app_constants.dart';
import 'package:debit_card_scanner/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final Color color;
  final String cardNumber;
  final String cardHolder;
  final String cardExpiration;
  final String bankName;
  final String logoPath;
  final String cvvCardNumber;

  const CreditCardWidget({
    super.key,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
    required this.bankName,
    required this.logoPath,
    required this.cvvCardNumber,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Scroll in case of overflow
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.setHorizontalPadding(context, 4),
            vertical: context.setVerticalPadding(context, 2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      bankName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: context.setWidth(15),
                    height: context.setHeight(7),
                    child: Image.asset(
                      logoPath,
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Image.asset(
                    AppConstants.chipImagePath,
                    height: context.setHeight(6),
                    width: context.setWidth(14),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    AppConstants.contactLessIconPath,
                    height: context.setHeight(4),
                    width: context.setWidth(10),
                  ),
                ],
              ),
              Text(
                cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  letterSpacing: 4,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDetailsBlock(
                    label: AppConstants.cardholderLabel,
                    value: cardHolder,
                  ),
                  _buildDetailsBlock(
                    label: AppConstants.validThruLabel,
                    value: cardExpiration,
                  ),
                ],
              ),
              _buildDetailsBlock(
                label: AppConstants.cvvHint,
                value: cvvCardNumber,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Small helper widget to build the details section on the card (CARDHOLDER and VALID THRU)
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: .5,
          ),
        ),
      ],
    );
  }
}
