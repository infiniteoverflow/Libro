import 'package:flutter/material.dart';

class BookItemWidget extends StatelessWidget {
  String author, name, img;

  BookItemWidget(this.name, this.img, this.author);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 210,
      margin: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(img),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            author,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.blueGrey[300],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItemWidget extends StatelessWidget {
  String category;
  int number;
  IconData icon;
  Color color = Colors.greenAccent;
  CategoryItemWidget(this.category, this.number, this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 130,
      width: 160,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            spreadRadius: 1,
            offset: Offset(
              1.0,
              4.0,
            ), // shadow direction: bottom right
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 34,
            color: color,
          ),
          Text(
            category,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          Text(
            number.toString() + ' books',
            style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
