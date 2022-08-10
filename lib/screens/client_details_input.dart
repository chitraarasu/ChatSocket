import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constroller/controller.dart';
import 'chat_screen.dart';

class ClientDetailsInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (_controller.text.trim().isNotEmpty) {
                            Get.find<Controller>()
                                .createUser(_controller.text.trim());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  "0",
                                  "Admin",
                                  _controller.text.trim(),
                                ),
                              ),
                            );
                          }
                        },
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightBlueAccent,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                "Start",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
