import 'package:flutter/material.dart';

class ParticipantList extends StatefulWidget {
  const ParticipantList({Key? key}) : super(key: key);

  @override
  _ParticipantListState createState() => _ParticipantListState();
}

class User {
  final String username;
  final String email;

  const User({required this.username, required this.email});
}

class _ParticipantListState extends State<ParticipantList> {
  List<User> users = [
    const User(
      username: 'Seto Yogo',
      email: 'setoyogo@gmail.com',
    ),
    const User(
      username: 'Widyo Yogo',
      email: 'widyoyogo@gmail.com',
    ),
    const User(
      username: 'Yogo Suhendro',
      email: 'yogosuhendro@gmail.com',
    ),
    const User(
      username: 'Seto Widyo',
      email: 'setowidyo@gmail.com',
    ),
    const User(
      username: 'Yogo Widyo',
      email: 'yogowidyo@gmail.com',
    ),
    const User(
      username: 'Suhendro Yogo',
      email: 'suhendroyogo@gmail.com',
    ),
    const User(
      username: 'Seto Suhendro',
      email: 'setosuhendro@gmail.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                        Colors.red,
                        Color.fromRGBO(5, 134, 240, 0.856)
                      ])),
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Participant List",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                                contentPadding: EdgeInsets.all(10.0),
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 3, 68, 121),
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: MediaQuery.removePadding(
            context: context,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1661209851626-20d6fb8022e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80"),
                      ),
                      title: Text(user.username),
                      subtitle: Text(user.email),
                      trailing: const Icon(Icons.delete),
                    ),
                  );
                }),
          ))
        ],
      ),
    );
  }
}
