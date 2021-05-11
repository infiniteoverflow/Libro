import 'package:flutter/material.dart';

class NotifsScreen extends StatefulWidget {
  @override
  _NotifsScreenState createState() => _NotifsScreenState();
}

class _NotifsScreenState extends State<NotifsScreen> {
  List<NotifsModel> notifsList;

  @override
  void initState() {
    super.initState();
    notifsList = GetNotifsData();
  }

  List<NotifsModel> GetNotifsData() {
    List<NotifsModel> list = List<NotifsModel>();
    var content1 = NotifsModel();
    content1.title = "System notification";
    content1.body = "Take the premium plan sir!!!";
    content1.time = "5 min ago";
    content1.img =
        "https://assets.materialup.com/uploads/fabe9eec-4cbe-49db-846a-dfafd6727939/wFQnMKpl6M1JGhG2nfGY5WGiZqWBkKTsGkFLngwQxjKbEBN6bpAh3ljUu3KQVozH0sI=w300";
    list.add(content1);

    var content2 = NotifsModel();
    content2.title = "Knock Knock!!";
    content2.body = "Hii chef you have a message";
    content2.time = "yesterday";
    content2.img =
        "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d2/Crystal_Clear_kdm_user_female.svg/1200px-Crystal_Clear_kdm_user_female.svg.png";
    list.add(content2);

    var content3 = NotifsModel();
    content3.title = "Yay!! More books";
    content3.body = "Hi chef we have more books";
    content3.time = "2 days ago";
    content3.img =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTB0AqVD7eK_Pwh8gkKB5XyrmVFI2TsypsHdA&usqp=CAU";
    list.add(content3);

    var content4 = NotifsModel();
    content4.title = "Account approved";
    content4.body = "Hi your account is approved";
    content4.time = "a month ago";
    content4.img =
        "http://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png";
    list.add(content4);

    return list;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Widget mPopup() => PopupMenuButton(
          itemBuilder: (context) {
            var list = List<PopupMenuEntry<Object>>();
            list.add(
              PopupMenuItem(
                child: GestureDetector(
                  onTap: () {
                    //can add code for clearing all notifications
                  },
                  child: Text("Clear Notifications"),
                ),
                value: 1,
              ),
            );
            return list;
          },
          child: Container(
              width: size.width * 0.1,
              height: size.width * 0.1,
              padding: EdgeInsets.all(6),
              child: Icon(
                Icons.more_vert,
                color: Colors.black,
              )),
        );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: TextStyle(
            fontFamily: 'Jua',
            fontSize: 25.0,
          ),
        ),
        actions: <Widget>[mPopup()],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: notifsList.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return NotifsTemplate(notifsList[index], index);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class NotifsModel {
  var title = "";
  var body = "";
  var time = "";
  var img = " ";
}

class NotifsTemplate extends StatelessWidget {
  NotifsModel model;

  NotifsTemplate(NotifsModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: ListTile(
              leading: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  height: 50,
                  child: Image.network(model.img)),
              title: Text(
                model.title,
                style: TextStyle(fontFamily: "Jua", color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 4),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          model.body,
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          model.time,
                          style: TextStyle(color: Colors.black38),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              trailing: Container(
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              )),
        ),
      ),
    );
  }
}
