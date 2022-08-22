import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_360_rotation_shopping_app/screens/home_screen.dart';
import 'package:flutter_360_rotation_shopping_app/themes/colors.dart';
import 'package:page_transition/page_transition.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _position;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 1000,
      ),
    );

    _position = Tween<double>(
      begin: 20,
      end: 50,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1),
      )..addListener(() {
          setState(() {});
        }),
    );

    _opacity = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 1),
      )..addListener(() {
          setState(() {});
        }),
    );

    _controller.repeat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: ColorPalette.myBlack,
        child: Stack(
          children: [
            Positioned(
              bottom: -250,
              child: Container(
                width: size.width,
                height: size.width + 250,
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 0.65,
                    colors: [
                      ColorPalette.myOrange,
                      ColorPalette.myBlack,
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(50),
                child: Image.asset('assets/img_nike_text.png'),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                padding: EdgeInsets.all(50),
                child: Image.asset(
                  'assets/img_shoes.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 2,
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'LIVE YOUR\nPERFECT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RichText(
                      text: TextSpan(
                        text:
                            'Smart, gorgeous & fashionable\ncollection makes you cool',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        int sensitivity = 8;
                        if (details.delta.dy < -sensitivity) {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: HomeScreen(),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        }
                      },
                      child: AbsorbPointer(
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Opacity(
                                  opacity: _opacity.value,
                                  child: Icon(
                                    CommunityMaterialIcons.chevron_double_up,
                                    color: Colors.white,
                                    size: 45,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text: 'Get Started',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
