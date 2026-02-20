import 'package:flutter/material.dart';

import '../extensions/widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Payment", center: true, context: context),
    );
  }
}
