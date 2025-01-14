import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'ngenius_payment_gatway_platform_interface.dart';

/// An implementation of [NgeniusPaymentGatwayPlatform] that uses method channels.
class MethodChannelNgeniusPaymentGatway extends NgeniusPaymentGatwayPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('ngenius_payment_gatway');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
