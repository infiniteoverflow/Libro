import 'package:flutter/material.dart';
import 'package:emoji_picker/emoji_picker.dart';

class ChatConversations extends StatefulWidget {
  @override
  _ChatConversationsState createState() => _ChatConversationsState();
}

class _ChatConversationsState extends State<ChatConversations> {
  List<ConversationModel> chatmsg;
  TextEditingController msg = new TextEditingController();
  int count = 0;
  bool isShowSticker;

  Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
    chatmsg = getMessages();
    count = 1;
    isShowSticker = false;
  }

  ScrollController controller = new ScrollController();

  List<ConversationModel> getMessages() {
    List<ConversationModel> list = List();

    ConversationModel model1 = ConversationModel(1, 'Hello Naruto');
    ConversationModel model2 = ConversationModel(2, 'Oyaji...');
    ConversationModel model3 = ConversationModel(3,
        'I am Fourth Hokage here...to look for you..Hope you are doing fine');
    ConversationModel model4 = ConversationModel(4, 'Yes i am....');

    list.add(model1);
    list.add(model2);
    list.add(model3);
    list.add(model4);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget buildChatMessages(ConversationModel message) {
      if (message.count % 2 != 0) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Container(
                alignment: Alignment.centerRight,
                width: MediaQuery.of(context).size.width * 0.45,
                decoration: BoxDecoration(
                    color: Color(0xFF345FFB),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                  child: Text(
                    message.message,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    maxLines: null,
                  ),
                ),
              ),
            ),
          ],
        );
      } else {
        return Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFF6F7FA),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      message.message,
                      style: TextStyle(color: Colors.black, fontSize: 16.0),
                      maxLines: null,
                    ),
                  ),
                )),
          ],
        );
      }
    }

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(width * 0.25),
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 16),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_back, color: Colors.blue),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            SizedBox(width: 50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Naruto Uzamaki",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontFamily: "Jua"),
                                ),
                                Text(
                                  "Active",
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 14.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: onBackPress,
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, i) => buildChatMessages(chatmsg[i]),
                itemCount: chatmsg.length,
                controller: controller,
                shrinkWrap: true,
                padding: EdgeInsets.only(bottom: 60),
              ),
              isShowSticker ? inputWidget(208, width) : inputWidget(0, width),
              isShowSticker
                  ? Positioned(
                      bottom: 0,
                      child: buildSticker(),
                    )
                  : Container(),
            ],
          ),
        ));
  }

  Widget inputWidget(double val, double width) {
    return Positioned(
      bottom: val,
      child: Container(
        height: 60,
        width: width,
        margin: EdgeInsets.only(top: 8),
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: <Widget>[
            InkWell(
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset("assets/images/emoji.png",
                      height: 30, width: 30)),
              onTap: () {
                FocusScope.of(context).unfocus();
                setState(() {
                  isShowSticker = !isShowSticker;
                });
              },
            ),
            Expanded(
              child: TextFormField(
                onTap: () {
                  controller.jumpTo(controller.position.maxScrollExtent);
                  if (isShowSticker) {
                    onBackPress();
                  }
                },
                style: TextStyle(fontSize: 14.0, fontFamily: "Jua"),
                controller: msg,
                decoration: InputDecoration(
                  hintText: "Type a message",
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0),
                  ),
                ),
              ),
            ),
            InkWell(
              child: Container(
                child: Icon(Icons.send, size: 24, color: Colors.white),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(right: 8, left: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF345FFB),
                  shape: BoxShape.circle,
                ),
              ),
              onTap: () {
                chatmsg.add(new ConversationModel(count, msg.text));
                count++;
                msg.text = "";
                controller.jumpTo(controller.position.maxScrollExtent);
                if (isShowSticker) {
                  onBackPress();
                }
                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSticker() {
    return EmojiPicker(
      rows: 3,
      columns: 7,
      buttonMode: ButtonMode.MATERIAL,
      recommendKeywords: ["racing", "horse"],
      numRecommended: 10,
      onEmojiSelected: (emoji, category) {
        print(emoji);
        msg.text += emoji.emoji;
      },
    );
  }
}

class ConversationModel {
  int count;
  String message;

  ConversationModel(this.count, this.message);
}
