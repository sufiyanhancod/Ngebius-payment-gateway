import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'ngenius_payment_gatway_method_channel.dart';

abstract class NgeniusPaymentGatwayPlatform extends PlatformInterface {
  /// Constructs a NgeniusPaymentGatwayPlatform.
  NgeniusPaymentGatwayPlatform() : super(token: _token);

  static final Object _token = Object();

  static NgeniusPaymentGatwayPlatform _instance = MethodChannelNgeniusPaymentGatway();

  /// The default instance of [NgeniusPaymentGatwayPlatform] to use.
  ///
  /// Defaults to [MethodChannelNgeniusPaymentGatway].
  static NgeniusPaymentGatwayPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NgeniusPaymentGatwayPlatform] when
  /// they register themselves.
  static set instance(NgeniusPaymentGatwayPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
