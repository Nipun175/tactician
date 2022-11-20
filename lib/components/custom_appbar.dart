// ignore_for_file: prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title ;
  final List<Widget>? actions;
  CustomAppBar({Key? key,required this.title, this.actions}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    var appBackgroundColor= Colors.black;
    // var appWhiteColor = Colors.white;
    return AppBar(
      centerTitle: false,
      toolbarHeight: 50,
      backgroundColor: appBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Align(
        alignment: Alignment.centerRight,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 30,
          ),
        ),
      ),
      actions: actions,
    );
  }
}
