import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

Widget titleAnimation() {
  return Align(
    alignment: Alignment.topLeft,
    child: TextAnimator(
      'GIPHY',
      incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
      atRestEffect: WidgetRestingEffects.bounce(),
      outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
      style: const TextStyle(
        color: Colors.pink,
        fontWeight: FontWeight.bold,
        letterSpacing: -2,
        fontSize: 70,
        shadows: [
          Shadow(
            color: Colors.purple,
            offset: Offset(2.0, 2.0),
            blurRadius: 2.0,
          ),
        ],
      ),
    ),
  );
}
