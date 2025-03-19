import 'package:abo_bashir_market/data/services/api_service.dart';
import 'package:abo_bashir_market/register/cubit/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final ApiService apiService;

  AuthCubit(this.apiService) : super(AuthInitial());

  Future<void> signUp(Map<String, dynamic> userData) async {
    emit(AuthLoading());
    try {
      //send data to api
      final response = await apiService.registerUser(userData: userData);
      print(response);
      // emit(AuthSuccess(response.data['token']));
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> emailVerify({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading()); // Show loading state
    try {
      final response = await apiService.emailVerify(email: email, otp: otp);
      // You can handle the response here, for example:
      // If the verification is successful:
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthError(e.toString())); // Emit error if there is an exception
    }
  }

  Future<void> login(Map<String, dynamic> loginData) async {
    emit(AuthLoading());
    try {
      final response = await apiService.login(loginData);
      // emit(AuthSuccess(response.data['token']));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> logout(String token) async {
    emit(AuthLoading());
    try {
      await apiService.logout(token);
      emit(AuthLogout());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
