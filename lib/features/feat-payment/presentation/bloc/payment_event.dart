part of 'payment_bloc.dart';

abstract class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class PaymentSetup extends PaymentEvent {
  final int finalPrice;
  const PaymentSetup(this.finalPrice);

  @override
  List<Object?> get props => [finalPrice];
}

class PaymentStartRequest extends PaymentEvent {
  final BuildContext context;
  const PaymentStartRequest(this.context);

  @override
  List<Object> get props => [context];
}
