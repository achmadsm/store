import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/provider/auth_provider.dart';
import 'package:store/ui/pages/home_page.dart';
import 'package:store/ui/widgets/custom_button.dart';
import 'package:store/ui/widgets/custom_text_form_field.dart';
import 'package:store/utils/password_validator.dart';
import 'package:store/utils/username_validator.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  static const routeName = '/log_in_page';

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Sign In with your\n'
          'existing account',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputSection() {
      Widget emailInput() {
        return CustomTextFormField(
          title: 'Username',
          hintText: 'Your username',
          controller: usernameController,
          validator: usernameValidator,
        );
      }

      Widget passwordInput() {
        return CustomTextFormField(
          title: 'Password',
          hintText: 'Your password',
          obscureText: true,
          controller: passwordController,
          validator: passwordValidator,
        );
      }

      Widget submitButton() {
        void showSnackBar(String message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
            ),
          );
        }

        void navigation() {
          Navigator.pushNamedAndRemoveUntil(
              context, HomePage.routeName, (route) => false);
        }

        return context.watch<AuthProvider>().isLoggedIn
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.only(top: 10),
                child: CustomButton(
                  title: 'Log in',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final authRead = context.read<AuthProvider>();

                      await authRead.login(
                        usernameController.text,
                        passwordController.text,
                      );

                      if (authRead.logInResponse?.token == null) {
                        showSnackBar(authRead.message);
                      } else if (authRead.logInResponse?.token != null) {
                        navigation();
                      }
                    }
                  },
                ),
              );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailInput(),
              passwordInput(),
              submitButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            title(),
            inputSection(),
          ],
        ),
      ),
    );
  }
}
