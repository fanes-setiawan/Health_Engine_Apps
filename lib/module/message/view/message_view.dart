import 'package:flutter/material.dart';
import 'package:healthengineapps/core.dart';
import '../../../model/colors/customColors.dart';
import '../controller/message_controller.dart';

class MessageView extends StatefulWidget {
  const MessageView({Key? key}) : super(key: key);

  Widget build(context, MessageController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Message"),
        actions: const [],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final reversedIndex = controller.messages.length - 1 - index;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8),
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.messages[reversedIndex]['message'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 3),
                              Text(
                                controller.messages[reversedIndex]['time']
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x10000009),
                          blurRadius: 3,
                          offset: Offset(03, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: controller.textEditingController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                        hintText: 'Type message...',
                      ),
                      minLines: 1,
                      maxLines: 4,
                      textInputAction: TextInputAction.newline,
                      onEditingComplete: () {},
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: CustomColor.darkgreen,
                  ),
                  onPressed: controller.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<MessageView> createState() => MessageController();
}
