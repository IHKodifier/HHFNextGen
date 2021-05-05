import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _url =
        'https://pbs.twimg.com/profile_images/2424513983/HF_400x400.jpg';
    return SizedBox(
      height: 150,
      width: 150,
      child: Image.network(_url),
    );
  }
}
