import 'package:flutter/material.dart';
import 'package:hhf_next_gen/ui/widgets/app_bar/app_bar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SizingInformation sizingInformation;

  const MyAppBar({Key? key, required this.sizingInformation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    switch (this.sizingInformation.deviceScreenType) {
      case DeviceScreenType.desktop:
        return AppBarDesktop();
        break;
      case DeviceScreenType.tablet:
        return AppBar(title: Text('Tablet'));
        break;
      case DeviceScreenType.mobile:
        return AppBar(title: Text('Mobile'));
        break;
      default:
        return Placeholder();
    }
  }

  @override
  // TODO: implement preferredSize
  // Size get preferredSize => throw UnimplementedError();
  Size get preferredSize => Size.fromHeight(56);
}
