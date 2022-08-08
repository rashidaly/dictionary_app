import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  String message;
   ErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}
