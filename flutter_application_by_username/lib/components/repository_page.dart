import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/repository.dart';

class RepositoryPage extends StatefulWidget {
  final String userLogin;

  const RepositoryPage({super.key, required this.userLogin});

  @override
  State<RepositoryPage> createState() => _RepositoryPageState();
}

class _RepositoryPageState extends State<RepositoryPage> {
  List<Repository> _repositories = [];

  @override
  void initState() {
    super.initState();
    fetchRepositories();
  }

  Future<void> fetchRepositories() async {
    final response = await http.get(
      Uri.parse('https://api.github.com/users/${widget.userLogin}/repos'),
    );

    final List<dynamic> data = jsonDecode(response.body);
    setState(() {
      _repositories = data.map((repo) => Repository.fromJson(repo)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final repository = _repositories[index];
            return Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(repository.name),
                      subtitle: Text(repository.description),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: _repositories.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
