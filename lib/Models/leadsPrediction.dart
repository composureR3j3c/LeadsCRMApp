class LeadsListPredictions {
  String? primary_address_street;
  String? primary_address_city;
  String? primary_address_country;
  String? status;
  String? name;
  String? id;
  String? organisation_c;
  String? date_entered;
  String? date_modified;

  LeadsListPredictions({this.name, this.organisation_c, this.id});

  LeadsListPredictions.fromJson(Map<String, dynamic> json) {
    name = json['first_name'] + " " + json['last_name'];
    id = json['id'];
    organisation_c = json['organisation_c'];
    primary_address_street = json['primary_address_street'];
    primary_address_city = json['primary_address_city'];
    primary_address_country = json['primary_address_country'];
    date_entered = json['date_entered'];
    date_modified = json['date_modified'];
  }
}
