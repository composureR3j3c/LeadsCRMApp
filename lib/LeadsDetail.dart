import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadsmobile/Helpers/APIs.dart';
import 'package:leadsmobile/Models/leadsPrediction.dart';
import 'package:leadsmobile/widgets/webview.dart';

import 'package:leadsmobile/globals/Globals.dart';
import 'package:flutter_open_street_map/flutter_open_street_map.dart';

class LeadsDetail extends StatefulWidget {
  LeadsListPredictions leadsListPredictions;
  LeadsDetail({Key? key, required this.leadsListPredictions}) : super(key: key);

  @override
  _LeadsDetailState createState() => _LeadsDetailState();
}

class _LeadsDetailState extends State<LeadsDetail> {
  String lat = '9.0127706';
  String lon = '38.7534998';
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetailList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const SizedBox(
                    width: 20.0,
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          const SizedBox(
                            width: 8.0,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 25.0,
                                    color: Colors.amber,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    widget.leadsListPredictions.name ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.corporate_fare,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.leadsListPredictions.organisation_c ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.schedule,
                                  size: 25.0,
                                  color: Colors.green,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.leadsListPredictions.date_entered ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.schedule,
                                  size: 25.0,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                widget.leadsListPredictions.date_modified ?? "",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                )),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.place,
                                  size: 25.0,
                                  color: Colors.amber,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.leadsListPredictions
                                          .primary_address_street ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_city,
                                  size: 25.0,
                                  color: Colors.black,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.leadsListPredictions
                                          .primary_address_city ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.landscape,
                                  size: 25.0,
                                  color: Colors.green.shade800,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  widget.leadsListPredictions
                                          .primary_address_country ??
                                      "",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                  )),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Divider(),
                          Center(
                            child: Container(
                              color: Colors.white10,
                              padding: const EdgeInsets.all(30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.leadsListPredictions.status != null
                                        ? "Status: "
                                        : "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            color: Colors.black45,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    widget.leadsListPredictions.status
                                            ?.toUpperCase() ??
                                        "",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 400,
                            width: MediaQuery.of(context).size.width,
                            child:
                                //  WebViewScreen(
                                //   url: "https://web.telegram.org/z/",
                                // )
                                FlutterOpenStreetMap(
                              center: LatLong(double.tryParse(lat) ?? 9.0127706,
                                  double.tryParse(lon) ?? 38.7534998),
                              onPicked: (pickedData) {},
                            ),
                          )
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    width: 14.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fetchDetailList() async {
    print("fetch called");
    print(widget.leadsListPredictions.id);
    if (widget.leadsListPredictions.id == null) return;
    var res = await OnPremMethods.getLeadetail(widget.leadsListPredictions.id!);
    if (res == 404) {
      return;
    } else
    // if (res["status"] == "OK")
    {
      // widget.leadsListPredictions.date_entered = res['date_entered'];
      // print(res.toString());
      // var predictions = res;
      // var placeList = (predictions as List)
      //     .map((e) => LeadsListPredictions.fromJson(e))
      //     .toList();
      print("primary_address_str" + res["primary_address_stree"].toString());
      setState(() {
        widget.leadsListPredictions.date_entered = res['date_entered'];
        widget.leadsListPredictions.date_modified = res['date_modified'];
        widget.leadsListPredictions.primary_address_city =
            res['primary_address_city'];
        widget.leadsListPredictions.primary_address_street =
            res['primary_address_street'];
        widget.leadsListPredictions.primary_address_country =
            res['primary_address_country'];
        widget.leadsListPredictions.status = res['status'];
        try {
          lon = lat = res['primary_address_street'].toString();
          lat = lat.substring(lat.indexOf(":") + 2, lat.indexOf("\n"));
          lon = lon.substring(lon.indexOf("\n") + 1);
          lon = lon.substring(lon.indexOf(":") + 1, lon.indexOf("\n"));
          print("lat" + lat + lon);
        } catch (ex) {}
      });
    }
  }
}
