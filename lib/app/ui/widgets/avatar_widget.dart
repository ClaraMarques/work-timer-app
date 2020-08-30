import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return PopupMenuButton<String>(
      icon: _buildAvatarPhoto(user),
      onSelected: (String value) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: "profile",
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: _buildAvatarPhoto(user),
            title: Text(user.name),
            subtitle: FittedBox(child: Text(user.email)),
          ),
        ),
        PopupMenuItem<String>(
          value: "exit",
          child: Row(
            children: [
              Icon(Icons.exit_to_app),
              SizedBox(width: 8),
              Text("Exit"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarPhoto(User user) {
    return user == null
        ? CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(user.name[0]),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.photo),
          );
  }
}
