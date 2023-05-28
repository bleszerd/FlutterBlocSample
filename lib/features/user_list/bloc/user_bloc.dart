import 'dart:async';

import 'package:userlist_bloc_experience/bloc/states/user_state.dart';
import 'package:userlist_bloc_experience/features/user_list/data/datasource/in_memory/get_user_list_in_memory_datasource_impl.dart';
import 'package:userlist_bloc_experience/features/user_list/data/repositories/user_repository_impl.dart';
import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';
import 'package:userlist_bloc_experience/features/user_list/events/user_list_events.dart';

class UserBlock {
  // DI needed!
  final _userRepository = UserRepositoryImpl(
    GetUserListInMemoryDatasourceImpl(),
  );

  final StreamController<UserListEvent> _inputUserListController =
      StreamController<UserListEvent>();

  final StreamController<UserState> _outputUserListController =
      StreamController<UserState>();

  Sink<UserListEvent> get inputUser => _inputUserListController.sink;
  Stream<UserState> get stream => _outputUserListController.stream;

  UserBlock() {
    _inputUserListController.stream.listen(_mapEventToState);
  }

  _mapEventToState(UserListEvent event) {
    List<User> users = [];

    if (event is LoadUserListEvent) {
      users = _userRepository.loadUsers();
    } else if (event is AddUserToListEvent) {
      users = _userRepository.addUser(event.user);
    } else if (event is RemoveUserFromListEvent) {
      users = _userRepository.removeUser(event.user);
    }

    _outputUserListController.add(
      UserAddSuccessState(users: users),
    );
  }
}
