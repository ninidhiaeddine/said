import 'package:flutter/material.dart';
import 'package:said/screens/about.dart';
import 'package:said/screens/contact.dart';
import 'package:said/screens/learn.dart';
import 'package:said/services/models/user.dart';
import 'package:said/services/user_service.dart';
import 'package:said/theme/text_styles.dart';
import 'package:said/utils/said_session_manager.dart';
import 'package:said/widgets/buttons/said_button.dart';
import 'package:said/widgets/buttons/said_outlined_button.dart';
import 'package:said/widgets/misc/said_user_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  late Future<User> _user;

  Future<User> _loadUser() async {
    // get user id:
    int userId = await SaidSessionManager.getSessionValue('id');

    // get user from API service:
    return await UserService.getUser(userId);
  }

  @override
  void initState() {
    super.initState();
    _user = _loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FutureBuilder(future: _loadUser(), builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data!.firstName != null) {
              var fullName = '${snapshot.data!.firstName} ${snapshot.data!.lastName}';
              return SaidUserBar(
                userFullName: fullName,
              );
            } else {
              return SaidUserBar(
                userFullName: snapshot.data!.username,
              );
            }
          } else {
            return const SaidUserBar(
              userFullName: "Loading...",
            );
          }
        }),
        Text(
          AppLocalizations.of(context).information,
          style: subHeader(),
        ),
        Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              children: [
                SaidButton(
                  text: AppLocalizations.of(context).learnAboutCRC,
                  context: context,
                  icon: const Icon(Icons.bar_chart),
                  linkTo: const LearnPage(),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                SaidOutlinedButton(
                  text: AppLocalizations.of(context).about,
                  context: context,
                  icon: const Icon(Icons.info_rounded),
                  linkTo: AboutPage(),
                ),
                SaidOutlinedButton(
                  text: AppLocalizations.of(context).contactUs,
                  context: context,
                  icon: const Icon(Icons.email_rounded),
                  linkTo: const ContactPage(),
                )
              ],
            )),
      ],
    ));
  }
}
