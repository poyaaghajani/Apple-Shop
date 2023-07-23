import 'package:apple_shop/core/extensions/extract_value.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/features/feat-payment/presentation/utils/url_handler.dart';
import 'package:flutter/widgets.dart';
import 'package:uni_links/uni_links.dart';
import 'package:zarinpal/zarinpal.dart';

abstract class PaymentHandler {
  Future<void> initPaymentRequest(int finalPrice);
  Future<void> sendPaymentRequest();
  Future<void> verifyPaymentRequest(BuildContext context);
}

class ZarinpalPayment extends PaymentHandler {
  final PaymentRequest _paymentRequest = PaymentRequest();
  final Urlhandler _urlhandler = MyUrlLuncher();

  @override
  Future<void> initPaymentRequest(int finalPrice) async {
    _paymentRequest.setIsSandBox(true);
    _paymentRequest.setDescription('امیدواریم از خرید خود نهایت لذت را ببرید');
    _paymentRequest.setAmount(finalPrice);
    _paymentRequest.setCallbackURL('expertflutter://shop');
    _paymentRequest.setMerchantID('d645fba8-1b29-11ea-be59-000c295eb8fc');
  }

  @override
  Future<void> sendPaymentRequest() async {
    ZarinPal().startPayment(_paymentRequest, (status, paymentGatewayUri) {
      if (status == 100) {
        _urlhandler.myUrlLuncher(paymentGatewayUri);
      }
    });
  }

  @override
  Future<void> verifyPaymentRequest(BuildContext context) async {
    linkStream.listen((deepLink) {
      if (deepLink!.toLowerCase().contains('authority')) {
        String? authority = deepLink.extractValueFromQuery('Authority');
        String? status = deepLink.extractValueFromQuery('Status');

        ZarinPal().verificationPayment(status!, authority!, _paymentRequest,
            (isPaymentSuccess, refID, paymentRequest) {
          if (isPaymentSuccess) {
            CustomSnackbar.showSnack(context, 'خرید شما با موفقیت انجام شد');
          } else {
            CustomSnackbar.showSnack(context, 'خرید انجام نشد');
          }
        });
      }
    });
  }
}
