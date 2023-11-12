import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skill_on_base/src/models/user.dart';
import 'package:skill_on_base/src/views/auth/change_password/change_password_view.dart';
import 'package:skill_on_base/src/views/auth/forgot_password/forgot_password_view.dart';
import 'package:skill_on_base/src/views/auth/login/login_view.dart';
import 'package:skill_on_base/src/views/auth/register/register_view.dart';
import 'package:skill_on_base/src/views/auth/splash/splash_view.dart';
import 'package:skill_on_base/src/views/auth/verify_otp/verify_otp_view.dart';
import 'package:skill_on_base/src/views/dashboard/dashboard_view.dart';

class NewGoRoute {
  static const splashView = '/';
  static const loginView = '/login';
  static const registerView = '/register';
  static const dashboardView = '/dashboard';
  static const verifyOtpView = '/verify_otp';
  static const forgotPasswordView = '/forgot_password';
  static const changePasswordView = '/change_password';


  static GoRouter router = GoRouter(
    initialLocation: NewGoRoute.splashView,
    routes: [
      GoRoute(
        name: "Splash",
        path: NewGoRoute.splashView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: SplashView(),
          );
        },
      ),
      GoRoute(
        name: "Login",
        path: NewGoRoute.loginView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: LoginView(),
          );
        },
      ),
      GoRoute(
        name: "Register",
        path: NewGoRoute.registerView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: RegisterView(),
          );
        },
      ),
      GoRoute(
        name: "ForgotPassword",
        path: NewGoRoute.forgotPasswordView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: ForgotPasswordView(),
          );
        },
      ),
      GoRoute(
        name: "ChangePassword",
        path: NewGoRoute.changePasswordView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          ChangePasswordViewExtra _data = state.extra as ChangePasswordViewExtra;
          return FadeTransitionPage(
            key: state.pageKey,
            child: ChangePasswordView(_data.user),
          );
        },
      ),
      GoRoute(
        name: "VerifyOtp",
        path: NewGoRoute.verifyOtpView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          VerifyOtpViewExtra _data = state.extra as VerifyOtpViewExtra;
          return FadeTransitionPage(
            key: state.pageKey,
            child: VerifyOtpView(user: _data.user, sendToPhone: _data.sendToPhone,),
          );
        },
      ),
      GoRoute(
        name: "Dashboard",
        path: NewGoRoute.dashboardView,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return FadeTransitionPage(
            key: state.pageKey,
            child: DashboardView(),
          );
        },
      ),
    ],
  );
}

class VerifyOtpViewExtra {
  const VerifyOtpViewExtra({required this.user, required this.sendToPhone});

  final UserModel user;
  final bool sendToPhone;
}


class ChangePasswordViewExtra {
  const ChangePasswordViewExtra({required this.user});

  final UserModel user;
}

class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.elasticOut);
}
