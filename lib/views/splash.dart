import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:story_app/extensions/context_extension.dart';
import 'package:story_app/providers/stories_provider.dart';
import 'package:story_app/views/list_story.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.bounceIn,
  );

  @override
  void initState() {
    super.initState();
    final storiesProv = context.read<StoriesProvider>();

    Future.microtask(() async => storiesProv.getAllStories(context));
    Future.delayed(
      const Duration(milliseconds: 2500),
      () => context.goNamed(ListStoryScreen.routeName),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.primaryContainer,
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Image.asset('assets/images/social.png'),
        ),
      ),
    );
  }
}
