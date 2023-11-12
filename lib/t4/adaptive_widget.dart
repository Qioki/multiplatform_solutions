import 'package:flutter/material.dart';

class AdaptiveWidget extends StatelessWidget {
  const AdaptiveWidget({this.narrow, this.wide, super.key});

  final Widget? narrow;
  final Widget? wide;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 720 && wide != null) {
      return wide!;
    } else {
      return narrow!;
    }
  }
}
