import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/changeThemeProvider.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(),
      child: Builder(
        builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Dark Theme Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            initialRoute: SplashScreen.routeName,
            routes: routes,
          );
        },
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider<ThemeChanger>(
//       create: (_)=>ThemeChanger(),
//       child: Builder(
//         builder: (context) {
//           final themeChanger = Provider.of<ThemeChanger>(context);
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: theme(),
//             darkTheme: ThemeData(
//               brightness: Brightness.dark,
//             ),
//             themeMode: themeChanger.themeMode,
//             // home: SplashScreen(),
//             // We use routeName so that we dont need to remember the name
//
//           );
//         }
//       ),
//     );
//   }
// }
