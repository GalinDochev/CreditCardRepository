import 'package:bloc/bloc.dart';
import 'credit_card_event.dart';
import 'credit_card_state.dart';

class CreditCardBloc extends Bloc<CreditCardEvent, CreditCardState> {
  CreditCardBloc() : super(CreditCardState()) {
    on<UpdateCardNumber>(_onUpdateCardNumber);
    on<UpdateCardHolder>(_onUpdateCardHolder);
    on<UpdateCardExpiration>(_onUpdateCardExpiration);
    on<UpdateCardCvvNumber>(_onUpdateCardCvvNumber);
    on<FillCardDetails>(_onFillCardDetails);
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

  Future<void> _onFillCardDetails(FillCardDetails event, Emitter<CreditCardState> emit) async {
    // TODO: MAKE THE LOGIC FOR AUTOMATIC FILLING
  }
}
