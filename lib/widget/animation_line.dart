import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RevealSvgAnimation extends StatefulWidget {
  final String svgAssetPath;
  final Duration duration;

  const RevealSvgAnimation({
    super.key,
    required this.svgAssetPath,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  State<RevealSvgAnimation> createState() => _RevealSvgAnimationState();
}

class _RevealSvgAnimationState extends State<RevealSvgAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward(); // يبدأ التشغيل تلقائياً

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.topLeft,
            widthFactor: _animation.value, // التحكم في عرض الجزء المرئي
            child: SvgPicture.asset(widget.svgAssetPath, fit: BoxFit.contain),
          ),
        );
      },
    );
  }
}
