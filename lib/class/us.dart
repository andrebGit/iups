class Us {
  int idus;
  int type;
  String name;
  String location;
  String phone;
  String officeHours;
  String geolocation;

  Us({
    this.idus,
    this.type,
    this.name,
    this.location,
    this.phone,
    this.officeHours,
    this.geolocation,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'idus': idus,
      'type': type,
      'name': name,
      'location': location,
      'phone': phone,
      'officeHours': officeHours,
      'geolocation': geolocation
    };
    return map;
  }

  Us.fromMap(Map<String, dynamic> map) {
    idus = map['idus'];
    type = map['type'];
    name = map['name'];
    location = map['location'];
    phone = map['phone'];
    officeHours = map['office_hours'];
    geolocation = map['geolocation'];
  }
}
