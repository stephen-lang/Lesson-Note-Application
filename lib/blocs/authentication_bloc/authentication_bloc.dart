import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
      // first we create the instance of the UserRepository 
  final UserRepository userRepository;

  late final StreamSubscription<MyUser?> _userSubscription;
 
 //This is the constructor of the AuthenticationBloc class.
  AuthenticationBloc({required this.userRepository})
      : super(const AuthenticationState.unknown()) {
        //userRepository.user refers to a stream that emits changes related to the user's authentication state.
//The listen function subscribes to that stream.
    _userSubscription = userRepository.user.listen((user) {
      add(AuthenticationUserChanged(user));
    });
 
 // calls the authenticationuserchanged in the 
    on<AuthenticationUserChanged>((event, emit) {
      if (event.user != MyUser.empty) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(const AuthenticationState.unauthenticated());
      }
    });
  }

  @override
  Future<void> close() { 
    _userSubscription.cancel();
    return super.close();
  }
}
