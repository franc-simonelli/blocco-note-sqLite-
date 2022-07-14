// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Attivita {
  late int? id;
  late String? testo;
  late bool check;

  Attivita({
    this.id = 0,
    this.testo = "",
    this.check = false,
  });

  Attivita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    testo = json['testo'];
    check = json['check'];;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['testo'] = this.testo;
    data['check'] = this.check;
    return data;
  }
}