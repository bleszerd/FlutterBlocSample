import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';

abstract class GetUserListDatasource {
  List<User> getUsers();
}
