import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ChatList extends StatelessWidget {
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

class MessagesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Message> messages = Provider.of<List<Message>>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return messages[index].type == "user" ? ListTile(
            title: Text(messages[index].text),
            subtitle: Text(messages[index].sender),
            trailing: Image.asset(
              'assets/chat_icon.png', // Replace with your chat icon SVG
              width: 24,
              height: 24,
            ),
          ) : ListTile(
            title: Text(messages[index].text),
            subtitle: Text(messages[index].sender),
            trailing: Image.asset(
              'assets/chat_icon1.png', // Replace with your chat icon SVG
              width: 24,
              height: 24,
            ),
          );
        },
      ));

  }
}

class Message {
  final String text;
  final String sender;
final String type;
  Message({required this.text, required this.sender,required this.type});

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      text: data['text'] ?? '',
      sender: data['sender'] ?? '',
      type: data['type'] ?? '',
    );
  }
}