class CreditCardState {
  final String cardNumber;
  final String cardHolder;
  final String expiration;
  final String cvvNumber;
  final String errorMessage;

  CreditCardState({
    this.cardNumber = '',
    this.cardHolder = '',
    this.expiration = '',
    this.cvvNumber = '',
    this.errorMessage = '',
  });

  CreditCardState copyWith({
    String? cardNumber,
    String? cardHolder,
    String? expiration,
    String? cvv,
    String? errorMessage,
  }) {
    return CreditCardState(
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolder: cardHolder ?? this.cardHolder,
      expiration: expiration ?? this.expiration,
      cvvNumber: cvv ?? cvvNumber,
      errorMessage:errorMessage  ?? this.errorMessage,
    );
  }
}
