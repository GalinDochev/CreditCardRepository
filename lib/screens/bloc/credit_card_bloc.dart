import 'package:bloc/bloc.dart';
import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:debit_card_scanner/constants/app_constants.dart';
import 'credit_card_event.dart';
import 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc() : super(CreditCardState()) {
    on<UpdateCardNumber>(_onUpdateCardNumber);
    on<UpdateCardHolder>(_onUpdateCardHolder);
    on<UpdateCardExpiration>(_onUpdateCardExpiration);
    on<UpdateCardCvvNumber>(_onUpdateCardCvvNumber);
    on<FillCardDetails>(_onFillCardDetails);
    on<ClearErrorMessage>(_onClearErrorMessage);
  }

  Future<void> _onUpdateCardNumber(
      UpdateCardNumber event, Emitter<CreditCardState> emit) async {
    emit(state.copyWith(cardNumber: event.cardNumber));
  }

  Future<void> _onUpdateCardHolder(
      UpdateCardHolder event, Emitter<CreditCardState> emit) async {
    emit(state.copyWith(cardHolder: event.cardHolder));
  }

  Future<void> _onUpdateCardExpiration(
      UpdateCardExpiration event, Emitter<CreditCardState> emit) async {
    emit(state.copyWith(expiration: event.expiration));
  }

  Future<void> _onUpdateCardCvvNumber(
      UpdateCardCvvNumber event, Emitter<CreditCardState> emit) async {
    emit(state.copyWith(cvv: event.cvvNumber));
  }
  Future<void> _onClearErrorMessage(
      ClearErrorMessage event, Emitter<CreditCardState> emit) async {
    emit(state.copyWith(errorMessage:''));
  }

  Future<void> _onFillCardDetails(FillCardDetails event, Emitter<CreditCardState> emit) async {
    final CardDetails? cardDetails = await CardScanner.scanCard(
      scanOptions: const CardScanOptions(
        scanCardHolderName: true,
        scanExpiryDate: true,
      ),
    );
    if (cardDetails != null) {
      final newState = state.copyWith(
        cardNumber: cardDetails.cardNumber,
        cardHolder: cardDetails.cardHolderName,
        expiration: cardDetails.expiryDate,
      );
      emit(newState);
    } else {
      emit(state.copyWith(errorMessage:AppConstants.scanningErrorMessage));
    }
  }
}