import 'package:flutter/material.dart';
import '../Utils/percent_indicator.dart';

class Description extends StatefulWidget {
  
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  var position = 0;
  bool isExpanded = false;
  var selectedColor = -1;
  var selectedSize = -1;
  double fiveStar = 0;
  double fourStar = 0;
  double threeStar = 0;
  double twoStar = 0;
  double oneStar = 0;
  List<ReviewModel> reviewList;
  var reviewcount = 4;

  @override
  void initState() {
    super.initState();
    reviewList = GetReviewData();
  }


  setRating() {

    ///Use this code when backend is ready with ratings
    ///({ratingstar} * 100) / widget.ratingcount.toDouble()
    fiveStar = 0;
    fourStar = 0;
    threeStar = 0;
    twoStar = 0;
    oneStar = 0;
    print(fiveStar);
  }
  
  List<ReviewModel> GetReviewData() {
    List<ReviewModel> list = List<ReviewModel>();
    var content1 = ReviewModel();
    content1.name = "Alice Smith";
    content1.msg = "Best book !!";
    content1.img = "http://tny.im/oz7";
    content1.rating = "2";
    list.add(content1);

    var content2 = ReviewModel();
    content2.name = "Hennah Tran";
    content2.msg = "When will the next chapter release?";
    content2.img = "http://tny.im/oz6";
    content2.rating = "4";
    list.add(content2);

    var content3 = ReviewModel();
    content3.name = "Hennah Tran";
    content3.msg = "shubharashi";
    content3.img = "http://tny.im/oz7";
    content3.rating = "3";
    list.add(content3);

    var content4 = ReviewModel();
    content4.name = "Hennah Tran";
    content4.msg = "Wonderfull";
    content4.img = "http://tny.im/oz6";
    content4.rating = "4";
    list.add(content4);

    return list;
  }



  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    var sliderImages = Container(
      height: 340,
      child: PageView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Hero(
            tag: "book1",
            child: Image.asset(
              "assets/images/profile_covr_page.png",
              width: width,
              height: width * 1.05,
              fit: BoxFit.cover,
            ),
          );
          //return Image.network(widget.image, width: width, height: width * 1.05, fit: BoxFit.cover,);
        },
        onPageChanged: (index) {
          position = index;
          setState(() {});
        },
      ),
    );

    var productInfo = Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Romio and Juliet",style: TextStyle(color: Colors.black,fontFamily: "Jua", fontSize: 22.0),),
              Text(
                "\u{20B9}" + " 100",style: TextStyle(color: Colors.green,fontSize: 22.0,),
              )
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(16.0)),
                        color: Colors.green,
                        //color: Colors.green
                      ),
                      child: Row(
                        children: <Widget>[
                          Text("4.5",style: TextStyle(color: Colors.white),),
                          SizedBox(width: 2.0),
                          Icon(Icons.star, color: Colors.white, size: 12),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Text("8" + "  Reviewes"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
        ],
      ),
    );

    var descriptionTab = Container(
      margin: EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            isExpanded? Text("Romeo and Juliet belongs to a tradition of tragic romances "+
                               "stretching back to antiquity. The plot is based on an" +
                               "Italian tale translated into verse as The Tragical History"+
                               "of Romeus and Juliet by Arthur Brooke in 1562 and retold in "+
                               "prose in Palace of Pleasure by William Painter in 1567. "+
                               "Shakespeare borrowed heavily from both but expanded the "+
                               "plot by developing a number of supporting characters, particularly "+
                               "Mercutio and Paris. Believed to have been written between 1591 "+
                               "and 1595, the play was first published in a quarto version in 1597.") : 
                               Text("Romeo and Juliet belongs to a tradition of tragic romances "+
                               "stretching back to antiquity. The plot is based on an" +
                               "Italian tale translated into verse as The Tragical History"+
                               "of Romeus and Juliet by Arthur Brooke in 1562 and retold in "+
                               "prose in Palace of Pleasure by William Painter in 1567. "+
                               "Shakespeare borrowed heavily from both but expanded the "+
                               "plot by developing a number of supporting characters, particularly "+
                               "Mercutio and Paris. Believed to have been written between 1591 "+
                               "and 1595, the play was first published in a quarto version in 1597.", maxLines: 3),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(2.0),
                color: Colors.transparent,
                child: Text(isExpanded ? "Read Less ..." : "... Read More", style: TextStyle(color:Color(0xFF212121), fontSize: 16.0 ),),
              ),
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Divider(
              height: 1,
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );

    var reviewscontainer = Container(
        child: Column(
      children: [
        ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 0.0, bottom: 0.0),
                      scrollDirection: Axis.vertical,
                      itemCount: reviewList.length,
                      itemBuilder: (BuildContext context, int index) {
                        ReviewModel reviews = reviewList[index];                       
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(height: 10),
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage:
                                                    NetworkImage(
                                                   reviews.img,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 20),
                                          Text(reviews.name, style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,fontFamily: "Jua"),),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 1,
                                            bottom: 1),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    16.0)),
                                            color: int.parse(reviews.rating) < 2
                                                ? Colors.red
                                                : int.parse(reviews.rating)< 4
                                                    ? Colors.orange
                                                    : Colors.green),
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                                reviews.rating
                                                    .toString(),style: TextStyle(color: Colors.white),),
                                            SizedBox(
                                                width: 2.0),
                                            Icon(Icons.star,
                                                color: Colors.white, size: 12)
                                          ],
                                        ),
                                      ),
                                    ]),
                                Padding(
                                  padding: const EdgeInsets.only(left: 70.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          reviews.msg,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
      ],
    ));

    var reviewsTab = SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 60),
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: width * 0.33,
                    width: width * 0.33,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        reviewText("3.0",
                            size: 28.0, fontSize: 30.0, fontFamily: 'Bold'),
                        Text("8"+ " Reviews",style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            reviewText(5.0),
                            ratingProgress(fiveStar, Colors.green)
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(4.0),
                            ratingProgress(fourStar, Colors.green)
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(3.0),
                            ratingProgress(threeStar, Colors.amber)
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(2.0),
                            ratingProgress(twoStar, Colors.amber)
                          ],
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(1.0),
                            ratingProgress(oneStar, Colors.red)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Divider(
              height: 1,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Reviews",style: TextStyle(color:Color(0xFF212121),fontFamily: "Jua",fontSize: 20.0 ),),
                MaterialButton(
                        textColor: Color(0xFF3d87ff),
                        padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 0,
                            bottom: 0),
                        child: Text("Rate Now",style: TextStyle(fontSize: 14.0,color: Color(0xFF3d87ff)),),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              new BorderRadius.circular(24.0),
                          side: BorderSide(color: Color(0xFF3d87ff)),
                        ),
                        onPressed: () {
                        },
                      )
                    
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 3),
            ),
            // reviewscontainer
            reviewcount != 0
                ? reviewscontainer
                : Container(
                    height: 200,
                    child: Center(
                        child: Text(
                      "No reviews yet... :'(",style: TextStyle(fontSize: 30.0),
                    ))),
            // reviews
          ],
        ),
      ),
    );

    var bottombuttons = Container(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFffffff),
              boxShadow: [BoxShadow(color: Color(0X95E9EBF0), blurRadius: 6, spreadRadius: 2)],
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Text("Order the Book?",style: TextStyle(fontSize: 16.0)),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                        onTap: () async {
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Color(0xFF3B8BEA), Color(0xFF3F77DE)]),
                            boxShadow: [BoxShadow(color: Color(0X95E9EBF0), blurRadius: 10, spreadRadius: 2)],
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Add to Cart",
                                    style: TextStyle(
                                        fontFamily: "Jua",
                                        fontSize: 16.0,
                                        color: Color(0xFFffffff))),
                                WidgetSpan(
                                  child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Icon(Icons.add_shopping_cart,
                                          color: Color(0xFFffffff), size: 18)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 440,
                    floating: true,
                    pinned: true,
                    titleSpacing: 0,
                    forceElevated: innerBoxIsScrolled,
                    backgroundColor: Colors.white,
                    iconTheme: IconThemeData(color: Color(0xFF212121)),
                    title: Text("Romio & Juliet",style: TextStyle(color: innerBoxIsScrolled==false ? Colors.transparent : Color(0xFF212121), fontSize: 20.0,fontFamily: "Jua" ),),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: <Widget>[
                          sliderImages,
                          productInfo,
                        ],
                      ),
                      collapseMode: CollapseMode.pin,
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: Color(0xFF3d87ff),
                        indicatorColor: Color(0xFF3d87ff),
                        unselectedLabelColor: Color(0xFF212121),
                        tabs: [
                          Tab(text: "Description"),
                          Tab(text: "Reviews"),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  descriptionTab,
                  reviewsTab,
                ],
              ),
            ),
          ),
          bottombuttons,
        ],
      ),
    );
  }

  Widget reviewText(rating,
      {size = 15.0,
      fontSize = 18.0,
      fontFamily = 'Jua',
      textColor = const Color(0xFF212121)}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(rating.toString(),style: TextStyle(color: textColor,fontFamily: fontFamily,fontSize: fontSize),),
        SizedBox(width: 4.0),
        Icon(Icons.star, color: Colors.amber, size: size)
      ],
    );
  }

  Widget ratingProgress(value, color) {
    return Expanded(
      child: LinearPercentIndicator(
        lineHeight: 10.0,
        percent: value / 100,
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.grey.withOpacity(0.2),
        progressColor: color,
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: Colors.white,
      child: Container(child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class ReviewModel {
  var name = "";
  var msg = "";
  var img = "";
  var rating = "";
}
