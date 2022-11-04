import 'package:bsmart/app/contract/base_view_model.dart';
import 'package:bsmart/data_access_layer/db/db_config.dart';
import 'package:bsmart/utilities/common_navigate.dart';

class SplashScreenVM extends BaseViewModel {
  @override
  void dispose() {}

  SplashScreenVM() {
    setupDb();
  }

  setupDb() async {
    await DbConfig().configDb();
    CommonNavigate(parentContext: parentContext!).navigateLoginScreen();
  }
}
