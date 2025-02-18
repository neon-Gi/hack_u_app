import 'package:flutter/material.dart';
import 'package:hack_u_app/main.dart';

class SinglePage extends StatefulWidget {
  const SinglePage({super.key});
  @override
  State<SinglePage> createState() => _SinglePageState();
}

class _SinglePageState extends State<SinglePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/title_screen/background_gray.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.07),
              Container(
                padding: const EdgeInsets.all(0.0),
                alignment: Alignment.center,
                width: screenWidth * 0.65,
                child: Image.asset("assets/single/setting_title.png",
                    fit: BoxFit.cover),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                alignment: Alignment.center,
                height: screenHeight * 0.5,
                child: IconButton(
                  icon: Image.asset("assets/title_screen/white_detail.png"),
                  onPressed: () {
                    null;
                  },
                ),
              ),
              // スタートボタン
              Container(
                alignment: Alignment.center,
                height: screenHeight * 0.1,
                child: IconButton(
                  icon: Image.asset("assets/title_screen/start.png"),
                  onPressed: () {
                    null;
                  },
                ),
              ),
              // 戻るボタン
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: screenWidth * 0.7),
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment: Alignment.topLeft,
                    width: screenWidth * 0.25,
                    child: IconButton(
                      icon: Image.asset(
                        "assets/title_screen/return.png",
                        fit: BoxFit.fill,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const MyHomePage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final Animatable<Offset> tween = Tween(
                                      begin: const Offset(-1.0, 0.0),
                                      end: Offset.zero)
                                  .chain(CurveTween(curve: Curves.easeInOut));
                              final Animation<Offset> offsetAnimation =
                                  animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
