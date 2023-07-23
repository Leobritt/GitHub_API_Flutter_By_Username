import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_by_username/components/list_user.dart';
import 'package:flutter_application_by_username/components/user_form.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _listUsers = <User>[];

  Future<void> searchUserName(String username) async {
    var response = await http.get(Uri.parse(
        "https://api.github.com/search/users?q=$username&page=0&per_page=10%22"));
    var data = jsonDecode(response.body);

    setState(() {
      _listUsers =
          (data['items'] as List).map((e) => User.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Center(child: Text('API Git Hub APP')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: FormUser(onSearch: searchUserName)),
            Flexible(
              child: _listUsers.isNotEmpty
                  ? UserList(listUsers: _listUsers)
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
