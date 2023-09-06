class Users {
  late String id,
      name,
      email,
      type,
      phoneNumber,
      gender,
      institution,
      credentials;
  late bool hasBeenValidated;
  late Map<String, dynamic> details;

  Users({
    required this.id,
    required this.name,
    required this.email,
    this.type = "user",
    this.phoneNumber = "",
    this.gender = "",
    this.institution = "",
    this.credentials = "",
    this.hasBeenValidated = false,
    this.details = const {
      "resident": "",
      "area": "",
      "speaker": "",
      "attending": "",
      "dinner": "",
      "reservations": "",
      "assistance": "",
      "psychoOncology": "",
      "badNews": "",
      "brachytherapy": "",
      "hasFinished": "false",
      "paymentSubmitted": "false",
      "paymentConfirmed": "false",
      "paymentProof": "",
    },
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        gender: json['gender'],
        type: json['type'],
        institution: json["institution"],
        credentials: json["credentials"],
        details: json["details"],
        hasBeenValidated: json["hasBeenValidated"] ?? false,
        phoneNumber: json["phoneNumber"],
      );
}











// class Users {
//   Users({
//     required this.uid,
//     this.email,
//     required this.name,
//     this.fBMToken,
//     this.phoneNo,
//     required this.isVerified,
//     required this.date,
//     required this.gender,
//     this.attendDinner,
//     this.attendWorkshopBadnews,
//     this.attendWorkshopPsychooncology,
//     this.attendanceType,
//     this.degree,
//     this.employeeInstitutIonName,
//     this.reservations,
//     this.residentDoctor,
//     this.specialization,
//     this.submitAbstract,
//   });
//   String uid;
//   String? email;
//   String name;
//   DateTime date;
//   String? phoneNo;
//   String? fBMToken;
//   String gender;
//   String? degree;
//   String? specialization;
//   String? employeeInstitutIonName;
//   bool? residentDoctor;
//   bool? submitAbstract;
//   bool? isVerified;
//   bool? attendanceType;
//   bool? attendWorkshopPsychooncology;
//   bool? attendWorkshopBadnews;
//   bool? attendDinner;
//   bool? reservations;

//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//         uid: json["id"],
//         email: json["email"],
//         name: json["name"],
//         phoneNo: json["phoneNo"],
//         fBMToken: json["fBMToken"],
//         isVerified: json['isVerified'],
//         date: json['date'],
//         gender: json['gender'],
//         attendDinner: json['dinner'],
//         attendWorkshopBadnews: json['badnewsWorkShop'],
//         attendWorkshopPsychooncology: json['psychoWorkShop'],
//         attendanceType: json['attendanceType'],
//         degree: json['degree'],
//         employeeInstitutIonName: json['institutIonName'],
//         reservations: json['reservations'],
//         residentDoctor: json['residentDoctor'],
//         specialization: json['specialization'],
//         submitAbstract: json['submitAbstract'],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": uid,
//         "email": email,
//         "phoneNo": phoneNo,
//         "fBMToken": fBMToken,
//         "date": date.toIso8601String(),
//         "isVerified": isVerified,
//         "name": name,
//         'submitAbstract': submitAbstract,
//         "specialization": specialization,
//         "residentDoctor": residentDoctor,
//         'institutIonName': employeeInstitutIonName,
//         'reservations': reservations,
//         'degree': degree,
//         'attendanceType': attendanceType,
//         'psychoWorkShop': attendWorkshopPsychooncology,
//         'badnewsWorkShop': attendWorkshopBadnews,
//         'gender': gender,
//         'dinner': attendDinner,
//       };
// }
