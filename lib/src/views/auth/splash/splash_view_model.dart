import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skill_on_base/src/services/local/base/auth_view_model.dart';
import 'package:skill_on_base/src/services/local/navigation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SplashViewModel extends ReactiveViewModel with AuthViewModel {
  final BuildContext context;

  SplashViewModel(this.context);

  init(){
    if(authService.user != null){
      Future.delayed(Duration(milliseconds: 5), () {
        NavService.dashboard(context);
      });
    }else {
      Future.delayed(Duration(seconds: 5), () {
        NavService.login(context);
      });
    }
  }
}
