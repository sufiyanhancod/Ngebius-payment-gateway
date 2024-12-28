// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'ngenius_payment_gatway_platform_interface.dart';
import 'package:flutter/services.dart';

class NgeniusPaymentGatway {
  static const MethodChannel _channel = MethodChannel('ngenius_payment_gatway');

  Future<String?> getPlatformVersion() async {
    final version = await _channel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<Map<String, dynamic>> initiateCardPayment({
    required String gatewayUrl,
    required double amount,
    required String currency,
    required String orderReference,
  }) async {
    try {
      final result = await _channel.invokeMethod('initiateCardPayment', {
        'gatewayUrl': gatewayUrl,
        'amount': amount,
        'currency': currency,
        'orderReference': orderReference,
      });
      return Map<String, dynamic>.from(result);
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
