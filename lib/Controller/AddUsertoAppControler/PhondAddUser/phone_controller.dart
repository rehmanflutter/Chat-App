import 'package:chat/View/Screen/AddUserToApp/PhoneLoginNo/phonedata.dart';
import 'package:chat/View/counst.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhoneToLogin extends GetxController {
  TextEditingController phonecon = TextEditingController();
  TextEditingController otpcontrol = TextEditingController();

  // select counter Picker
  RxString selectedCountryCode =
      '+92'.obs; // Observable variable for selected country code
  void setSelectedCountryCode(String code) {
    selectedCountryCode.value = code;
    phonecon.text = code;
  }

  var loding = false.obs;

// login with phone

  static String? verificationIdOTP;
  void phonetostart() {
    loding.value = true;
    authfirbase.verifyPhoneNumber(
      phoneNumber: phonecon.text,
      verificationCompleted: (_) {
        loding.value = false;
      },
      verificationFailed: (error) {
        // Get.snackbar('Error', error.toString());
        loding.value = false;
      },
      codeSent: (verificationId, int? token) {
        verificationIdOTP = verificationId;
        // (verifie: verificationId)
        Get.toNamed('/OTP');
        loding.value = false;
      },
      codeAutoRetrievalTimeout: (e) {
        //  Get.snackbar('Error', e.toString());
        loding.value = false;
      },
    );
  }

  /// Otp enter process
  void otpsendRecive() async {
    final crendital = PhoneAuthProvider.credential(
        verificationId: verificationIdOTP!,
        smsCode: otpcontrol.text.toString());

    try {
      await authfirbase.signInWithCredential(crendital);
      Get.snackbar('Successful', 'Enjoy the app to best way');
      Get.to(PhoneData());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
