import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:leadsmobile/LeadsDetail.dart';
import 'package:leadsmobile/Models/leadsPrediction.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LeadsTile extends StatefulWidget {
  final LeadsListPredictions leadsListPredictions;
  LeadsTile({required this.leadsListPredictions});

  @override
  State<LeadsTile> createState() => _PredictionTileState();
}

class _PredictionTileState extends State<LeadsTile> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (widget.leadsListPredictions.name != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (c) => LeadsDetail(
                      leadsListPredictions: widget.leadsListPredictions)));
        }
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.9,
                offset: Offset(1, 1),
              )
            ]),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              width: 14.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 15.0,
                ),
                const Icon(
                  Icons.groups_2,
                  color: Colors.amber,
                  size: 25,
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name: ",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          )),
                        ),
                        Text(
                          widget.leadsListPredictions.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                            color: Colors.red.shade900,
                            fontSize: 14,
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Organisation: ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            )),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            widget.leadsListPredictions.organisation_c ??
                                "Unknown",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.green.shade800,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}
