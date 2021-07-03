class People {
  int id;
  String name;
  int sex;
  String birth;
  String cns;
  String cpf;
  String imgUrl;

  People({
    // this.id,
    this.name,
    this.sex,
    this.birth,
    this.cns,
    this.cpf,
    this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['idpeople'] = id;
    }
    map['name'] = name;
    map['sex'] = sex;
    map['birth'] = birth;
    map['cns'] = cns;
    map['cpf'] = cpf;
    map['img_url'] = imgUrl;

    return map;
  }

  People.fromMap(Map<String, dynamic> map) {
    id = map['idpeople'];
    name = map['name'];
    sex = map['sex'];
    birth = map['birth'];
    cns = map['cns'];
    cpf = map['cpf'];
    imgUrl = map['imgUrl'];
  }
}
