import 'package:equatable/equatable.dart';

class UserModels extends Equatable {
  final String id;
  final String name;
  final String email;
  final String password;
  final String konfirmpassword;

  const UserModels({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.konfirmpassword,
  });

  @override
  List<Object?> get props => [id, name, email, password, konfirmpassword];
}
