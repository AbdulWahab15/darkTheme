import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/changeThemeSP.dart';

import '../../../changeThemeProvider.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatefulWidget {
  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool isDark = false;
  DarkThemePreference dkp = DarkThemePreference();

  @override
  void initState() {
    super.initState();
    dkp.getTheme().then((value) {
      setState(() {
        isDark = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
          Switch(
            value: isDark,
            onChanged: (val) {
              setState(() {
                isDark = val;
              });
              print(isDark);
              isDark
                  ? themeChanger.setTheme(ThemeMode.dark)
                  : themeChanger.setTheme(ThemeMode.light);

              // themeChanger.setTheme(ThemeMode.dark);
            },
          )
        ],
      ),
    );
  }
}
