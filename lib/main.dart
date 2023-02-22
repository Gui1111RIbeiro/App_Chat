import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/services/notification/chat_notification_service.dart';
import 'screens/auth_or_app_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChatNotificationService(),
        )
      ],
      child: MaterialApp(
        title: 'Chat',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const AuthOrAppScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
