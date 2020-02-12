import 'package:calender/eventcreation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dummy.dart';
import 'eventdetail.dart';

class Event extends StatelessWidget {
  Future<QuerySnapshot> getData() async {
    var data = await Firestore.instance.collection("events").getDocuments();
    print(data.documents[0]["date"]);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event List App"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Create()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: getData(), // async work
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new Text('Loading....');
            default:
              if (snapshot.hasError)
                return new Text('Error: ${snapshot.error}');
              else
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Detail()));
                      },
                      child: Card(
                          child: Container(
                        height: 80,
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset("images/jayakrishna.jpg"),
                            ),
                            SizedBox(width: 30),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(snapshot.data.documents[index]["title"]),
                                  Text(snapshot.data.documents[index]["date"]),
                                  Text(snapshot.data.documents[index]["place"]),
                                ])
                          ],
                        ),
                      )),
                    );
                  },
               );
          }
        },
      ),
    );
  }
}
