import 'chat_firebase_service.dart';
import '/core/models/chat_message.dart';
import '/core/models/chat_user.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    return ChatFirebaseService();
  }
}
