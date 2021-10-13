import 'package:flutter/material.dart';
import 'package:gitify/providers/repo_provider.dart';
import 'package:gitify/providers/user_provider.dart';
import 'package:gitify/ui/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: RepositoriesProvider()),
      ],
      child: GetMaterialApp(
        //debugShowCheckedModeBanner: false,
        title: 'Gitify',
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: HomeScreen(),
      ),
    );
  }
}
