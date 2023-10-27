import 'package:chat/Controller/splichOnboardingcontroler.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplichNext extends StatelessWidget {
  OnboardingSplich controlerpag = Get.put(OnboardingSplich());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('images/chatpic.png'),
            )),
          ),
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: controlerpag.pagcontrol,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: Get.height * 0.4,
                      width: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(controlerpag.Imageschat[
                              index]), // Use Imageschat[index] to get the image path
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width * 0.8,
                      child: Textcustam(
                        align: TextAlign.center,
                        text: 'Enjoy the beautiful world   using chat',
                        size: 24,
                        weight: FontWeight.w700,
                      ),
                    )
                  ],
                );
              },
              itemCount: controlerpag.Imageschat.length,
            ),
          ),
          SmoothPageIndicator(
            controller: controlerpag.pagcontrol, // PageController
            count: controlerpag.Imageschat.length,

            effect: WormEffect(
              activeDotColor: Colors.green,
              dotWidth: 11,
              dotHeight: 11,
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundButton(
              title: 'Get Started ',
              col: colorsss, // Assuming 'colorsss' is defined in 'counst.dart'
              fun: () {
                Get.toNamed('/LestYouIn');
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.07,
          )
        ],
      ),
    );
  }
}
