import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/theme/text_styles.dart';
import 'package:said/utils/expansion_panel_generator.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final List<bool> _isOpen = List.generate(4, (index) => false);

  @override
  Widget build(BuildContext context) {
    // prepare titles:
    final List<String> titles = [
      AppLocalizations.of(context).storyTitle,
      AppLocalizations.of(context).missionTitle,
      AppLocalizations.of(context).visionTitle,
      AppLocalizations.of(context).valuesTitle,
    ];

    // prepare bodies:
    final List<Widget> bodies = [
      Text(AppLocalizations.of(context).storyBody),
      Text(AppLocalizations.of(context).missionBody),
      Text(AppLocalizations.of(context).visionBody),
      Text(AppLocalizations.of(context).valuesBody),
    ];

    // prepare expansion panels:
    List<ExpansionPanel> panels =
        generateExpansionPanels(titles, bodies, _isOpen);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Text(AppLocalizations.of(context).about, style: subHeader()),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                  child: Image(image: AssetImage('assets/images/logo.png')),
                ),
                const Padding(padding: EdgeInsets.all(8)),
                ExpansionPanelList(
                  animationDuration: const Duration(milliseconds: 500),
                  expansionCallback: (i, isOpen) {
                    setState(() {
                      _isOpen[i] = !isOpen;
                    });
                  },
                  children: panels,
                )
              ],
            ),
          )),
        ));
  }
}
