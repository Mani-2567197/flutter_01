import 'package:flutter/material.dart';
import 'package:rental_app/utils/images_constants.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key, this.width = 200, this.height = 200});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImagesConstants.logo,
      width: width,
      height: height,
    );
  }
}
