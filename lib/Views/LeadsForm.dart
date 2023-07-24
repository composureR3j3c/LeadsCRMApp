import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:leadsmobile/Helpers/APIs.dart';
import 'package:leadsmobile/widgets/ProgressDialog.dart';

class LeadsForm extends StatefulWidget {
  const LeadsForm({super.key});

  @override
  State<LeadsForm> createState() => _LeadsFormState();
}

class _LeadsFormState extends State<LeadsForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  late LocationPermission permission;
  String firstName = "";
  FocusNode focusNode = FocusNode();
  String lastName = "";
  String finalPhone = "";
  String organisation = "";
  String email = "";
  String street = "";
  String city = "Addis Ababa";
  String country = "Ethiopia";
  String lat = "";
  String lon = "";

  Future submitLead() async {
    var res = await OnPremMethods.createLeads(firstName, lastName, organisation,
        finalPhone, email, street, city, country);

    return res;
    // await OnPremMethods.authenticate();
  }

  Future locatePosition() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
      } else if (permission == LocationPermission.deniedForever) {}
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (!mounted) {
        return;
      }
      setState(() {
        lat = position.latitude.toString();
        lon = position.longitude.toString();
      });
      print(lat + lon);

      try {
        var locationName = await OnPremMethods.getLocationName(
            position.longitude, position.latitude);
      } catch (e) {}
    }
    print("locatePosition" + DateTime.now().toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locatePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Contact First Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    onFieldSubmitted: (value) {
                      setState(() {
                        firstName = value.capitalize();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        firstName = value.capitalize();
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'First Name must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'First Name cannot contain special characters';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Contact Last Name',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'Last Name must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'Last Name cannot contain special characters';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        lastName = value.capitalize();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        lastName = value.capitalize();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Organisation',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'organisation must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'organisation cannot contain special characters';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        organisation = value.capitalize();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        organisation = value.capitalize();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  IntlPhoneField(
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    languageCode: "en",
                    initialCountryCode: "ET",
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      finalPhone = phone.completeNumber.toString();
                    },
                    onCountryChanged: (country) {
                      print('Country changed to: ' + country.code);
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // DropdownButtonFormField(
                  //     decoration: const InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //           borderRadius:
                  //               BorderRadius.all(Radius.circular(20.0)),
                  //           borderSide:
                  //               BorderSide(color: Colors.grey, width: 0.0),
                  //         ),
                  //         border: OutlineInputBorder()),
                  //     items: [
                  //       const DropdownMenuItem(
                  //         child: Text("ºC"),
                  //         value: 1,
                  //       ),
                  //       const DropdownMenuItem(
                  //         child: Text("ºF"),
                  //         value: 2,
                  //       )
                  //     ],
                  //     hint: const Text("Select item"),
                  //     onChanged: (value) {
                  //       setState(() {
                  //         // measure = value;
                  //         // measureList.add(measure);
                  //       });
                  //     },
                  //     onSaved: (value) {
                  //       setState(() {
                  //         // measure = value;
                  //       });
                  //     }),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Text(
                          //   "Your Location",
                          //   style: TextStyle(color: Colors.black54),
                          // ),
                          // const SizedBox(
                          //   width: 20.0,
                          // ),
                          Text(
                            "Lat: $lat",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Text(
                            "Long: $lon",
                            style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                              // onPressed: (),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.red,
                              ),
                            ),
                            labelText: 'Location',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 0.0),
                            ),
                            border: OutlineInputBorder()),
                        onFieldSubmitted: (value) {
                          setState(() {
                            street = value.capitalize();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            street = value.capitalize();
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'City',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    initialValue: city,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'city must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        return 'city cannot contain special characters';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        city = value.capitalize();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        city = value.capitalize();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Country',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide:
                              BorderSide(color: Colors.grey, width: 0.0),
                        ),
                        border: OutlineInputBorder()),
                    initialValue: country,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        // return 'Last Name must contain at least 3 characters';
                      } else if (value.contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                        // return 'Last Name cannot contain special characters';
                      }
                    },
                    onFieldSubmitted: (value) {
                      setState(() {
                        // lastName = value.capitalize();
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        // lastName = value.capitalize();
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(60)),
                    onPressed: () async {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext c) {
                              return ProgressDialog(
                                message: "Processing, Please wait...",
                              );
                            });
                        var res = await submitLead();
                        Navigator.pop(context);
                        if (res == 200) {
                          Fluttertoast.showToast(
                              msg: "Lead created successfully!",
                              backgroundColor: Colors.green);
                        } else {
                          Fluttertoast.showToast(
                              msg: "Lead not created try again later!",
                              backgroundColor: Colors.green);
                        }
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please check your input",
                            backgroundColor: Colors.red);
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

extension StringExtension on String {
  // Method used for capitalizing the input from the form
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
