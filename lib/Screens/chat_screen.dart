import 'package:flutter/material.dart';
import '../Utils/Styles.dart';
import './conversations.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatModel> chatList;

  @override
  void initState() {
    super.initState();
    chatList = GetChatData();
  }

  List<ChatModel> GetChatData() {
    List<ChatModel> list = List<ChatModel>();
    var content1 = ChatModel();
    content1.name = "Alice Smith";
    content1.msg = "Hi Alice How are you";
    content1.img = "http://tny.im/oz7";
    content1.isOnline = true;
    list.add(content1);

    var content2 = ChatModel();
    content2.name = "Hennah Tran";
    content2.msg = "Hi can u explain me this topic?";
    content2.img = "http://tny.im/oz6";
    list.add(content2);

    var content3 = ChatModel();
    content3.name = "Hennah Tran";
    content3.msg = "Hi can u explain me this topic?";
    content3.img = "http://tny.im/oz7";
    list.add(content3);

    var content4 = ChatModel();
    content4.name = "Hennah Tran";
    content4.msg = "Hi can u explain me this topic?";
    content4.img = "http://tny.im/oz6";
    content4.isOnline = true;
    list.add(content4);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    final listInTab = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: chatList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatsData(chatList[index], index);
            },
          ),
        ],
      ),
    );

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: new Container(
            child: new SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 8, right: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: [
                                BackButton(),
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Text(
                                    "Chats",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Jua",
                                        fontSize: 30.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Padding(
                                padding: EdgeInsets.only(top: 1),
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  color: Colors.white,
                                  child: Icon(Icons.search,
                                      size: 30, color: Colors.blue),
                                ),
                              ),
                              onTap: () {
                                print('Search');
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: listInTab);
  }
}

class ChatModel {
  var name = "";
  var msg = "";
  var img = "";
  var isOnline = false;
}

class ChatsData extends StatelessWidget {
  ChatModel model;

  ChatsData(ChatModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChatConversations();
                        },
                      ),
                    );
      },
      child: Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(model.img),
                    radius: MediaQuery.of(context).size.width * 0.09,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4, right: 2),
                    child: Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: model.isOnline
                              ? Colors.green
                              : Colors.grey.withOpacity(1.0),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 1.5)),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      model.name,
                      style: TextStyle(fontFamily: "Jua", color: Colors.black),
                    ),
                    SizedBox(width: 4),
                    Text(model.msg,
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                        maxLines: 1),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
