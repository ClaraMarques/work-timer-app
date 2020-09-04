import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work_timer_app/app/blocs/auth_bloc.dart';
import 'package:work_timer_app/app/locator.dart';

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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAvatarPhoto(user, radius: 64),
        Text(user.name),
        Text(user.email)
      ],
    );
  }
}
