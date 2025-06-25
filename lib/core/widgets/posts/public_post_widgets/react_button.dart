import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class ReactButton extends StatefulWidget {
  const ReactButton({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  State<ReactButton> createState() => _ReactButtonState();
}

class _ReactButtonState extends State<ReactButton>
    with TickerProviderStateMixin {
  bool _showReacts = false;
  bool _showArc = false;

  late AnimationController arcController;
  late AnimationController reactController;

  final double radius = 80;

  final List<String> reacts = [
    Assets.iconsReactLove,
    Assets.iconsReactLaugh,
    Assets.iconsReactClap,
  ];

  @override
  void initState() {
    super.initState();
    arcController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() => _showReacts = true);
        reactController.forward();
      }
    });

    reactController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _onLongPress() {
    setState(() {
      _showArc = true;
      _showReacts = false;
    });
    arcController.forward(from: 0);
    reactController.reset();
  }

  void _onTapCancel() {
    arcController.reverse();
    reactController.reverse();
    setState(() {
      _showArc = false;
      _showReacts = false;
    });
  }

  @override
  void dispose() {
    arcController.dispose();
    reactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final buttonSize = widget.width * 60 / 412;
    return Positioned.fill(
      bottom: -(widget.height * 60 / 890) / 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: GestureDetector(
          onLongPress: _onLongPress,
          onLongPressCancel: _onTapCancel,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              if (_showArc)
                AnimatedBuilder(
                  animation: arcController,
                  builder: (_, __) {
                    return CustomPaint(
                      painter: AnimatedHalfCirclePainter(
                        progress: arcController.value,
                      ),
                      size: Size(radius * 2, radius),
                    );
                  },
                ),
              if (_showReacts)
                ...List.generate(reacts.length, (index) {
                  final angle = pi * (index / (reacts.length - 1));
                  final dx = radius * cos(angle);
                  final dy = radius * sin(angle);
                  return AnimatedBuilder(
                    animation: reactController,
                    builder: (_, __) {
                      return Positioned(
                        bottom: radius + dy * reactController.value,
                        left:
                            (widget.width / 2) -
                            buttonSize / 2 +
                            dx * reactController.value,
                        child: Opacity(
                          opacity: reactController.value,
                          child: SvgPicture.asset(
                            reacts[index],
                            width: 24,
                            height: 24,
                          ),
                        ),
                      );
                    },
                  );
                }),
              Container(
                width: widget.width * 60 / 412,
                height: widget.height * 60 / 890,
                decoration: BoxDecoration(
                  color: Constants.lightSecondryColor,
                  borderRadius: BorderRadius.circular(buttonSize / 2),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(Assets.iconsHeart),
                      Text('234', style: AppTextStyle.cairoRegular12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedHalfCirclePainter extends CustomPainter {
  final double progress; // 0.0 to 1.0

  AnimatedHalfCirclePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, 0),
      radius: size.width / 2,
    );
    final double sweep = pi * progress;

    canvas.drawArc(rect, pi, sweep, false, paint);
  }

  @override
  bool shouldRepaint(covariant AnimatedHalfCirclePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
