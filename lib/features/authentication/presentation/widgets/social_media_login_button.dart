import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/buton.dart';

class SocialMediaLoginButton extends StatelessWidget {
  final Function() onTap;
  final String icon;
  const SocialMediaLoginButton({
    required this.onTap,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BButton(
      buttonColor: socialMediaButtonColor,
      width: 62,
      height: 48,
      onTap: onTap,
      child: SvgPicture.asset(icon),
    );
  }
}
