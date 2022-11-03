import 'dart:async';

import 'package:bsmart/app/contract/base_view_model.dart';
import 'package:bsmart/provider/email_password_provider.dart';
import 'package:provider/provider.dart';

class RegisterScreenVM extends BaseViewModel {
  @override
  void dispose() {
    _loaderController.close();
  }

  final _loaderController = StreamController<bool>.broadcast();
  StreamSink<bool> get _loaderSink => _loaderController.sink;
  Stream<bool> get getLoaderStream => _loaderController.stream;

  registerEmailPassword(String email, String password) async {
    _loaderSink.add(true);
    final provider =
        Provider.of<EmailPasswordSignInProvider>(parentContext!, listen: false);
    await provider.registerEmailPassword(parentContext!, email, password);
    _loaderSink.add(false);
  }
}
