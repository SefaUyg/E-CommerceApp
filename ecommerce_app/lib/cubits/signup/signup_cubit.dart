import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/models/user_model.dart';
import 'package:ecommerce_app/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final AuthRepository _authRepository;

  SignupCubit({
    required AuthRepository authRepository
  }) : _authRepository = authRepository,
       super(SignupState.initial());

  void userChanged(User user){
    emit(state.copyWith(
      user: user,
      status: SignupStatus.initial,
    ));
  }

  void passwordChanged(String value){
    emit(state.copyWith(password: value, status: SignupStatus.initial));
  }

  Future<void> signUpWithCredentials() async{
    if(!state.isFormVaild || state.status == SignupStatus.submitting) return;
    emit(state.copyWith(status: SignupStatus.submitting));
    try{
      var authUser = await _authRepository.signUp(
        password: state.password,
        user: state.user!,
        );
        emit(state.copyWith(status: SignupStatus.success, authUser: authUser));
    } catch(_){}
  }
}
