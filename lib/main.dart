import 'package:bhandi_guardian/Pages/High.dart';
import 'package:bhandi_guardian/Pages/Nawt.dart';
//import 'package:bhandi_guardian/Pages/otherScreens/GuardianSetup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'pages/Home.dart';
import 'db/todo.dart';
import 'db/helpsdb.dart';
import 'db/othersdb.dart';

// Define the router configuration
final _router = GoRouter(
  initialLocation: '/',
  // setting up paths for route
  routes: [
    GoRoute(path: '/', builder: (context, state) => const Home()),
    GoRoute(path: '/High', builder: (context, state) => const High()),
    GoRoute(path: '/Nawt', builder: (context, state) => const Nawt()),
    /*GoRoute(
      path: '/otherScreens/GuardianSetup',
      builder: (context, state) => const GuardianSetup(),
    ),*/
  ],
);

Future<void> main() async {
  // initializing database
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [todoSchema, othersSchema, helpsSchema], // Add all your schemas here
    directory: dir.path,
  );
  runApp(MyApp(isar: isar));
}

// statelessWidgets are those who stays constant don't change during run time
class MyApp extends StatelessWidget {
  final Isar isar;
  const MyApp({
    super.key,
    required this.isar,
  }); // constructor for the MyApp class

  @override // override clears that subclass can make changes in the parent class
  // building and handling of all widgets in the app
  Widget build(BuildContext context) {
    // MaterialApp is considered as root widget of the app
    return MaterialApp.router(
      title:
          'Bhandi Guardian', // title it usually appears in task switches on mobile devices
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ), // setting up theme, here theme seed is use to make harmonious palate from color given
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
