import 'package:go_router/go_router.dart';
import 'package:mal3aby/features/auth/login/presentation/view/login_page.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/authoriztion_page.dart';
import 'package:mal3aby/features/home/presentation/view/owner/adding_new_pitch.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/owner_singup_page.dart';
import 'package:mal3aby/features/auth/signup/presentation/view/user_signup_page.dart';
import 'package:mal3aby/features/home/presentation/view/owner/owner_home_page.dart';
import 'package:mal3aby/features/home/presentation/view/owner/owner_pitch_details_page.dart';
import 'package:mal3aby/features/home/presentation/view/user/user_home_page.dart';

abstract class AppRouter {
  static const KLoginPage = '/login';
  static const KAuthPath= '/auth';
  static const KSignUpUser= '/signupUser';
  static const KSignUpOwner='/signupOwner';
  static const KAddingPitchPage = '/addingPitch';
  static const KForgerPassword='/forgetPassword';
  static const KUserHome='/userHome';
  static const KOwnerPitchDetailsPage='/ownerPitchDetails';
  static const KMaximizeImage='/maximizeImage';
  static const KOwnerHomePage = "/OwnerHomePage";
  static const KVideoDisplayPage = "/displayVideoPage";
  static const KpaymentPage = "/paymentPage";
  static const KAboutUs = '/aboutUsPage';
  static const kContactUs = "/contactUsPage";

  static final router = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: KAuthPath,
      builder: (context, state) => const AuthorizationPage(),
    ),
    GoRoute(
      path: KSignUpUser,
      builder: (context, state) => const SignUpUserPage(),
    ),
    GoRoute(
      path: KSignUpOwner,
      builder: (context, state) => const SignUpOwnerPage(),
    ),
    GoRoute(
      path: KOwnerHomePage,
      builder: (context, state) => const OwnerHomePage(),
    ),
    GoRoute(
      path: KAddingPitchPage,
      builder: (context, state) => const AddingNewPitchPage(),
    ),
    GoRoute(
      path: KOwnerPitchDetailsPage,
      builder: (context, state) => const OwnerPitchDetailsPage(),
    ),

    GoRoute(
      path: KUserHome,
      builder: (context, state) => const UserHomePage(),
    ),
    // GoRoute(
    //   path: KLoginPage,
    //   builder: (context, state) => const LoginPage(),
    // ),


    // GoRoute(
    //   path: KSignUpUser,
    //   builder: (context, state) => const SignUpUserPage(),
    // ),
    //

    // GoRoute(
    //   path: KForgerPassword,
    //   builder: (context, state) => const ForgetPasswordPage(),
    // ),

    // GoRoute(
    //   path: KUserHome,
    //   builder: (context, state) => const UserHomePage(),
    // ),








  ]);
}