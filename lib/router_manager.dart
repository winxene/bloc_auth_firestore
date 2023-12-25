import 'package:flutter/material.dart';
import 'package:flutter_auth_firestore_test/features/auth/presentations/pages/auth_page.dart';
import 'package:flutter_auth_firestore_test/features/firestore/presentations/screens/firestore_form_screen.dart';
import 'package:flutter_auth_firestore_test/features/firestore/presentations/screens/firestore_example_screen.dart';
import 'package:flutter_auth_firestore_test/features/firestore/presentations/screens/firestore_list_screen.dart';
import 'package:flutter_auth_firestore_test/features/home/presentations/pages/home_page.dart';

class RouterManager {
  final Map<String, WidgetBuilder> applicationRoutes = {
    AuthPage.routeName: (BuildContext context) => AuthPage(),
    HomePage.routeName: (BuildContext context) => HomePage(),
    FirestoreExampleScreen.routeName: (BuildContext context) =>
        FirestoreExampleScreen(),
    FirestoreFormScreen.routeName: (BuildContext context) =>
        FirestoreFormScreen(),
    FirestoreListScreen.routeName: (BuildContext context) =>
        FirestoreListScreen(),
  };

  Map<String, WidgetBuilder> getApplicationRoutes() {
    return applicationRoutes;
  }
}
