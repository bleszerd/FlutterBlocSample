import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';

abstract class UserState {
  List<User> users;

  UserState({
    required this.users,
  });
}

class UserInitialState extends UserState {
  UserInitialState() : super(users: []);
}

class UserAddSuccessState extends UserState {
  UserAddSuccessState({
    required List<User> users,
  }) : super(users: users);
}
