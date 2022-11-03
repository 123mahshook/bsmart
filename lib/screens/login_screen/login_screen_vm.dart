import 'dart:async';

import 'package:bsmart/app/contract/base_view_model.dart';
import 'package:bsmart/provider/email_password_provider.dart';
import 'package:provider/provider.dart';

class LoginScreenVM extends BaseViewModel {
  @override
  void dispose() {
    _loaderController.close();
  }

  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get getLoaderStream => _loaderController.stream;

  authFirebaseEmailPassword(String email, String Password) async {
    _loaderSink.add(true);
    final provider =
        Provider.of<EmailPasswordSignInProvider>(parentContext!, listen: false);
    await provider.emailPassworLogin(parentContext!, email, Password);
    _loaderSink.add(false);
  }
}
