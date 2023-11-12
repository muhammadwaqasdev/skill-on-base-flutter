import 'package:stacked/stacked.dart';
import 'package:skill_on_base/src/configs/app_setup.locator.dart';
import 'package:skill_on_base/src/services/remote/api_service.dart';

mixin ApiViewModel on ReactiveViewModel {
  ApiService _apiService = locator<ApiService>();

  ApiService get apiService => _apiService;
}
