import 'package:chatsocket/screens/admin_main_screen.dart';
import 'package:chatsocket/screens/client_details_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constroller/controller.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AdminMainScreen(),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                width: 300,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Admin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClientDetailsInput(),
                  ),
                );
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
                      "User",
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
    );
  }
}
