import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/auth/presentation/cubit/login_cubit/login_state.dart';
import '../../../data/api_service/auth_Service.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authService = AuthService();
  Future<void> login({required email, required password}) async {
    authService
        .login(email: email, password: password)
        .then(
          (value) {
            log('Login Successfully');
            emit(LoginSuccess());
          },
          onError: (e) {
            log('Login Failed:$e');
            emit(LoginFailure());
          },
        );
  }
}
