import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final String url;
  const IconContainer({super.key, required this.url  }) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.0,
      height: 200.0 ,
      child: Image.asset(url),
    );
  }
}