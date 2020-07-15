import 'package:covid_monitoring/screens/IndexScreen.dart';
import 'package:covid_monitoring/screens/PUIScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/AuthProvider.dart';
import 'models/PUIProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(
        //   create: (_) => AuthProvider(),
        // ),
        ChangeNotifierProvider<PUIProvider>(
          create: (context) => PUIProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'UERM Covid Monitoring',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.blue[50],
          appBarTheme: AppBarTheme(
            color: Colors.blue[700],
          ),
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blue, textTheme: ButtonTextTheme.primary),
        ),
        routes: {
          '/': (BuildContext context) => PUIScreen(),
        },
      ),
    );
  }
}

// class Router extends StatelessWidget {
//   final Widget screen;
//   const Router({Key key, this.screen}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context);

//     return FutureBuilder(
//       future: Provider.of<AuthProvider>(context, listen: false).getPrefs(),
//       builder: (context, snapshot) {
//         switch (snapshot.connectionState) {
//           case ConnectionState.active:
//           case ConnectionState.waiting:
//           case ConnectionState.none:
//             return CircularProgressIndicator();
//             break;
//           default:
//             return LayoutBuilder(
//               builder: (context, constraints) {
//                 if (!authProvider.isLoggedIn) {
//                   return AuthScreen();
//                 } else if (authProvider.patientno == null) {
//                   return SetPasswordScreen();
//                 }
//                 return screen;
//               },
//             );
//         }
//       },
//     );
//   }
// }
