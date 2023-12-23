import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/auth/auth_bloc.dart';
import '../../../../core/auth/auth_manager.dart';

import './features/auth/presentations/pages/auth_page.dart';
import './features/home/presentations/pages/home_page.dart';
import 'router_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authManager = AuthManager();
    final routerManager = RouterManager();

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (context) => AuthBloc(authManager),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.user == null) {
              return AuthPage();
            } else {
              return HomePage();
            }
          },
        ),
      ),
      initialRoute: '/',
      routes: routerManager.getApplicationRoutes(),
    );
  }
}
