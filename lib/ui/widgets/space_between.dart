import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:flutter/material.dart';

class SpaceBetween extends StatelessWidget {
  final double _size;
  const SpaceBetween(
      {super.key, double size = edgeInsertsValue, double times = 1})
      : _size = size * times;

  @override
  Widget build(BuildContext context) => SizedBox(width: _size, height: _size);
}
