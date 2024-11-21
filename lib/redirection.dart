import 'package:flutter/material.dart';

class Redirection extends StatelessWidget {

  final Widget onPhone;
  final Widget onTablet;
  final Widget onDesktop;

  const Redirection({super.key, required this.onPhone, required this.onTablet, required this.onDesktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
         if(constraints.maxWidth < 764){
          return onPhone;
         }else if(constraints.maxWidth < 1024){
          return onTablet;
         }else{
          return onDesktop;
         }
      }
    );
  }
}