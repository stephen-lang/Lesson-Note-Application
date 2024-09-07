import '../entities/entities.dart';

//class
class MyUser {
  //properties
  String userId;
  String email;
  String name;
  bool hasActiveCart;

//constructor
  MyUser({ 
    /// In Dart, the `required` keyword is used in constructor parameters to indicate that the parameter
    /// must be provided when creating an instance of the class. In the `MyUser` class constructor,
    /// `required this.userId` means that when creating a new `MyUser` object, the `userId` parameter
    /// must be provided and cannot be omitted. This helps enforce that the necessary data is provided
    /// when initializing a `MyUser` object.
    required this.userId,
    required this.email,
    required this.name,
    required this.hasActiveCart,
  });

  static final empty = MyUser(
		userId: '', 
		email: '', 
		name: '',
    hasActiveCart: false,
	);
 // take MyUser object and transforms it into a JsoN object into the database
  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId, 
      email: email, 
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }
 // takes it from database and creates a JSON object
  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId, 
      email: entity.email, 
      name: entity.name, 
      hasActiveCart: entity.hasActiveCart
    );
  }

  @override
 /// The `toString()` function returns a formatted string representation of a `MyUser` object.
 /// 
 /// Returns:
 ///   The `toString()` method is returning a formatted string that includes the values of `userId`,
 /// `email`, `name`, and `hasActiveCart` properties of an object of type `MyUser`.
   String toString() {
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }
}