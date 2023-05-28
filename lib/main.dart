import 'package:flutter/material.dart';
import 'package:userlist_bloc_experience/features/user_list/bloc/user_bloc.dart';
import 'package:userlist_bloc_experience/bloc/states/user_state.dart';
import 'package:userlist_bloc_experience/features/user_list/domain/entities/user.dart';
import 'package:userlist_bloc_experience/features/user_list/events/user_list_events.dart';
import 'package:userlist_bloc_experience/shared/utils/status_bar_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyList(),
    );
  }
}

class MyList extends StatefulWidget {
  const MyList({super.key});

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  late final UserBlock userBloc;

  @override
  void initState() {
    super.initState();

    StatusBarUtils.setColor(Brightness.light, Colors.deepPurple);

    userBloc = UserBlock();
    userBloc.inputUser.add(LoadUserListEvent());
  }

  @override
  void dispose() {
    userBloc.inputUser.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<UserState>(
          stream: userBloc.stream,
          builder: (context, AsyncSnapshot<UserState> snapshot) {
            final userList = snapshot.data?.users ?? [];

            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 12, top: 12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Users",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    userBloc.inputUser.add(
                                      AddUserToListEvent(
                                        user: User(name: "Vinícius"),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.person_add,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    userBloc.inputUser.add(
                                      LoadUserListEvent(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.refresh,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Hold an user card to delete",
                            style: TextStyle(color: Colors.white60),
                          ),
                        ),
                        SizedBox(height: 24)
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                ),
                Expanded(
                  child: Scrollbar(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ListTile(
                        onLongPress: () {
                          userBloc.inputUser.add(
                            RemoveUserFromListEvent(
                              user: userList[index],
                            ),
                          );
                        },
                        title: Text(userList[index].name),
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurple,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Text(
                              userList[index].name.substring(0, 1),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      itemCount: userList.length,
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
