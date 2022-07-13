// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class Note {
  late int? id;
  late String? titolo;
  late String? testo;

  Note({
    this.id,
    this.titolo = "",
    this.testo = "",
  });

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titolo = json['titolo'];
    testo = json['testo'];;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titolo'] = this.titolo;
    data['testo'] = this.testo;
    return data;
  }
}