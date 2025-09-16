import 'package:book_store/futures/sing_up_in/data/repo/auth_repo.dart';
import 'package:book_store/futures/sing_up_in/presintation/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(Authinit());

  Future<void> signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(AuthLoading());
    try {
      final messege = await AuthRepo().singUp(
        email: email,
        password: password,
        name: name,
      );
      emit(AuthMessege(messege: messege));
      // print('success in cubit');
    } catch (e) {
      emit(AuthError(error: e.toString()));
      // print("error in cubit");
    }
  }

  Future<void> verify({required String email, required String otp}) async {
    emit(AuthLoading());
    try {
      final messege = await AuthRepo().verify(email: email, otp: otp);
      //  print('success in cubit');
      emit(AuthMessege(messege: messege));
    } catch (e) {
      // print("error in cubit");
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> logIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final messege = await AuthRepo().logIn(email: email, password: password);
      // print('success in cubit');
      emit(AuthMessege(messege: messege));
    } catch (e) {
      // print('error in cubit');
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> forgetPassWord({required String email}) async {
    emit(AuthLoading());
    try {
      final messege = await AuthRepo().forgetPassWord(email: email);
      // print('success in cubit');
      emit(AuthMessege(messege: messege));
    } catch (e, s) {
      // print('error in cubit');
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> forgetPWVerify({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());
    try {
      final messege = await AuthRepo().forgetPWVerify(email: email, otp: otp);
      // print('success in cubit');
      emit(AuthMessege(messege: messege));
    } catch (e, s) {
      // print('error in cubit');
      emit(AuthError(error: e.toString()));
    }
  }

  Future<void> newPassWord({
    required String reset_token,
    required String newPW,
  }) async {
    emit(AuthLoading());
    try {
      print(reset_token);
      print(newPW);
      final messege = await AuthRepo().newPassWord(
        reset_token: reset_token,
        new_password: newPW,
      );
      print('success in cubit');
      emit(AuthMessege(messege: ""));
    } catch (e, s) {
      print('error in cubit');
      emit(AuthError(error: e.toString()));
    }
  }
}
