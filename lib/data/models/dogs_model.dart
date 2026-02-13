class DogsModel {
  String message;
  String status;

  DogsModel({required this.message, required this.status});

  factory DogsModel.fromJson(Map<String, dynamic> json) {
    return DogsModel(message: json['message'], status: json['status']);
  }
}
