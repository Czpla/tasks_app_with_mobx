import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool passwordVisibility = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  void togglePasswordVisibility() => passwordVisibility = !passwordVisibility;

  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 3));

    loading = false;
    loggedIn = true;
  }

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  Function get loginPressed =>
    (isEmailValid && isPasswordValid && !loading) ? login : null;
}
