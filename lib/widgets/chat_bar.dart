import 'package:flutter/material.dart';

class ChatBar extends StatelessWidget {
  final id;
  final name;
  Function onTap;

  ChatBar(
    this.id,
    this.name,
    this.onTap,
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Hero(
                        tag: name,
                        child: const CircleAvatar(
                          radius: 25,
                          backgroundColor: Color(0xFFd6e2ea),
                          backgroundImage: NetworkImage(
                            "https://avatars.githubusercontent.com/u/116893?v=4",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
