class PatientDataModel {
  final String patientName;
  final String recordLink;
  final String age;
  final String dob;
  final String status;
  final String address;
  final String city;
  final String postalCode;
  final String allergies;
  final String emergencyContactName;
  final String emergencyContactNumber;
  final String medicalCondition;
  final String id;

  PatientDataModel({
    required this.patientName,
    required this.recordLink,
    required this.age,
    required this.dob,
    required this.status,
    required this.address,
    required this.city,
    required this.postalCode,
    required this.allergies,
    required this.emergencyContactName,
    required this.emergencyContactNumber,
    required this.medicalCondition,
    required this.id,
  });

  factory PatientDataModel.fromJson(Map<String, dynamic> json) {
    return PatientDataModel(
      patientName: json['PatientName'],
      recordLink: json['record_link'].toString(),
      age: json['Age'].toString(),
      dob: json['DOB'],
      status: json['Status'],
      address: json['Address'],
      city: json['City'],
      postalCode: json['PostalCode'],
      allergies: json['Allergies'],
      emergencyContactName: json['EmergencyContactName'],
      emergencyContactNumber: json['EmergencyContactNumber'],
      medicalCondition: json['MedicalCondition'],
      id: json['id'],
    );
  }
}
