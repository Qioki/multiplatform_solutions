import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:multiplatform_solutions/t4/adaptive_widget.dart';
import 'package:multiplatform_solutions/t4/user.dart';
import 'package:multiplatform_solutions/t4/user_grid.dart';
import 'package:multiplatform_solutions/t4/user_list.dart';

void main() {
  runApp(MyAdaptiveApp());
}

List<User> _parseUsers(String jsonString) {
  final parsed = jsonDecode(jsonString)['users'];
  return List<User>.from(parsed.map((json) => User.fromJson(json)));
}

Future<List<User>> _loadUsersFromAsset() async {
  final String jsonString = await rootBundle.loadString('assets/users.json');
  var users = _parseUsers(jsonString);
  return users;
}

class MyAdaptiveApp extends StatefulWidget {
  @override
  State<MyAdaptiveApp> createState() => _MyAdaptiveAppState();
}

class _MyAdaptiveAppState extends State<MyAdaptiveApp> {
  List<User> _users = [];

  Future<void> loadJsonAsset() async {
    var users = await _loadUsersFromAsset();
    setState(() {
      _users = users;
    });
  }

  @override
  void initState() {
    super.initState();
    loadJsonAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: AdaptiveWidget(
        narrow: UserListWidget(users: _users),
        wide: UserGridWidget(users: _users),
      ),
    );
  }
}
