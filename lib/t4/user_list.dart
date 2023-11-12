import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/t4/user.dart';
import 'package:popover/popover.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({required this.users, super.key});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Adaptive app')),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: PopupMenuButton(
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
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                title: Text('${user.name} ${user.lastname}'),
                subtitle: Text(user.email),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image, scale: 1),
                ),
                tileColor: Colors.lightBlue,
              ),
            ),
            // ),
          );
        },
      ),
    );
  }
}
