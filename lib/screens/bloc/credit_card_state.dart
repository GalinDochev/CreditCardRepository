class CreditCardState {
  final String cardNumber;
  final String cardHolder;
  final String expiration;
  final String cvvNumber;

  CreditCardState({
    this.cardNumber = '',
    this.cardHolder = '',
    this.expiration = '',
    this.cvvNumber = '',
  });

  CreditCardState copyWith({
    String? cardNumber,
    String? cardHolder,
    String? expiration,
    String? cvv,
  }) {
    return CreditCardState(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolder: cardHolder ?? this.cardHolder,
      expiration: expiration ?? this.expiration,
      cvvNumber: cvv ?? cvvNumber,
    );
  }
}
