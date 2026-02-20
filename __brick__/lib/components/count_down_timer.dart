import 'dart:async';
import 'package:flutter/material.dart';
import 'package:{{name.snakeCase()}}/Utils/app_colors.dart';
import 'package:{{name.snakeCase()}}/extensions/text_styles.dart';

class CountdownTimer extends StatefulWidget {
  final Duration duration;

  const CountdownTimer({Key? key, required this.duration}) : super(key: key);

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Duration remaining;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remaining = widget.duration;

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (mounted) {
        setState(() {
          if (remaining.inSeconds > 0) {
            remaining = remaining - const Duration(seconds: 1);
          } else {
            timer?.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final hours = twoDigits(remaining.inHours);
    final minutes = twoDigits(remaining.inMinutes.remainder(60));
    final seconds = twoDigits(remaining.inSeconds.remainder(60));

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Closing in : ",style: secondaryTextStyle(color: Colors.grey),),
        _timeBox(hours),
        const Text(" : "),
        _timeBox(minutes),
        const Text(" : "),
        _timeBox(seconds),
      ],
    );
  }

  Widget _timeBox(String value) {
    return Container(
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF1E8E0), // Beige-like background
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        ),
      ),
    );
  }
}
