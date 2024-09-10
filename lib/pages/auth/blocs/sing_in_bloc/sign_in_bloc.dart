import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc(this._userRepository) : super(SignInInitial()) {
    on<SignInRequired>((event, emit) async {
      emit(SignInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
          emit(SignInSuccess());
      } catch (e) {
        emit(SignInFailure());
      }
    });

    on<SignOutRequired>((event, emit) async {
      // Handle logout if necessary
      await _userRepository.logOut();
      emit(SignInInitial()); // Reset to initial state
    });
  }
}
