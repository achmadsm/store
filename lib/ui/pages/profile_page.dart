import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/provider/auth_provider.dart';
import 'package:store/provider/profile_provider.dart';
import 'package:store/ui/pages/log_in_page.dart';
import 'package:store/ui/widgets/custom_button.dart';
import 'package:store/utils/result_state.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const profileTitle = 'Profile';

  @override
  Widget build(BuildContext context) {
    void navigation(String routeName) {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (route) => false);
    }

    return Scaffold(
      body: Center(
        child: Consumer<ProfileProvider>(
          builder: (context, state, child) {
            if (state.state == ResultState.loading) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    state.image,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    state.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 80),
                  CustomButton(
                    title: 'Log out',
                    width: 220,
                    onPressed: () async {
                      final authRead = context.read<AuthProvider>();
                      final result = await authRead.logout();
                      if (result) {
                        navigation(LogInPage.routeName);
                      }
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
