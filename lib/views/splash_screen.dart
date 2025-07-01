import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/route_names.dart';
import 'utils/helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(RouteNames.introduction);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: Center(
        child: Image.asset('assets/images/logo and title.png', width: 123),
      ),
    );
  }
}
