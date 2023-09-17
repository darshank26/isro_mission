import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart';
import 'package:isro_mission/model/data_api.dart';
import 'package:isro_mission/model/data_api.dart';
import 'package:isro_mission/model/data_api.dart';
import 'package:isro_mission/screens/searchpage.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:async';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../AdHelper/adshelper.dart';
import '../model/data_api.dart';


class ListScreen extends StatefulWidget {
  final int listIndex;

  const ListScreen({Key? key,required this.listIndex}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState(listIndex);

}

class _ListScreenState extends State<ListScreen> {
  late BannerAd _bannerAd;

  bool _isBannerAdReady = false;

  final int listIndex;

  _ListScreenState(this.listIndex);

  // List<SaveItem> wishListItems = [];


  String _url = "https://darshankomu.com/apps/isromission/api/getdata.php";
  String _url_indian_player = "https://darshankomu.com/apps/isromission/api/getIndianPlayer.php";
  String _url_reentry = "https://darshankomu.com/apps/isromission/api/getreentry.php";

  late Stream _stream;
  late http.Response response;
  List<spacecraft_api> spacecraft_list = [];
  List<spacecraft_api> spacecraft_list_indian_player = [];
  List<spacecraft_api> spacecraft_list_reentry = [];

  bool loadingNewData = false;
  bool reverseList = false;


