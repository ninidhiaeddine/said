import 'package:flutter/material.dart';
import 'package:said/config/color_constants.dart';
import 'package:said/screens/user_account.dart';
import 'package:said/screens/user_club.dart';
import 'package:said/screens/user_home.dart';
import 'package:said/screens/user_info.dart';
import 'package:said/screens/user_announcements.dart';
import 'package:said/services/models/user.dart';
import 'package:said/utils/said_session_manager.dart';
import 'package:said/widgets/nav/said_bottom_nav_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:said/widgets/nav/said_navigation_drawer.dart';

class UserNavigatorParent extends StatefulWidget {
  const UserNavigatorParent({super.key});

  @override
  State<StatefulWidget> createState() => _UserNavigatorParentState();
}

class _UserNavigatorParentState extends State<UserNavigatorParent> {
  int _selectedIndex = 2;

  late User _authenticatedUser;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _loadUserAsync() async {
    var user = await SaidSessionManager.getUser();
    setState(() {
      _authenticatedUser = user;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserAsync();
  }

  @override
  Widget build(BuildContext context) {
    // prepare icons:
    List<Icon> icons = const [
      Icon(Icons.groups_rounded),
      Icon(Icons.info_rounded),
      Icon(Icons.home_rounded),
      Icon(Icons.notifications_rounded),
      Icon(Icons.account_circle_rounded),
    ];

    // prepare labels:
    List<String> labels = [
      AppLocalizations.of(context).club,
      AppLocalizations.of(context).info,
      AppLocalizations.of(context).home,
      AppLocalizations.of(context).announcements,
      AppLocalizations.of(context).account,
    ];

    // prepare views:
    List<Widget> views = [
      const UserClubPage(),
      UserInfoPage(authenticatedUser: _authenticatedUser),
      UserHomePage(authenticatedUser: _authenticatedUser),
      const UserAnnouncementsPage(),
      UserAccountPage(authenticatedUser: _authenticatedUser)
    ];

    // return scaffold with bottom navigation bar and corresponding view
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.backgroundColor,
          elevation: 0,
        ),
        drawer: const SaidNavigationDrawer(),
        bottomNavigationBar: SaidBottomNavigationBar(
          icons: icons,
          labels: labels,
          selectedIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: views[_selectedIndex]);
  }
}
