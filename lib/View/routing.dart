import 'package:chat/View/CustamWiget/appBar.dart';
import 'package:chat/View/Screen/AddUserToApp/LoginUser/login.dart';
import 'package:chat/View/Screen/AddUserToApp/PhoneLoginNo/otp.dart';
import 'package:chat/View/Screen/AddUserToApp/PhoneLoginNo/phone.dart';
import 'package:chat/View/Screen/AddUserToApp/ProfileFillUser/profilefill.dart';
import 'package:chat/View/Screen/AddUserToApp/sigupUser/sigin.dart';
import 'package:chat/View/Screen/AddUserToApp/youin.dart';
import 'package:chat/View/Screen/HomeScreen/Home.dart';
import 'package:chat/View/Screen/Notification/notification.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/EditFolder/Details/details.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/EditFolder/editprofile.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/PostAndRells/postReels.dart';
import 'package:chat/View/Screen/Profile/UserProfile/Profile/profilesee.dart';
import 'package:chat/View/Screen/SearchUsers/searchs.dart';
import 'package:chat/View/Screen/SplichAndOnboarding/splichNext.dart';
import 'package:chat/View/Screen/SplichAndOnboarding/splish.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRouting {
  static final routes = [
    GetPage(
        name: '/SplishScreens',
        page: () => SplishScreens(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/SplichNext',
        page: () => SplichNext(),
        transition: Transition.circularReveal),

    GetPage(
        name: '/LestYouIn',
        page: () => LestYouIn(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/Login',
        page: () => Login(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/SiginScreen',
        page: () => SiginScreen(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/PhoneNoSigup',
        page: () => PhoneNoSigup(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/OTP', page: () => OTP(), transition: Transition.circularReveal),
    GetPage(name: '/BottomappBar', page: () => BottomBarCus()),
    GetPage(
        name: '/FillYourProfile',
        page: () => FillYourProfile(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/HomeScreen',
        page: () => HomeScreen(),
        transition: Transition.circularReveal),
    GetPage(
        name: '/EditProfile',
        page: () => EditProfile(),
        transition: Transition.circularReveal),

    GetPage(
      name: '/SearchBox',
      page: () => SearchBox(),
    ),
    GetPage(
        name: '/Profile',
        page: () => Profile(),
        transition: Transition.circularReveal),
    // GetPage(
    //   name: '/SeeProfilePeople',
    //   page: () => SeeProfilePeople(),
    // ),

    GetPage(
      name: '/DetailsUser',
      page: () => DetailsUser(userId: 'dk'),
    ), //  not use this only check
    GetPage(
      name: '/PostAndReelss',
      page: () => PostAndReelss(),
    ),
    GetPage(
      name: '/Notifications',
      page: () => Notifications(),
    ),
    //    GetPage(
    // name: '/SiginScreen',
    // page: () => SiginScreen(),),
    //    GetPage(
    // name: '/SiginScreen',
    // page: () => SiginScreen(),),
    //    GetPage(
    // name: '/SiginScreen',
    // page: () => SiginScreen(),),
    //    GetPage(
    // name: '/SiginScreen',
    // page: () => SiginScreen(),),
    //    GetPage(
    // name: '/SiginScreen',
    // page: () => SiginScreen(),),
  ];
}
