import 'package:chat_app/user.dart';
import 'package:chat_app/views/chatroom.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return ChatRoom();
    }
  }
}
