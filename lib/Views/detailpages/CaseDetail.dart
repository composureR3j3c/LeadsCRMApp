import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadsmobile/Helpers/APIs.dart';
import 'package:leadsmobile/Helpers/launchMaps.dart';
import 'package:leadsmobile/Models/CasePrediction.dart';
import 'package:leadsmobile/Models/leadsPrediction.dart';
import 'package:leadsmobile/widgets/webview.dart';

import 'package:leadsmobile/globals/Globals.dart';
import 'package:flutter_open_street_map/flutter_open_street_map.dart';

class CaseDetail extends StatefulWidget {
  CaseListPredictions caseListPredictions;
  CaseDetail({Key? key, required this.caseListPredictions}) : super(key: key);

  @override
  _LeadsCaselState createState() => _LeadsCaselState();
}

class _LeadsCaselState extends State<CaseDetail> {
  String lat = '';
  String lon = '';
  var mapLoc = LatLong(9.0127706, 38.7534998);
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDetailList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: (widget.caseListPredictions.date_entered == "" ||
              widget.caseListPredictions.date_entered == null)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              color: Colors.amber,
              triggerMode: RefreshIndicatorTriggerMode.anywhere,
              onRefresh: _refresh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                            widget.caseListPredictions.name ??
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
                                          widget.caseListPredictions
                                                  .organisation_c ??
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
                                  Row(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.phone,
                                          size: 25.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          widget.caseListPredictions
                                                  .phone_mobile ??
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
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Date Entered:  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                          ),
                                          Text(
                                            (widget.caseListPredictions
                                                        .date_modified ??
                                                    "          ")
                                                .substring(0, 10),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                          ),
                                        ],
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
                                      Row(
                                        children: [
                                          Text(
                                            "Date Modified:  ",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                            )),
                                          ),
                                          Text(
                                            (widget.caseListPredictions
                                                        .date_modified ??
                                                    "          ")
                                                .substring(0, 10),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            )),
                                          ),
                                        ],
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
                                          widget.caseListPredictions
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
                                          widget.caseListPredictions
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
                                          widget.caseListPredictions
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Subject: ${widget.caseListPredictions.subject ?? ""}",
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
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Description: \n${widget.caseListPredictions.description ?? ""}",
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            widget.caseListPredictions.status !=
                                                    null
                                                ? "Status: "
                                                : "",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Text(
                                            widget.caseListPredictions.status
                                                    ?.toUpperCase() ??
                                                "",
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            style: GoogleFonts.roboto(
                                                textStyle: const TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          // const SizedBox(
                          //   width: 10.0,
                          // ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => launchMap(lat, lon),
                        child: const Text("View on google Maps")),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 400,
                      width: MediaQuery.of(context).size.width - 50,
                      child:
                          //  WebViewScreen(
                          //   url: "https://web.telegram.org/z/",
                          // )
                          lat == ''
                              ? Container()
                              : FlutterOpenStreetMap(
                                  center: mapLoc,
                                  showZoomButtons: true,
                                  onPicked: (pickedData) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Please go to google maps for more features");
                                  },
                                ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  void fetchDetailList() async {
    await _refresh();
  }

  Future<void> _refresh() async {
    print("fetch called");
    print(widget.caseListPredictions.id);
    if (widget.caseListPredictions.id == null) return;
    var res =
        await OnPremMethods.getFollowUpdetail(widget.caseListPredictions.id!);
    if (res == 404) {
      return;
    } else
    // if (res["status"] == "OK")
    {
      // widget.caseListPredictions.date_entered = res['date_entered'];
      // print(res.toString());
      // var predictions = res;
      // var placeList = (predictions as List)
      //     .map((e) => caseListPredictions.fromJson(e))
      //     .toList();
      print("primary_address_str${res["primary_address_stree"]}");
      setState(() {
        widget.caseListPredictions.date_entered = res['date_entered'];
        widget.caseListPredictions.date_modified = res['date_modified'];
        widget.caseListPredictions.primary_address_city = res['city_c'];
        widget.caseListPredictions.primary_address_street = res['address1_c'];
        widget.caseListPredictions.primary_address_country = res['country1_c'];
        widget.caseListPredictions.status = res['status'];
        widget.caseListPredictions.phone_mobile = res['phone1_c'];
        widget.caseListPredictions.subject = res['name'];
        widget.caseListPredictions.description = res['description'];
        try {
          lon = lat = res['address1_c'].toString();
          lat = lat.substring(lat.indexOf(":") + 2, lat.indexOf("\n")).trim();
          lon = lon.substring(lon.indexOf("\n") + 1);
          lon = lon.substring(lon.indexOf(":") + 1, lon.indexOf("\n")).trim();

          mapLoc = LatLong(double.tryParse(lat) ?? 9.0127706,
              double.tryParse(lon) ?? 38.7534998);
          print("lat$lat$lon");
        } catch (ex) {}
      });
    }
  }
}
