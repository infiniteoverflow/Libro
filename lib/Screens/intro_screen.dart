import 'package:flutter/material.dart';

class Introduction extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return IntroductionState();
  }
}

class IntroductionState extends State<Introduction>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height:MediaQuery.of(context).size.height * 0.075),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0,left: 00),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.27,
                          width: MediaQuery.of(context).size.width* 0.5,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/Reading 1.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.05,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                            Align(
                              alignment: Alignment(-0.30,-1.50),
                              child: Text("Libro",
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45, fontFamily: 'IrishGrover' ),),
                            ),
                            SizedBox(height: 15,),
                            Text("Get your favourite\n      books from\n  people like you!!",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'IrishGrover'),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.41,
                        width: MediaQuery.of(context).size.width* 0.59,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Sharing 1.png"),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height * 0.041),
                  Container(
                    child: RaisedButton(
                      onPressed: (){
                        debugPrint('Continue!!');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius:BorderRadius.only(topLeft: Radius.circular(35.0),
                            topRight: Radius.circular(35.0) )
                      ),
                      color: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 113.8),
                      child: Text('CONTINUE',style: TextStyle(
                        fontFamily: 'HanaleiFill',
                        fontSize: 40.0,
                        color: Colors.white
                      ),),
                    ),
                  )

                ],
              ),
            ),
          ),
    );
  }
}