  Future<void> fetchData() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      spacecraft_list = jsonData.map((data) => spacecraft_api.fromJson(data)).toList();
      setState(() {
        loadingNewData = true;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataIndianPlayer() async {
    final response = await http.get(Uri.parse(_url_indian_player));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      spacecraft_list_indian_player = jsonData.map((data) => spacecraft_api.fromJson(data)).toList();
      setState(() {
        loadingNewData = true;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> fetchDataReentry() async {
    final response = await http.get(Uri.parse(_url_reentry));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      spacecraft_list_reentry = jsonData.map((data) => spacecraft_api.fromJson(data)).toList();
      setState(() {
        loadingNewData = true;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }



  @override
  void initState() {
    fetchData();
    fetchDataIndianPlayer();
    fetchDataReentry();

    // TODO: implement initState
    super.initState();
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitIdOfHomeScreen,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();

  }


  @override
  void dispose() {
    super.dispose();
    _bannerAd.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(widget.listIndex ==1 )
      {
        return Scaffold(

          appBar: AppBar(title: Text('Spacecraft Missions',
              style: GoogleFonts.nunito(textStyle: TextStyle(
                color:Colors.white,
                letterSpacing: 0.5,
                fontSize: 22,
                fontWeight: FontWeight.bold,)

              )),
          backgroundColor: Colors.blueAccent.shade400,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            actions: [
              IconButton(
                icon: new Icon(Icons.sort, color: Colors.white),
                onPressed: ()   {
                  if(reverseList == false)
                    {

                      setState(() {
                        reverseList = true;
                      });
                    }
                  else
                      {
                        setState(() {
                          reverseList = false;
                        });                      }
                },
              ),
            ],
          ),



          body:  (loadingNewData) ?    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: ListView.builder(
                reverse: reverseList,
                shrinkWrap: true,
                itemCount: spacecraft_list.length,
                itemBuilder: (BuildContext context, int index) {
                  final space = spacecraft_list[index];

                  return GestureDetector(
                    onTap: () {
                      _open(space.link);
                    },
                    child: Card(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 0.5, // Set border width
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(
                                  5.0) //                 <--- border radius here
                          ),
                        ),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(space.name,
                                style: GoogleFonts.nunito(textStyle: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800,))
                            ),
                          ), // Display item name
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                                child: Text(
                                    space.launchDate.length != "" ? "Launch Date:  ${space.launchDate}"	 : "-" ,
                                    style: GoogleFonts.openSans(textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0, bottom: 0),
                                child: Text(
                                    space.launchVehicle.length != "" ? "Launch vehicle:  ${space.launchVehicle}"	 : "-" ,
                                    style: GoogleFonts.openSans(textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0, bottom: 0),
                                child: Text(
                                    "Orbit Type :  ${space.orbitType}" ,
                                    style: GoogleFonts.openSans(textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,))
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:8.0, bottom: 0),
                                child: Text(
                                    "Application :  ${space.application}	" ,
                                    style: GoogleFonts.openSans(textStyle: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,))
                                ),
                              ),




                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ) : Center(child: CircularProgressIndicator(color: Colors.blueAccent.shade400,)),


        );

      }
    else
    if(widget.listIndex ==4 )
    {
      return Scaffold(

        appBar: AppBar(title: Text('Re-entry Missions',
            style: GoogleFonts.nunito(textStyle: TextStyle(
              color:Colors.white,
              letterSpacing: 0.5,
              fontSize: 22,
              fontWeight: FontWeight.bold,)

            )),
          backgroundColor: Colors.blueAccent.shade400,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: new Icon(Icons.sort, color: Colors.white),
              onPressed: ()   {
                if(reverseList == false)
                {

                  setState(() {
                    reverseList = true;
                  });
                }
                else
                {
                  setState(() {
                    reverseList = false;
                  });                      }
              },
            ),
          ],
        ),



        body:  (loadingNewData) ?    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              reverse: reverseList,
              shrinkWrap: true,
              itemCount: spacecraft_list_reentry.length,
              itemBuilder: (BuildContext context, int index) {
                final space = spacecraft_list_reentry[index];

                return GestureDetector(
                  onTap: () {
                    _open(space.link);
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.5, // Set border width
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(
                                5.0) //                 <--- border radius here
                        ),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(space.name,
                              style: GoogleFonts.nunito(textStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,))
                          ),
                        ), // Display item name
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                              child: Text(
                                  space.launchDate.length != "" ? "Launch Date:  ${space.launchDate}"	 : "-" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  space.launchVehicle.length != "" ? "Launch vehicle:  ${space.launchVehicle}"	 : "-" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  "Orbit Type :  ${space.orbitType}" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  "Application :  ${space.application}	" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),




                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ) : Center(child: CircularProgressIndicator(color: Colors.blueAccent.shade400,)),


      );

    }
    else
    if(widget.listIndex ==6 )
    {
      return Scaffold(

        appBar: AppBar(title: Text('Indian Private player Satellites',
            style: GoogleFonts.nunito(textStyle: TextStyle(
              color:Colors.white,
              letterSpacing: 0.5,
              fontSize: 22,
              fontWeight: FontWeight.bold,)

            )),
          backgroundColor: Colors.blueAccent.shade400,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: [
            IconButton(
              icon: new Icon(Icons.sort, color: Colors.white),
              onPressed: ()   {
                if(reverseList == false)
                {

                  setState(() {
                    reverseList = true;
                  });
                }
                else
                {
                  setState(() {
                    reverseList = false;
                  });                      }
              },
            ),
          ],
        ),



        body:  (loadingNewData) ?    Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              reverse: reverseList,
              shrinkWrap: true,
              itemCount: spacecraft_list_indian_player.length,
              itemBuilder: (BuildContext context, int index) {
                final space = spacecraft_list_indian_player[index];

                return GestureDetector(
                  onTap: () {
                    _open(space.link);
                  },
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 0.5, // Set border width
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(
                                5.0) //                 <--- border radius here
                        ),
                      ),
                      child: ListTile(
                        title: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(space.name,
                              style: GoogleFonts.nunito(textStyle: TextStyle(
                                fontSize: 22,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800,))
                          ),
                        ), // Display item name
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, bottom: 0),
                              child: Text(
                                  space.launchDate.length != "" ? "Launch Date:  ${space.launchDate}"	 : "-" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  space.launchVehicle.length != "" ? "Launch vehicle:  ${space.launchVehicle}"	 : "-" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  "Orbit Type :  ${space.orbitType}" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0, bottom: 0),
                              child: Text(
                                  "Application :  ${space.application}	" ,
                                  style: GoogleFonts.openSans(textStyle: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,))
                              ),
                            ),




                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ) : Center(child: CircularProgressIndicator(color: Colors.blueAccent.shade400,)),


      );

    }
    else
    {
      return Container();
    }


  }
  Future<void> _open(String text) async {
    final Uri url = Uri.parse(text);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch');
    }
  }

}



