import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constroller/controller.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatelessWidget {
  final receiver;
  final id;
  final userName;

  ChatScreen(this.id, this.receiver, this.userName);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Hero(
              tag: receiver,
              child: const CircleAvatar(
                backgroundColor: Color(0xFFd6e2ea),
                backgroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/116893?v=4"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                receiver,
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<Controller>(
              builder: (getController) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  itemCount: getController.messages.containsKey(
                          receiver == "Admin" ? userName : receiver)
                      ? getController
                          .messages[receiver == "Admin" ? userName : receiver]
                          .length
                      : 0,
                  itemBuilder: (ctx, index) {
                    return MessageBubble(
                      getController.messages[receiver == "Admin"
                          ? userName
                          : receiver][index]["message"],
                      getController.messages[receiver == "Admin"
                              ? userName
                              : receiver][index]["sender"] ==
                          userName,
                      getController.messages[receiver == "Admin"
                          ? userName
                          : receiver][index]["sender"],
                    );
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFf7f7f7),
                        border: Border.all(
                          width: 1,
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: TextField(
                              textCapitalization: TextCapitalization.sentences,
                              controller: _controller,
                              minLines: 1,
                              maxLines: 5,
                              keyboardType: TextInputType.multiline, //
                              textInputAction: TextInputAction.newline,
                              decoration: const InputDecoration(
                                hintText: "Type your message here",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    if (_controller.text.trim().isNotEmpty) {
                      if (userName != "ADMIN") {
                        Get.find<Controller>().sendMessage({
                          "message": _controller.text.trim(),
                          "sender": userName,
                          "targetId": receiver.toUpperCase(),
                        });
                      } else {
                        Get.find<Controller>().sendMessage({
                          "message": _controller.text.trim(),
                          "sender": userName,
                          "targetId": receiver,
                        });
                      }
                    }
                    _controller.clear();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
