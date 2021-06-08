class Patient {
  final String patientId, firstName, lastName;

  Patient(
      {required this.patientId,
      required this.firstName,
      required this.lastName});

  static  Patient fromJson(Map<String, dynamic> data) => Patient(
      patientId: data['patientId'],
      firstName: data['firstName'],
      lastName: data['lastName']);

  late final age, isMale, address, mobile;
}
