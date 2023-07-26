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
  TextEditingController controller = new TextEditingController();

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
                Container(
                  color: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.search),
                        title: TextField(
                          controller: controller,
                          decoration: const InputDecoration(
                              hintText: 'Search', border: InputBorder.none),
                          onChanged: (text) {
                            onSearchTextChanged(text);
                          },
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            controller.clear();
                            onSearchTextChanged('');
                          },
                        ),
                      ),
                    ),
                  ),
                ),
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
        origionallist = placeList;
        // print(origionallist.toString());
      });
    }
  }

  onSearchTextChanged(String text) async {
    // LeadsListItem.clear();
    var searchResult = [];
    if (text.isEmpty || text == '') {
      setState(() {
        LeadsListItem = origionallist;
        // print(origionallist);
      });
      return;
    } else {
      // LeadsListItem.clear();
      origionallist.forEach((item) {
        if (item.name.toString().toLowerCase().contains(text)
            // || userDetail.lastName.contains(text)
            ) {
          searchResult.add(item);
          // print(origionallist);
        }
      });
      if (searchResult != null) {
        LeadsListItem = searchResult;
      }
      setState(() {});
    }
  }
}
