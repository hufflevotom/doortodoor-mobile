// ignore_for_file: use_build_context_synchronously

import 'package:doortodoor_mobile/Providers/global_provider.dart';
import 'package:doortodoor_mobile/Utils/preferences/local_preferences.dart';
import 'package:doortodoor_mobile/Interfaces/user_interface.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:doortodoor_mobile/Providers/login_form_provider.dart';
import 'package:doortodoor_mobile/Services/services.dart';
import 'package:doortodoor_mobile/Utils/Styles/styles.dart';
import 'package:doortodoor_mobile/Utils/Widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlueBackground(
        child: SingleChildScrollView(
          child: Center(
            child: CustomCard(
              child: Column(
                children: [
                  Image.asset('lib/Utils/Images/Logo.jpg'),
                  const SizedBox(height: 90),
                  ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LoginFormProvider loginForm = context.watch<LoginFormProvider>();
    GlobalProvider global = context.watch<GlobalProvider>();
    LocalPreferences preferences = context.watch<LocalPreferences>();

    return Form(
      key: loginForm.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autocorrect: false,
            keyboardType: TextInputType.number,
            decoration: InputDecorations.inputStyle(
              hintText: 'Documento',
              prefixIcon: Icons.account_circle_outlined,
            ),
            onChanged: (value) => loginForm.docIdentidad = value,
            validator: (value) {
              RegExp regExp = RegExp(r'^\d{8}(?:[-\s]\d{4})?$');
              return regExp.hasMatch(value ?? '')
                  ? null
                  : 'Ingrese un n??mero de documento v??lido';
            },
          ),
          const SizedBox(height: 15),
          TextFormField(
            autocorrect: false,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecorations.inputStyle(
              hintText: 'Contrase??a',
              prefixIcon: Icons.password,
            ),
            onChanged: (value) => loginForm.password = value,
            validator: (value) {
              if (value != null && value.length >= 6) return null;
              return 'Ingrese la contrase??a';
            },
          ),
          const SizedBox(height: 15),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: CustomColors.gris_100,
            elevation: 0,
            color: CustomColors.azul_100,
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();

                    final loginService =
                        Provider.of<LoginService>(context, listen: false);
                    final folioService =
                        Provider.of<FolioService>(context, listen: false);

                    if (!loginForm.isValidForm()) return;

                    loginForm.isLoading = true;

                    final Map? login = await loginService.login(
                        loginForm.docIdentidad, loginForm.password);

                    if (login?['errorMessage'] == null &&
                        login?['user'] != null) {
                      final User? newUser =
                          await loginService.user(login?['token']);

                      if (newUser != null) {
                        context
                            .read<GlobalProvider>()
                            .setUser(newUser: newUser);

                        if (newUser.ruta != null) {
                          final folioArr =
                              await folioService.obtenerFolios(newUser.ruta!);

                          context
                              .read<GlobalProvider>()
                              .setFolios(newFolios: folioArr['body']);
                        }
                      }
                      preferences.setTokenUser(login?['token']);
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      notification(
                          message: login!['errorMessage'],
                          context: context,
                          type: 'Error');
                      loginForm.isLoading = false;
                    }
                  },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              child: Center(
                child: Text(
                  loginForm.isLoading ? 'Buscando usuario ...' : 'Ingresar',
                  style: TextStyle(color: CustomColors.blanco),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
