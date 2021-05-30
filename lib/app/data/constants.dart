import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstants {
  //=======================================================================================/Colors

  static const Color APP_THEME_COLOR = Color(0xFF3D4584);
  static const Color TEXT_FIELD_HEADER = Color(0xFF616161);
  static const Color SNACK_BG_COLOR_FAILURE = Color(0xFFE57373);
  static const Color SNACK_BG_COLOR_SUCCESS = Color(0xFFE57373);
  static const Color BACKGROUND_COLOR_BOTTOM = Color(0xffF3F8FE);

  //==========================================================================================/api
  static const String BASE_URL = 'http://ubuyexpress.com/api/v1/user/';
  static const String REGISTRATION_URL = 'registration';
  static const String LOGIN_URL = 'login';
  static const String AUCTION_LIST_URL = 'auctions';
  static const String FORGOT_PASS_URL = 'forgotpassword';
  static const String AUCTION_DETAIL_URL = 'auction_detail_get_new';
  static const String BID_RESULT_URL = 'bid_result';
  static const String BID_SUBMIT_URL = 'bid_submit';
  // static const String DEVICE_TOKEN =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjMsInlzcyI6Imh0dHA6Ly9sb2NhbGhvc3QvaWdsL3B1YmxpYy9hcGl2Mi9sb2dpblVzZXIiLCJpYXQiOjE1NTc4MjQ4NDIsImV4cCI6MTU2MDQ1Mjg0MiwibmJmIjoxNTU3ODI0ODQyLCJqdGkiOiJBemxNamp4NG8wUHNBSGxFIn0.1YvZL9LcrVA8uRMmhSuYbUV87UWLx6YQZulfgr8Quu81";

//==========================================================================================/api

  static final TextStyle dashboardStyle = GoogleFonts.montserrat(fontSize: 20);

  //============================================================================================/App Constants

}
