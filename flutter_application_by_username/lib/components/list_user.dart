import 'package:flutter/material.dart';
import 'package:flutter_application_by_username/components/repository_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user.dart';

class UserList extends StatelessWidget {
  const UserList({super.key, required this.listUsers});

  final List<User> listUsers;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          elevation: 5.0,
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Column(
              children: [
                //fazer class form
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(listUsers[index].avatarUrl),
                  ),
                  title: Text(listUsers[index].login),
                ),
                ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () async {
                          var url = listUsers[index].url;

                          // ignore: deprecated_member_use
                          if (await canLaunch(url)) {
                            // ignore: deprecated_member_use
                            await launch(url);
                          }
                        },
                        child: const Text("Open profile")),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepositoryPage(
                                userLogin: listUsers[index].login),
                          ),
                        );
                      },
                      child: const Text("Open Repositories"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      itemCount: listUsers.length,
    );
  }
}
