import 'package:flutter/material.dart';
import './eventlist.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Create extends StatelessWidget {
  final databaseReference = Firestore.instance;
  String title;
  String descryption;
  String image;
  String time;
  String work;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event creation"),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: <Widget>[
          TextField(
            onChanged: (value) {
              title = value;
            },
            decoration: InputDecoration(
              hintText: "Event Title",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (about) {
              descryption = about;
            },
            decoration: InputDecoration(
              hintText: "descryption",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (link) {
              image = link;
            },
            decoration: InputDecoration(
              hintText: "image link",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (date) {
              time = date;
            },
            decoration: InputDecoration(
              hintText: "date",
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (place) {
              work = place;
            },
            decoration: InputDecoration(
              hintText: "place",
            ),
          ),
          SizedBox(height: 20),
          Builder(
            builder: (context) {
              return RaisedButton(
                  color: Colors.blue,
                  child: Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if(title.isNotEmpty&&image.isNotEmpty&&descryption.isNotEmpty&&work.isNotEmpty&&time.isNotEmpty){
                   await Firestore.instance.collection("events").add({
                      "title": title,
                      "imglink": image,
                      "description": descryption,
                      'place': work,
                      'date': time
                    });
                     Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Event()));
                    }
                    else{
                      Scaffold.of(context).showSnackBar(SnackBar(content: Text("All field Required"),));
                    }
                  });
            }
          )
        ],
      ),
    );
  }
}
