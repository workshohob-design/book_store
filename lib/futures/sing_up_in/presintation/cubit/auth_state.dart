abstract class AuthState {
  // final bool isLoading;
  // final String? error;
  // final String? messege;

  // AuthState({this.isLoading = false, this.error, this.messege});

  // AuthState copyWhith({bool? isLoading, String? error, String? messege}) {
  //   return AuthState(
  //     isLoading: isLoading ?? this.isLoading,
  //     error: error,
  //     messege: messege,
  //   );
  // }
}

class Authinit extends AuthState {}

class AuthLoading extends AuthState {}

class AuthMessege extends AuthState {
  final String messege;
  AuthMessege({required this.messege});
}

class AuthError extends AuthState {
  final String error;
  AuthError({required this.error});
}
