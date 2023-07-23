import 'package:apple_shop/features/feat-payment/presentation/utils/payment_handler.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentHandler paymentHandler;

  PaymentBloc(this.paymentHandler) : super(PaymentInit()) {
    on<PaymentSetup>(onPaymenSetup);
    on<PaymentStartRequest>(onPaymentStartRequest);
  }

  onPaymenSetup(PaymentSetup event, Emitter<PaymentState> emit) {
    emit(PaymentInit());
    paymentHandler.initPaymentRequest(event.finalPrice);
  }

  onPaymentStartRequest(PaymentStartRequest event, Emitter<PaymentState> emit) {
    emit(PaymentCompleted());
    paymentHandler.sendPaymentRequest();
    paymentHandler.verifyPaymentRequest(event.context);
  }
}
