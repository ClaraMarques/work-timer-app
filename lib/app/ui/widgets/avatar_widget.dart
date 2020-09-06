import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/user_model.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: _buildUserInfo(user),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                }, // TODO: add log out service call.
                child: Text('Log out'),
              )
            ],
          ),
        ),
        child: _buildAvatarPhoto(user),
      ),
    );
  }

  Widget _buildAvatarPhoto(User user, {double radius}) {
    return CircleAvatar(
      backgroundImage: NetworkImage(user.photo),
      radius: radius,
    );
  }

  Widget _buildUserInfo(User user) {
    return ListTile(
      leading: _buildAvatarPhoto(user),
      title: Text(user.name),
      subtitle: FittedBox(child: Text(user.email)),
    );
  }
}
