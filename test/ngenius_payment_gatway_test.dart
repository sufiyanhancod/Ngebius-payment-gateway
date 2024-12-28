import 'package:flutter_test/flutter_test.dart';
import 'package:ngenius_payment_gatway/ngenius_payment_gatway.dart';
import 'package:ngenius_payment_gatway/ngenius_payment_gatway_platform_interface.dart';
import 'package:ngenius_payment_gatway/ngenius_payment_gatway_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNgeniusPaymentGatwayPlatform
    with MockPlatformInterfaceMixin
    implements NgeniusPaymentGatwayPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NgeniusPaymentGatwayPlatform initialPlatform = NgeniusPaymentGatwayPlatform.instance;

  test('$MethodChannelNgeniusPaymentGatway is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNgeniusPaymentGatway>());
  });

  test('getPlatformVersion', () async {
    NgeniusPaymentGatway ngeniusPaymentGatwayPlugin = NgeniusPaymentGatway();
    MockNgeniusPaymentGatwayPlatform fakePlatform = MockNgeniusPaymentGatwayPlatform();
    NgeniusPaymentGatwayPlatform.instance = fakePlatform;

    expect(await ngeniusPaymentGatwayPlugin.getPlatformVersion(), '42');
  });
}
