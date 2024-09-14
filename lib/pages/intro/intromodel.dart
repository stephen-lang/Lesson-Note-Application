
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lessonnote/Constants/assets.dart';
import 'package:lessonnote/pages/auth/views/welcome_screen.dart';
import 'package:lessonnote/pages/intro/intro_slider.dart';
import 'package:lessonnote/pages/intro/intro_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});
  static String routeName = '/';
  static final imagesPath = <String>[
    Assets.imagesSVG.teaching,
    Assets.imagesSVG.studying,
    Assets.imagesSVG.onlineLearning,
     Assets.imagesSVG.researching
  ];

  static const Map<String, String> _introText = {
    'intro_page_title_1': 'Teach with confidence',
    'intro_page_subtile_1':
        'Get talking from lesson one, with conversation-based learning',
    'intro_page_title_2': 'Learn and administer lessons',
    'intro_page_subtile_2':
        'Build a learning habit and make it a part of your day',
    'intro_page_title_3': 'Lessons that work for you and your learners',
    'intro_page_subtile_3':
        'Learn and retain, with a mix of learning styles with the help of AI',
        'intro_page_title_4': 'According to the NaCCA curriculum',
    'intro_page_subtile_4':
        'Prepare your lesson to meet the highest Ghanaian standard of an educationist',
  };

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: IntroSlider(
                items: IntroView.imagesPath.map((item) {
                  return IntroModel(
                    title: IntroView._introText[
                        'intro_page_title_${(IntroView.imagesPath.indexOf(item) + 1)}']!,
                    imagePath: item,
                    subtitle: IntroView._introText[
                        'intro_page_subtile_${(IntroView.imagesPath.indexOf(item) + 1)}']!,
                  );
                }).toList(),
              )),
              Column(
                children: [
                  SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => WelcomeScreen()));
                        //context.go('/welcome');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 5, 117, 209),
                      ),
                      child: const Text(
                        'next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Do you have an Account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      TextButton(
                        onPressed: () {

                        context.go('/redirect');
                        },
                        child: const Text("Login"),
                      ),
                    ],
                  )
                  */
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
