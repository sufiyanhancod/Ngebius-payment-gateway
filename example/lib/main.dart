import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ngenius_payment_gatway/ngenius_payment_gatway.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _ngeniusPaymentGatway = NgeniusPaymentGatway();

  Future<void> startPayment() async {
    try {
      final result = await _ngeniusPaymentGatway.initiateCardPayment(
        gatewayUrl: 'YOUR_GATEWAY_URL',
        amount: 100.0,
        currency: 'AED',
        orderReference: 'ORDER_REF_123',
      );

      print('Payment result: $result');
    } catch (e) {
      print('Payment error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ngenius Payment Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: startPayment,
            child: Text('Start Payment'),
          ),
        ),
      ),
    );
  }
}
