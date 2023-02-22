import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'auth_screen.dart';
import 'chat_screen.dart';
import 'loading_screen.dart';
import '/core/models/chat_user.dart';
import '/core/services/auth/auth_service.dart';
import '/core/services/notification/chat_notification_service.dart';

class AuthOrAppScreen extends StatelessWidget {
  const AuthOrAppScreen({super.key});

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
    // ignore: use_build_context_synchronously
    await Provider.of<ChatNotificationService>(
      context,
      listen: false,
    ).init();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return StreamBuilder<ChatUser?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else {
                return snapshot.hasData
                    ? const ChatScreen()
                    : const AuthScreen();
              }
            },
          );
        }
      },
    );
  }
}
