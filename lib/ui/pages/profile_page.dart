import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/common/styles.dart';
import 'package:store/provider/auth_provider.dart';
import 'package:store/provider/profile_provider.dart';
import 'package:store/ui/pages/log_in_page.dart';
import 'package:store/ui/widgets/custom_button.dart';
import 'package:store/utils/result_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  static const profileTitle = 'Profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    Provider.of<ProfileProvider>(context, listen: false).profile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        navigation();
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

  void navigation() {
    Navigator.pushNamedAndRemoveUntil(
        context, LogInPage.routeName, (route) => false);
  }
}
