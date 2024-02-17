import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controller/Chat.dart';
class ChatData extends StatelessWidget {
  const ChatData({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Message>>.value(
      value: FirebaseFirestore.instance.collection('messages').snapshots().map((snapshot) {
        return snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList();
      }),
      initialData: [],
      child: MessagesListView(),
    );
  }
}

class ChatProvider with ChangeNotifier {
  List<Message> _messages = [];

  List<Message> get messages => _messages;

  void addMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }
}

class Message {
  final String text;
  final String sender;
  final String type;

  Message({required this.text, required this.sender, required this.type});

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      text: data['text'] ?? '',
      sender: data['sender'] ?? '',
      type: data['type'] ?? '',
    );
  }
}