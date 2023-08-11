import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:leadsmobile/Helpers/APIs.dart';
import 'package:leadsmobile/globals/Globals.dart';
import 'package:leadsmobile/widgets/CasesTile.dart';

import '../Models/CasePrediction.dart';

class CaseList extends StatefulWidget {
  const CaseList({
    Key? key,
  }) : super(key: key);

  @override
  State<CaseList> createState() => _CaseListState();
}

class _CaseListState extends State<CaseList> {
  TextEditingController controller = new TextEditingController();

  void initState() {
    // TODO: implement initState
    super.initState();
    fetcCaseList();
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
                (CaseListItem.length > 0)
                    ? Expanded(
                        child: RefreshIndicator(
                          color: Colors.amber,
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          onRefresh: _refresh,
                          child: ListView.separated(
                            itemBuilder: (context, index) => CaseTile(
                              caseListPredictions: CaseListItem[index],
                            ),
                            separatorBuilder:
                                (BuildContext context, int Index) =>
                                    const Divider(
                              color: Colors.amber,
                            ),
                            itemCount: CaseListItem.length,
                            shrinkWrap: true,
                            // physics: const ClampingScrollPhysics(),
                          ),
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

  fetcCaseList() async {
    await _refresh();
  }

  Future<void> _refresh() async {
    print("object");
    var res = await OnPremMethods.getFollowups();
    if (res == 404) {
      return;
    } else
    // if (res["status"] == "OK")
    {
      print(res.toString());
      var predictions = res;
      var placeList = (predictions as List)
          .map((e) => CaseListPredictions.fromJson(e))
          .toList();
      setState(() {
        CaseListItem = placeList;
        origionallist_c = placeList;
        // print(origionallist_c.toString());
      });
    }
  }

  onSearchTextChanged(String text) async {
    // CaseListItem.clear();
    var searchResult = [];
    if (text.isEmpty || text == '') {
      setState(() {
        CaseListItem = origionallist_c;
        // print(origionallist_c);
      });
      return;
    } else {
      // CaseListItem.clear();
      origionallist_c.forEach((item) {
        if (item.name.toString().toLowerCase().contains(text) ||
            item.organisation_c.toString().toLowerCase().contains(text) ||
            item.phone_mobile.toString().toLowerCase().contains(text)) {
          searchResult.add(item);
          // print(origionallist_c);
        }
      });
      if (searchResult != null) {
        CaseListItem = searchResult;
      }
      setState(() {});
    }
  }
}
