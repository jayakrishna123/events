import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventDetail extends StatelessWidget {
  EventDetail({this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(),
          body: Stack(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Hero(
                            tag: 'propic$index',
                            child: Container(
                              height: MediaQuery.of(context).size.height * .35,
                              decoration: BoxDecoration(
                                  // boxShadow: <BoxShadow>[
                                  //   BoxShadow(
                                  //     color: Colors.black45,
                                  //     offset: Offset(0.5, 1),
                                  //     blurRadius: 10,
                                  //     spreadRadius: 1
                                  //   )
                                  // ]
                                  ),
                              width: MediaQuery.of(context).size.width,
                              child: CachedNetworkImage(
                                imageUrl:
                                    'https://hire4event.com/blogs/wp-content/uploads/2019/03/best-Event-company-in-Greater-Noida--768x448.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * .04,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * .39,
                        width: width,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: height * .08,
                            width: height * .08,
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                shape: BoxShape.circle),
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Hero(
                          tag: 'title$index',
                          child: Material(
                            color: Colors.transparent,
                            child: Text('Flutter Workshop',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .copyWith(fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Text(
                          'posted on: 12-06-2019',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Text(
                          "About",
                          style: Theme.of(context).textTheme.title,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '''We, at Aviabird are extensive users of Flutter. We have three Hello World App? We got you. Just follow the Installation instructions and join us on 27th April!''',
                          style: Theme.of(context)
                              .textTheme
                              .display1
                              .copyWith(fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Location',style:Theme.of(context).textTheme.title),
                        Container(
                          height: height*.25,
                          width: width,
                          margin: EdgeInsets.only(bottom: AppBar().preferredSize.height+20),
                          color: Colors.deepPurple,
                          child: EventLocation(latitude: 12.9078,longitude: 80.1420,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: AppBar().preferredSize.height,
                        width: width*.5,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30)
                        ),
                        alignment: Alignment.center,
                        child: Text("Register",style:Theme.of(context).textTheme.button.copyWith(color: Colors.white,fontSize: 17)),
                      ),
                    ),
            ],
          )),
    );
  }
}

class EventLocation extends StatefulWidget {
  EventLocation({@required this.latitude,@required this.longitude});
 final double latitude,longitude;
  @override
  _EventLocationState createState() => _EventLocationState();
}

class _EventLocationState extends State<EventLocation> {
  Completer<GoogleMapController> _mapcontroller=Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (GoogleMapController _controller){
        _mapcontroller.complete(_controller);
      },
      initialCameraPosition: CameraPosition(target: LatLng(widget.latitude, widget.longitude),zoom: 17),
      markers: {Marker(
        markerId: MarkerId("venue"),
        position: LatLng(widget.latitude, widget.longitude),
        
      )},
      onTap: (latlng)async{
            String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${widget.latitude},${widget.longitude}';
       if(await canLaunch(googleUrl)){
         await launch(googleUrl);
       }
      },
    );
  }
}