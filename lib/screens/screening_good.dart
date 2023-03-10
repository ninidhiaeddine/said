import 'package:flutter/material.dart';
import 'package:said/screens/user_navigator_parent.dart';
import 'package:said/theme/text_styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/widgets/buttons/said_button.dart';

class ScreeningGoodPage extends StatelessWidget {
  const ScreeningGoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              children: [
                Text(AppLocalizations.of(context).response, style: subHeader()),
                const Padding(padding: EdgeInsets.all(24)),
                const Icon(
                  Icons.check_circle,
                  size: 40,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Text(
                  AppLocalizations.of(context).screeningGoodBody,
                  textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.all(32)),
                Text(
                  AppLocalizations.of(context).screeningGoodTitle,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const Padding(padding: EdgeInsets.all(16)),
                SaidButton(
                  text: AppLocalizations.of(context).goBackHome,
                  context: context,
                  icon: const Icon(Icons.home_outlined),
                  linkTo: const UserNavigatorParent(),
                )
              ],
            )),
      ),
    );
  }
}
