import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_timer_app/app/blocs/auth_bloc.dart';
import 'package:work_timer_app/app/locator.dart';

import '../../data/models/user_model.dart';

class AvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      icon: _buildAvatarPhoto(user),
      onSelected: _onPopupItemSelected,
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
    return CircleAvatar(backgroundImage: NetworkImage(user.photo));
  }

  void _onPopupItemSelected(String value) {
    if (value == "exit") {
      locator.get<AuthBloc>().logOut();
    }
  }
}
