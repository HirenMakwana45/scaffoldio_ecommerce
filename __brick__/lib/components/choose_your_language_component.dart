import 'package:flutter/material.dart';

import '../extensions/widgets.dart';

class ChooseYourLanguageComponent extends StatefulWidget {
  const ChooseYourLanguageComponent({super.key});

  @override
  State<ChooseYourLanguageComponent> createState() => _ChooseYourLanguageComponentState();
}

class _ChooseYourLanguageComponentState extends State<ChooseYourLanguageComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        "Choose your language",
        center: true,
        context: context,
      ),
    );
  }
}
