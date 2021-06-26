class Patient {
  late String patientId, firstName, lastName;
  late int age;
  late bool isMale;
  late String adr1, adr2, city, phoneNumber;

  Patient(
      {required this.patientId,
      required this.firstName,
      required this.lastName,
      required this.isMale,
      required this.adr1,
      required this.adr2,
      required this.city,
      required this.age,
      required this.phoneNumber});

  static Patient fromJson(Map<String, dynamic> data) => Patient(
      patientId: data['patientId'].toString(),
      firstName: data['firstName'].toString(),
      lastName: data['lastName'].toString(),
      isMale: data['isMale'],
      age: data['age'],
      
      adr1: data['adr1'].toString(),
      adr2: data['adr2'].toString(),
      city: data['city'].toString(),
      phoneNumber: data['phoneNumber'].toString());

  Map<String, dynamic> toJson() {
    return {
      'patientId': patientId,
      'firstName': this.firstName,
      'lastName': this.lastName,
      'isMale': this.isMale,
      'city': this.city,
      'adr1': this.adr1,
      'adr2': this.adr2,
      'phoneNumber': this.phoneNumber,
      'age':this.age,
    };
  }
}
