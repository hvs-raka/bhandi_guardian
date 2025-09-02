//import 'dart:io';

import 'package:bhandi_guardian/Pages/High.dart';
import 'package:bhandi_guardian/Pages/Nawt.dart';
import 'package:bhandi_guardian/db_model/Todo_model.dart';
//import 'package:bhandi_guardian/Pages/otherScreens/GuardianSetup.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
//import 'package:path_provider/path_provider.dart';
import 'pages/Home.dart';

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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initializing hive here we're not assigning path manually it handles it internally
  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());
  Hive.registerAdapter(VisitListAdapter());
  Hive.registerAdapter(PlayListAdapter());
  Hive.registerAdapter(GuardianListAdapter());
  Hive.registerAdapter(HomeLocationAdapter());

  await Hive.openBox<Todo_Model>('Todos');
  await Hive.openBox<Visit_List>(
    'Visit_List',
  ); // here 'Todos' and 'Visit_List' could be anything but should be consistent
  await Hive.openBox<PlayList>('PlayList');
  await Hive.openBox<GuardianList>('GuardianList');
  await Hive.openBox<HomeLocation>('HomeLocation');
  runApp(const MyApp());
}

// statelessWidgets are those who stays constant don't change during run time
class MyApp extends StatelessWidget {
  const MyApp({super.key}); // constructor for the MyApp class

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
