import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ngenius_payment_gatway/ngenius_payment_gatway_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelNgeniusPaymentGatway platform = MethodChannelNgeniusPaymentGatway();
  const MethodChannel channel = MethodChannel('ngenius_payment_gatway');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
