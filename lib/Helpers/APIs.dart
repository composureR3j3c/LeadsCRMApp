import 'dart:convert';
import 'dart:html';

import '../globals/Globals.dart';
import 'package:http/http.dart' as http;

class OnPremMethods {
  static Future<dynamic> authenticate() async {
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'sugar_user_theme=SuiteP'
    };
    var request = http.Request('POST',
        Uri.parse('https://crm.bankofabyssinia.com/suitecrm/Api/access_token'));
    request.body = json.encode({
      "grant_type": "password",
      "client_id": "6b07b279-71d6-b040-9a8b-62308b3c8249",
      "client_secret": "Abyssinia@dc2##",
      "username": "admin",
      "password": "Welcome2boa@"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // (await response.stream.bytesToString());
      var res = await http.Response.fromStream(response);
      var token = jsonDecode(res.body) as Map<String, dynamic>;
      return token;
    } else {
      print(response.reasonPhrase);
    }
  }
  // static Future<dynamic>  getplaceName(){

  // }
  static Future<dynamic> getLocationName(
      double longitude, double latitude) async {
    String apiUrl =
        // "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$mapKey";

        "https://api.geoapify.com/v1/geocode/reverse?lat=$latitude&lon=$longitude&apiKey=$geopify";
    String? name = "";
    try {
      http.Response httpResponse = await http.get(Uri.parse(apiUrl));
      var resBody = jsonDecode(httpResponse.body);
      // print("requestResponse" + requestResponse.toString());
      // print("requestResponse"+requestResponse);
      if (httpResponse.statusCode == 200) {
        var humanReadableAddress = resBody["results"][0]["formatted_address"];

        // name = requestResponse["plus_code"]["compound_code"] ?? "";
        return humanReadableAddress;
      } else {
        return 404;
      }
    } catch (e) {
      return 404;
    }

    return name;
  }

  static Future<dynamic> createLeads(
    String first_name,
    String last_name,
    String organisation_c,
    String phone_mobile,
    String email1,
    String primary_address_street,
    String primary_address_city,
    String primary_address_country,
  ) async {
    var res = await OnPremMethods.authenticate();
    var key = res["access_token"].toString();
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $key',
      'Cookie': 'sugar_user_theme=SuiteP'
    };
    var request = http.Request('POST',
        Uri.parse('https://crm.bankofabyssinia.com/suitecrm/Api/V8/module'));
    request.body = json.encode({
      "data": {
        "type": "Leads",
        "attributes": {
          "first_name": first_name,
          "last_name": last_name,
          "organisation_c": organisation_c,
          "phone_mobile": phone_mobile,
          "email1": email1,
          "primary_address_street": primary_address_street,
          "primary_address_city": primary_address_city,
          "primary_address_country": primary_address_country,
        }
      }
    });
    request.headers.addAll(header);
    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 201) {
        // print(await response.stream.bytesToString());
        return 200;
      } else {
        print(response.reasonPhrase);
        return 404;
      }
    } catch (e) {
      return 404;
    }
  }
}
