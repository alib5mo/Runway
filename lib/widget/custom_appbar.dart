import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({
    super.key,
    required this.title,
    required this.leading,
    required this.actions,
    this.onTap,
  });

  String title;
  String leading;
  String actions;
  VoidCallback? onTap;

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: preferredSize.height,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTap,
            child: SvgPicture.asset(leading, width: 24)),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SvgPicture.asset(actions, width: 24),
        ],
      ),
      
    );
  }
}
