import '../domain/entities/user.dart';

abstract class UserListEvent {}

class LoadUserListEvent extends UserListEvent {}

class AddUserToListEvent extends UserListEvent {
  User user;

  AddUserToListEvent({
    required this.user,
  });
}

class RemoveUserFromListEvent extends UserListEvent {
  User user;

  RemoveUserFromListEvent({
    required this.user,
  });
}
