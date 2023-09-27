import 'package:flutter/material.dart';

class IconAnimation extends StatefulWidget {
  const IconAnimation({super.key, required this.icon});

  final Icon icon;

  @override
  _IconAnimationState createState() => _IconAnimationState();
}

class _IconAnimationState extends State<IconAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    // Create a Tween to specify the range of the animation (up and down)
    // Adjust value for more movement
    Tween<Offset> tween = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 30),
    );

    // Create an Animation using the Tween and AnimationController
    _animation = tween.animate(_controller);

    // Add a listener to update the widget when the animation value changes
    _controller.addListener(() {
      setState(() {});
    });

    // Start the animation (forward and backward continuously)
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the AnimationController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: _animation.value,
      child: widget.icon,
    );
  }
}
