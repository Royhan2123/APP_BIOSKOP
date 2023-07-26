import 'package:apk_bioskop/models/auth_services.dart';
import 'package:apk_bioskop/models/user_services.dart';
import 'package:apk_bioskop/models/users_models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String email,
    required String password,
    required String name,
    required String konfirmpassword,
  }) async {
    try {
      emit(AuthLoading());
      UserModels user = await AuthServices().signUp(
          name: name,
          email: email,
          password: password,
          konfirmpassword: konfirmpassword);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    UserModels user =
        await AuthServices().signIn(email: email, password: password);
    emit(AuthSucces(user));
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthServices().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void dataId(String id) async {
    try {
      emit(AuthLoading());
      UserModels user = await UserServices().dataId(id);
      emit(AuthSucces(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
