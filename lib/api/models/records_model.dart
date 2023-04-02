class RecordsModel {
  final String date;
  final String type;
  final String value;
  final String recordLink;
  final String? id;

  RecordsModel(
      {required this.date,
      required this.type,
      required this.value,
      required this.recordLink,
      this.id});

  factory RecordsModel.fromJson(Map<String, dynamic> json) {
    return RecordsModel(
        date: json['date'],
        type: json['type'],
        value: json['value'],
        recordLink: json['record_link'],
        id: json['id']);
  }
}
