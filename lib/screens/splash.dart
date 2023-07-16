import 'package:demo/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/blocs/menu/menu_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<MenuBloc>().add(GetAllMenuEvent());
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 120,
        ),
      ),
    );
  }
}
