import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_mobx/stores/login_store.dart';
import 'package:teste_mobx/widgets/custom_text_field.dart';
import 'package:teste_mobx/widgets/custom_icon_button.dart';
import 'package:teste_mobx/screens/list_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 16,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 34, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CustomTextField(
                  hint: 'E-mail',
                  prefix: Icon(Icons.account_circle),
                  textInputType: TextInputType.emailAddress,
                  onChanged: loginStore.setEmail,
                  enabled: true,
                ),
                const SizedBox(height: 16),
                Observer(builder: (_) {
                    return CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(Icons.lock),
                      obscure: !loginStore.passwordVisibility,
                      onChanged: loginStore.setPassword,
                      enabled: true,
                      suffix: CustomIconButton(
                        radius: 32,
                        iconData: Icons.visibility,
                        onTap: loginStore.togglePasswordVisibility,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Observer(builder: (_) {
                  return SizedBox(
                    height: 44,
                    width: 150,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text('Entrar'),
                      color: Theme.of(context).primaryColor,
                      disabledColor:
                          Theme.of(context).primaryColor.withAlpha(100),
                      textColor: Colors.white,
                      onPressed: loginStore.isFormValid
                          ? () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => ListScreen()));
                            }
                          : null,
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
