import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lessonnote/pages/intro/intro_view.dart';
import 'package:lessonnote/pages/intro/intromodel.dart';

// _ means a private
class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key, required this.items});

  final List<IntroModel> items;
  @override
  State<IntroSlider> createState() => __IntroSliderState();
}

 
class __IntroSliderState extends State<IntroSlider> {
final selectedImageNotifier = ValueNotifier(0);

  @override
  void dispose() {
    selectedImageNotifier.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedImageNotifier,
      builder: (context, currentImage, child) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: buildImagesPage(),
          ),
          widget.items.length > 1
              ? SizedBox(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.items
                        .map((image) => _buildindicator(
                            widget.items.indexOf(image) == currentImage))
                        .toList(),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget buildImagesPage() {
    return PageView(
      physics: BouncingScrollPhysics(),
      onPageChanged: (value) => selectedImageNotifier.value = value,
      children: widget.items.map((item) {
        String ext = item.imagePath.split(".").last;
        double height = 200;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ext != "svg"
                    ? Image.asset(
                        item.imagePath,
                        fit: BoxFit.scaleDown,
                        height: height,
                      )
                    : SvgPicture.asset(
                        item.imagePath,
                        fit: BoxFit.scaleDown,
                        height: height,
                      ),
              ),
              const SizedBox(
                height: 55,
              ),
              Text(
                item.title,
                style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 23,
              ),
              Text(
                item.subtitle,
                style: const TextStyle(fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              )
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildindicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

