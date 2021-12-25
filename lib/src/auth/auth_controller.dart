import 'package:property_app/src/network_manager.dart';

class AuthController extends NetworkManager {
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  set obscureText(bool newObscureVal) {
    _obscureText = newObscureVal;
    update();
  }
}
