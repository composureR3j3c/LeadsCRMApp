import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:leadsmobile/Helpers/APIs.dart';
import 'package:leadsmobile/globals/Globals.dart';
import 'package:leadsmobile/widgets/LeadsTile.dart';

import '../Models/leadsPrediction.dart';

class LeadsList extends StatefulWidget {
  const LeadsList({Key? key}) : super(key: key);

  @override
  State<LeadsList> createState() => _LeadsListState();
}

class _LeadsListState extends State<LeadsList> {
  void initState() {
    // TODO: implement initState
    super.initState();
    fetcLeadsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: AnimatedSize(
          curve: Curves.bounceIn,
          duration: const Duration(milliseconds: 10),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 0.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(0.0),
                ),
                (LeadsListItem.length > 0)
                    ? Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) => LeadsTile(
                            leadsListPredictions: LeadsListItem[index],
                          ),
                          separatorBuilder: (BuildContext context, int Index) =>
                              const Divider(
                            color: Colors.amber,
                          ),
                          itemCount: LeadsListItem.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
              ],
            ),
          ),
        ));
  }

  void fetcLeadsList() async {
    var res = await OnPremMethods.getLeads();
    if (res == 404) {
      return;
    } else
    // if (res["status"] == "OK")
    {
      print(res.toString());
      var predictions = res;
      var placeList = (predictions as List)
          .map((e) => LeadsListPredictions.fromJson(e))
          .toList();
      setState(() {
        LeadsListItem = placeList;
      });
    }
  }
}
