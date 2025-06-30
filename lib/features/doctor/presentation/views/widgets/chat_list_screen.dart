// screens/chat_list_screen.dart

import 'package:booking_app/features/doctor/presentation/doctor_router.dart';
import 'package:booking_app/features/doctor/presentation/view_model/chat_patient_model.dart';
import 'package:booking_app/features/doctor/presentation/views/doctor_chat_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatListScreen extends StatelessWidget {
  final List<ChatUserModel> recentChats = [
    ChatUserModel(
      name: "Nurse Sarah",
      imageUrl: "assets/images/Doctor1.png",
      lastMessage: "Please take the medicine.",
      lastTime: "10:20 AM",
    ),
    ChatUserModel(
      name: "Nurse David",
      imageUrl: "assets/images/Doctor1.png",
      lastMessage: "I'll check on the patient.",
      lastTime: "Yesterday",
    ),
  ];

  ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: recentChats.length,
        itemBuilder: (context, index) {
          final user = recentChats[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.imageUrl),
              radius: 28,
            ),
            title: Text(user.name,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(
              user.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing:
                Text(user.lastTime, style: const TextStyle(color: Colors.grey)),
            onTap: () {
              context.push(DoctorRouter.kDoctorChatView);
            },
          );
        },
      ),
    );
  }
}
