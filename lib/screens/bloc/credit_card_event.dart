abstract class CreditCardEvent {}

class UpdateCardNumber extends CreditCardEvent {
  final String cardNumber;

  UpdateCardNumber({required this.cardNumber});
}

class UpdateCardHolder extends CreditCardEvent {
  final String cardHolder;

  UpdateCardHolder({required this.cardHolder});
}

class UpdateCardExpiration extends CreditCardEvent {
  final String expiration;

  UpdateCardExpiration({required this.expiration});
}

class UpdateCardCvvNumber extends CreditCardEvent {
  final String cvvNumber;

  UpdateCardCvvNumber({required this.cvvNumber});
}

class FillCardDetails extends CreditCardEvent {
  FillCardDetails();
}

class ClearErrorMessage extends CreditCardEvent {}
