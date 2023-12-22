// File: lib/blocs/auth/auth_bloc.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_manager.dart';

enum AuthEvent { checkAuthStatus, signedOut }

class AuthState {
  final User? user;

  AuthState(this.user);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthManager _authManager;

  AuthBloc(this._authManager)
      : super(AuthState(_authManager.getCurrentUser())) {
    on<AuthEvent>((event, emit) async {
      if (event == AuthEvent.checkAuthStatus) {
        emit(AuthState(_authManager.getCurrentUser()));
      } else if (event == AuthEvent.signedOut) {
        await _authManager.signOut();
        emit(AuthState(null));
      }
    });
  }

  AuthManager get authManager => _authManager;
}
