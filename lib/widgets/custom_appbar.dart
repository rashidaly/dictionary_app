import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, '/',);
        }, icon: const Icon(Icons.arrow_back_ios,
          color: Colors.black,
        ))
      ],

    );
  }
}
