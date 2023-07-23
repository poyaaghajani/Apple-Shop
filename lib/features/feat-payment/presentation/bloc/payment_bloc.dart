import 'package:apple_shop/core/extensions/extract_value.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRequest _paymentRequest = PaymentRequest();

  PaymentBloc() : super(PaymentInit()) {
    on<PaymentSetup>(onPaymenSetup);
    on<PaymentStartRequest>(onPaymentStartRequest);
  }

  onPaymenSetup(PaymentSetup event, Emitter<PaymentState> emit) {
    emit(PaymentInit());
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setDescription('امیدواریم از خرید خود نهایت لذت را ببرید');
    _paymentRequest.setAmount(event.finalPrice);
    _paymentRequest.setCallbackURL('expertflutter://shop');
    _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
  }

  onPaymentStartRequest(PaymentStartRequest event, Emitter<PaymentState> emit) {
    emit(PaymentStart());
    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        launchUrl(
          Uri.parse(paymentGatewayUri!),
          mode: LaunchMode.externalApplication,
        );
      }

      linkStream.listen((deepLink) {
        if (deepLink!.toLowerCase().contains('authority')) {
          String? authority = deepLink.extractValueFromQuery('Authority');
          String? status = deepLink.extractValueFromQuery('Status');

          ZarinPal().verificationPayment(status!, authority!, _paymentRequest,
              (isPaymentSuccess, refID, paymentRequest) {
            if (isPaymentSuccess) {
              CustomSnackbar.showSnack(
                  event.context, 'خرید شما با موفقیت انجام شد');
            } else {
              CustomSnackbar.showSnack(event.context, 'خرید انجام نشد');
            }
          });
        }
      });
    });
  }
}
