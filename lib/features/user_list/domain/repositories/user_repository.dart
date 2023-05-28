import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';

abstract class UserRepository {
  List<User> loadUsers();
  List<User> addUser(User user);
  List<User> removeUser(User user);
}
