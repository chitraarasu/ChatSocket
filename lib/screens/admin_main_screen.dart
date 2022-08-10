import 'package:chatsocket/constroller/controller.dart';
import 'package:chatsocket/screens/chat_screen.dart';
import 'package:chatsocket/widgets/chat_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({Key? key}) : super(key: key);

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<Controller>().createUser("ADMIN");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin"),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<Controller>(
          builder: (getController) {
            return ListView.builder(
              itemCount: getController.adminChatList.length,
              itemBuilder: (BuildContext context, int index) => ChatBar(
                index + 1,
                getController.adminChatList[index],
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(
                        index + 1,
                        getController.adminChatList[index],
                        "ADMIN",
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
