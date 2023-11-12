import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/t4/user.dart';

class UserGridWidget extends StatelessWidget {
  const UserGridWidget({required this.users, super.key});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: double.infinity,
            width: 200,
            color: Colors.lightBlue,
            child: Container(
              padding: EdgeInsets.all(8),
              alignment: Alignment.topCenter,
              child: const Text(
                'Adaptive app',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return PopupMenuButton(
                    position: PopupMenuPosition.under,
                    tooltip: '',
                    itemBuilder: (context) {
                      return const [
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('View profiles'),
                            leading: Icon(Icons.person),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('Friends'),
                            leading: Icon(Icons.people),
                          ),
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            title: Text('Report'),
                            leading: Icon(Icons.document_scanner),
                          ),
                        ),
                      ];
                    },
                    child: Card(
                      // elevation: 2,
                      color: Colors.lightBlue,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: CircleAvatar(
                                radius: double.infinity,
                                backgroundImage:
                                    NetworkImage(user.image, scale: 1),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text('${user.name} ${user.lastname}'),
                            Text(user.email),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
