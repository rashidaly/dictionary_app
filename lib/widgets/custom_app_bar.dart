import 'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  final String title;
  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Container(
        color: Colors.greenAccent,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child:  Text(title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Avenir',
            fontWeight: FontWeight.bold,
          ),
        ),

      ),
      iconTheme: const IconThemeData(color: Colors.greenAccent,),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50.0);
}
