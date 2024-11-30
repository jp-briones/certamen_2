import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70.0,
      backgroundColor: Theme.of(context).primaryColor,
      foregroundColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: GestureDetector(
        onTap: () {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Image.asset(
            'lib/assets/images/cbb_logo.png',
            height: 50,
            width: 50,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.error, color: Colors.white);
            },
          ),
        ),
      ),
      title: Text(title),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
