class CreditCardState {
  final String cardNumber;
  final String cardHolder;
  final String expiration;
  final String cvvNumber;
  final String errorMessage;
  final bool scanSuccessful;

  CreditCardState({
    this.cardNumber = '',
    this.cardHolder = '',
    this.expiration = '',
    this.cvvNumber = '',
    this.errorMessage = '',
    this.scanSuccessful = false,
  });

  CreditCardState copyWith({
    String? cardNumber,
    String? cardHolder,
    String? expiration,
    String? cvv,
    String? errorMessage,
    bool? scanSuccessful,
  }) {
    return CreditCardState(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolder: cardHolder ?? this.cardHolder,
      expiration: expiration ?? this.expiration,
      cvvNumber: cvv ?? cvvNumber,
      errorMessage: errorMessage ?? this.errorMessage,
      scanSuccessful: scanSuccessful ?? this.scanSuccessful,
    );
  }
}
