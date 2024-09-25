import 'package:flutter/material.dart';

// A reusable widget to build a credit card
class CreditCardWidget extends StatelessWidget {
  final Color color;
  final String cardNumber;
  final String cardHolder;
  final String cardExpiration;
  final String bankName;
  final String logoPath;

  // Constructor to accept required values for credit card
  const CreditCardWidget({
    super.key,
    required this.color,
    required this.cardNumber,
    required this.cardHolder,
    required this.cardExpiration,
    required this.bankName,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 230,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  bankName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                Image.asset(
                  logoPath,
                  height: 60,
                  width: 60,
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  "assets/images/chip.png",
                  height: 50,
                  width: 60,
                ),
                const SizedBox(width: 8),
                Image.asset(
                  "assets/icons/contact_less.png",
                  height: 30,
                  width: 30,
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
                  label: 'CARDHOLDER',
                  value: cardHolder,
                ),
                _buildDetailsBlock(label: 'VALID THRU', value: cardExpiration),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the details section on the card (CARDHOLDER and VALID THRU)
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            letterSpacing: .5,
          ),
        )
      ],
    );
  }
}
