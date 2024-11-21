import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomAnimations {
  /// Animation pour une image
  static Widget animateImage(Widget child, int index) {
    return child
        .animate()
        .fadeIn(duration: 600.ms, delay: (index * 200).ms)
        .slide(begin: const Offset(0, 0.2));
  }

  /// Animation pour un élément de liste
  static Widget animateListTile(Widget child, int index) {
    return child
        .animate()
        .fadeIn(duration: 600.ms, delay: (index * 200).ms)
        .slide(begin: const Offset(0, 0.2));
  }
}
