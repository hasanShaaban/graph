import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'dart:developer' as dev;

class ReactButton extends StatefulWidget {
  const ReactButton({super.key, required this.height, required this.width, required this.buttonColor, required this.circleColor});

  final double height;
  final double width;
  final Color buttonColor, circleColor;

  @override
  State<ReactButton> createState() => _ReactButtonState();
}

class _ReactButtonState extends State<ReactButton>
    with TickerProviderStateMixin {
  late AnimationController arcController;
  late Animation<double> arcAnimation;

  late AnimationController reactController;
  late Animation<double> reactAnimation;

  bool _showArc = false;
  bool _showReacts = false;
  bool isPressed = false;
  String icon = Assets.iconsHeart;
  Color color = Constants.lightSecondryColor;

  final List<String> reacts = [
    Assets.iconsReactLove,
    Assets.iconsReactLaugh,
    Assets.iconsReactClap,
  ];

  @override
  void initState() {
    super.initState();
    arcController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    arcAnimation = CurvedAnimation(parent: arcController, curve: Curves.ease)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() => _showReacts = true);
          reactController.forward();
        }
      });

    reactController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    reactAnimation = CurvedAnimation(
      parent: reactController,
      curve: Curves.easeInOutQuint, // or Curves.easeOutBack, etc.
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
    arcController.reverse().whenComplete(
      () => setState(() => _showArc = false),
    );
    reactController.reverse().whenComplete(
      () => setState(() => _showReacts = false),
    );
  }

  @override
  void dispose() {
    arcController.dispose();
    reactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double radius = (widget.width * 138 / 412) / 2;
    final buttonSize = widget.width * 60 / 412;

    return Positioned.fill(
      bottom: -(widget.height * 60 / 890) / 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          fit: StackFit.passthrough,
          children: [
            if (_showArc)
              Positioned(
                bottom: -widget.height * 138 / 890 / 2,
                child: AnimatedBuilder(
                  animation: arcController,
                  builder: (_, __) {
                    return CustomPaint(
                      painter: AnimatedHalfCirclePainter(
                        color: widget.circleColor,
                        context: context,
                        progress: arcAnimation.value,
                        screenWidth: widget.width,
                      ),
                      size: Size(radius * 2, radius),
                    );
                  },
                ),
              ),
            if (_showReacts)
              ...List.generate(reacts.length, (index) {
                double angle = pi * (index / (reacts.length - 1));
                if (index == 0) angle += pi / 7;
                if (index == reacts.length - 1) angle -= pi / 7;
                final dx = radius * cos(angle);
                final dy = radius * sin(angle);
                return AnimatedBuilder(
                  animation: reactController,
                  builder: (_, __) {
                    return Positioned(
                      bottom: dy * reactAnimation.value,
                      left:
                          dx * reactAnimation.value +
                          widget.width * 138 / 412 / 2 +
                          15,
                      child: Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            dev.log('tapped');
                            setState(() {
                              icon = reacts[index];
                            });
                            _onTapCancel();
                          },
                          child: Opacity(
                            opacity: reactAnimation.value,
                            child: SvgPicture.asset(
                              reacts[index],
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            // React button
            Listener(
              onPointerDown: (_) => setState(() => isPressed = true),
              onPointerUp: (_) => setState(() => isPressed = false),
              onPointerCancel: (_) => setState(() => isPressed = false),
              child: GestureDetector(
                onLongPress: _onLongPress,
                onLongPressCancel: () => _onTapCancel(),
                onDoubleTap: () {
                  setState(() {
                    if (icon == Assets.iconsHeart) {
                      icon = Assets.iconsReactLove;
                    } else {
                      icon = Assets.iconsHeart;
                    }
                  });
                },
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: BoxDecoration(
                    color:
                        isPressed
                            ? Constants2.dividerColor(context)
                            : widget.buttonColor,
                    borderRadius: BorderRadius.circular(buttonSize),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          icon,
                          width: 24,
                          color:
                              icon == Assets.iconsHeart
                                  ? Constants2.darkPrimaryColor(context)
                                  : null,
                        ),
                        SizedBox(height: 3),
                        Text(
                          '2.3k',
                          style: AppTextStyle.cairoRegular12.copyWith(
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(
              width: widget.width * 138 / 412 * 1.5,
              height: widget.height * 60 / 412 * 0.9,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedHalfCirclePainter extends CustomPainter {
  final double progress; // 0.0 to 1.0
  final double screenWidth;
  final BuildContext context;
  final Color color;
  AnimatedHalfCirclePainter( {
    required this.color,
    required this.context,
    required this.screenWidth,
    required this.progress,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = screenWidth * 138 / 412 - screenWidth * 60 / 412;

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
