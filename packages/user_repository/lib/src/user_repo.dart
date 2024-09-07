import 'models/models.dart';

/// The `abstract` keyword in Dart is used to define an abstract class. An abstract class cannot be
/// instantiated directly, but it can be used as a base for other classes to inherit from. Abstract
/// classes can contain abstract methods (methods without a body) that must be implemented by any class
/// that extends the abstract class. In the provided code snippet, the `UserRepository` class is an
/// abstract class that defines abstract methods for signing up, setting user data, signing in, and
/// logging out. Any class that extends `UserRepository` must implement these abstract methods.
 abstract class UserRepository {
  Stream<MyUser?> get user;

	Future<MyUser> signUp(MyUser myUser, String password);

	Future<void> setUserData(MyUser user);

	Future<void> signIn(String email, String password);

	Future<void> logOut();
}