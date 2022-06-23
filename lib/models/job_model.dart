import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JobModel {
  final String id;
  final String idOffice;
  final String job;
  final String detail;
  final String lat;
  final String lng;
  final String pathImages;
  final String status;
  JobModel({
    required this.id,
    required this.idOffice,
    required this.job,
    required this.detail,
    required this.lat,
    required this.lng,
    required this.pathImages,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idOffice': idOffice,
      'job': job,
      'detail': detail,
      'lat': lat,
      'lng': lng,
      'pathImages': pathImages,
      'status': status,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      id: map['id'] as String,
      idOffice: map['idOffice'] as String,
      job: map['job'] as String,
      detail: map['detail'] as String,
      lat: map['lat'] as String,
      lng: map['lng'] as String,
      pathImages: map['pathImages'] as String,
      status: map['status'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) => JobModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
