import 'package:get/get.dart';

import 'package:scrap_bid/app/modules/forgotPass/bindings/forgot_pass_binding.dart';
import 'package:scrap_bid/app/modules/forgotPass/views/forgot_pass_view.dart';
import 'package:scrap_bid/app/modules/home/bindings/home_binding.dart';
import 'package:scrap_bid/app/modules/home/views/home_view.dart';
import 'package:scrap_bid/app/modules/login/bindings/login_binding.dart';
import 'package:scrap_bid/app/modules/login/views/login_view.dart';
import 'package:scrap_bid/app/modules/signUp/bindings/sign_up_binding.dart';
import 'package:scrap_bid/app/modules/signUp/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASS,
      page: () => ForgotPassView(),
      binding: ForgotPassBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
