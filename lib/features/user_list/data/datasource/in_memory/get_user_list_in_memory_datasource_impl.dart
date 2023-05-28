import 'package:userlist_bloc_experience/features/user_list/data/datasource/get_user_list_datasource.dart';
import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';

class GetUserListInMemoryDatasourceImpl implements GetUserListDatasource {
  @override
  List<User> getUsers() {
    List<User> users = [
      User(name: "Andre"),
      User(name: "Diogo"),
      User(name: "Angelo"),
      User(name: "Pedro"),
      User(name: "Haryel"),
    ];

    return users;
  }
}
