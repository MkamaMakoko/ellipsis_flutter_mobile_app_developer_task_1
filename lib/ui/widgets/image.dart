import 'package:ellipsis_digital_commerce/constants.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  const ImageWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: BorderRadius.circular(roundedBorderRadius),
      child: Image.network(url));
}
