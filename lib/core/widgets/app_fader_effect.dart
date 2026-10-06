import 'package:flutter/material.dart';

class AppFaderEffect extends StatelessWidget {
  final double height;

  final double opacity;

  final Duration duration;

  final Curve curve;

  final AlignmentGeometry alignment;

  final List<Color>? colors;

  final List<double>? stops;

  const AppFaderEffect({
    super.key,
    this.height = 110.0,
    this.opacity = 1.0,
    this.duration = const Duration(milliseconds: 250),
    this.curve = Curves.easeInOut,
    this.alignment = Alignment.bottomCenter,
    this.colors,
    this.stops,
  });

  @override
  Widget build(BuildContext context) {
    final gradientColors = colors ??
        [
          Colors.white.withValues(alpha: 0.0),
          Colors.white.withValues(alpha: 0.8),
          Colors.white,
        ];

    final gradientStops = stops ?? const [0.0, 0.65, 1.0];

    return Align(
      alignment: alignment,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedOpacity(
          opacity: opacity.clamp(0.0, 1.0),
          duration: duration,
          curve: curve,
          child: Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors,
                stops: gradientStops,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
