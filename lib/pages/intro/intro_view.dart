import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lessonnote/Constants/assets.dart';
import 'package:lessonnote/pages/intro/intro_slider.dart';
import 'package:lessonnote/pages/intro/intromodel.dart';
 
 
class IntroView extends StatelessWidget {
  const IntroView({super.key});
   static String routeName = '/';
  static final imagesPath = <String>[
    Assets.imagesSVG.teaching,
    Assets.imagesSVG.studying,
    Assets.imagesSVG.onlineLearning
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
  };
 
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
                items: imagesPath.map((item) {
                  return IntroModel(
                      title: _introText[
                          'intro_page_title_${(imagesPath.indexOf(item) + 1)}']!,
                      imagePath: item,
                      subtitle: _introText[
                          'intro_page_subtile_${(imagesPath.indexOf(item) + 1)}']!);
                }).toList(),
              )),
              Column(
                children: [
                  SizedBox(
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        context.go('/welcome');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 5, 117, 209),
                      ),
                      child: const Text(
                        'next',
                        
                        style: TextStyle(color: Colors.white,fontSize: 16,
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
