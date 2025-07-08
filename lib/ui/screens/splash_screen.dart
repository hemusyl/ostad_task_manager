import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_task_manager/ui/screens/sign_in_screen.dart';
import 'package:ostad_task_manager/ui/widgets/screen_background.dart';
import '../utils/asset_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name ='/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  @override

  void initState(){
    super.initState();
    _moveToNextScreen();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
          child: Center(
            child: SvgPicture.asset(
                AssetPaths.logoSvg),
          )),
    );
  }
}
