import 'package:chat/Controller/AddUsertoAppControler/PhondAddUser/phone_controller.dart';
import 'package:chat/View/CustamWiget/Buttoncustam.dart';
import 'package:chat/View/CustamWiget/textcustam.dart';
import 'package:chat/View/CustamWiget/textfiledcustam.dart';
import 'package:chat/View/counst.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNoSigup extends StatelessWidget {
  PhoneToLogin controller = Get.put(PhoneToLogin());

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: media.height * 0.3,
                    ),
                    GetBuilder<PhoneToLogin>(
                      builder: (controller) => Center(
                        child: CountryCodePicker(
                          onChanged: (CountryCode countryCode) {
                            controller
                                .setSelectedCountryCode(countryCode.dialCode!);
                          },
                          initialSelection: 'pk',
                          favorite: ['+92', 'pk'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                      ),
                    ),
                    Divider(
                      indent: 29.0,
                      endIndent: 29.0,
                    ),
                    Center(child: Textcustam(text: 'Select country Number')),
                    SizedBox(
                      height: Get.height * 0.07,
                    ),
                    Textfiledcustam(
                      keyboardType: TextInputType.number,
                      controller: controller.phonecon,
                      hinttext: 'Select country',
                      starticon: Icon(Icons.phone),
                    ),
                    SizedBox(
                      height: media.height * 0.05,
                    ),
                    RoundButton(
                      title: 'Sign up',
                      loading: controller.loding.value,
                      col: colorsss,
                      fun: () {
                        // Add your sign-up logic here
                        controller.phonetostart();
                      },
                    ),
                    SizedBox(
                      height: media.height * 0.04,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 215,
            decoration: BoxDecoration(
                color: colorsss,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Center(
              child: Textcustam(
                align: TextAlign.center,
                text: 'Create Account with        PhoneNo',
                weight: FontWeight.w600,
                size: 25,
                col: Colors.white,
              ),
            ),
          ),
          Positioned(
              top: 195,
              left: 0,
              right: 0,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: double.infinity,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
              )),
          Positioned(
            top: 35,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }
}
