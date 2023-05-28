import 'package:userlist_bloc_experience/features/user_list/data/datasource/get_user_list_datasource.dart';
import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';
import 'package:userlist_bloc_experience/features/user_list/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final GetUserListDatasource _getUserListDatasource;

  UserRepositoryImpl(this._getUserListDatasource);

  List<User> _users = [];

  @override
  List<User> loadUsers() {
    List<User> users = _getUserListDatasource.getUsers();

    _users = users;
    return _users;
  }

  @override
  List<User> addUser(User user) {
    _users.add(user);
    return _users;
  }

  @override
  List<User> removeUser(User user) {
    _users.remove(user);
    return _users;
  }
}
