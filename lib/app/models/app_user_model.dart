// import "package:firebase_auth/firebase_auth.dart";
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hhf_next_gen/app/console_utility.dart';
// import 'package:zimster_messaging/app/constants.dart' as constants;
// import 'package:firebase_auth/';

// /// default [photoURL] if none provided
// String _photoURLifBlank = 'https://st4.depositphotos.com/15973376/24173/v/950/depositphotos_241732228-stock-illustration-user-account-circular-line-icon.jpg';

class AppUserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class AppUserModel {
  AppUserModel({
    required this.fireAuthUid,
    required this.userId,
    required this.displayName,
    required this.providerId,
    // this.lastName,
    required this.email,
    // this.profileTitle,
    // this.userRoles,
    required this.photoURL,
    // this.lastMessageTime,
  });

  String? fireAuthUid, userId, email, displayName, providerId;
  late String photoURL;
  // DateTime lastMessageTime;

  AppUserModel.fromUserCredential(
      {UserCredential? userCredential,
      required String providerId,
      required String email}) {
    switch (providerId) {
      case 'Phone':
        this.userId = userCredential!.user!.phoneNumber!;
        displayName = 'User@  ${userCredential.user!.phoneNumber}';
        this.photoURL = '';
        this.email = '';
        break;
      case 'Email':
        this.userId = userCredential!.user!.email!;
        this.displayName = userCredential.user!.email!;
        this.photoURL = '';
        break;
      default:
        this.userId = userCredential!.user!.email!;
        this.displayName = userCredential.user!.email!;
        this.photoURL = userCredential.user!.photoURL!;
        this.email = userCredential.user!.email!;
        this.providerId = providerId;
    }
    this.providerId = providerId;

    fireAuthUid = userCredential.user!.uid;
  }
  AppUserModel.fromMinimal(String email) : email = email;
  AppUserModel.fromNull() : email = '';

  AppUserModel.fromData(Map<String, dynamic> data, String providerId)
      : fireAuthUid = data['fireAuthUid'],
        displayName = data['displayName'],
        userId = data['userId'],
        email = data['email'],
        providerId = providerId,
        photoURL = data['photoURL'];

  static AppUserModel fromJson(Map<String, dynamic> data) => AppUserModel(
        fireAuthUid: data['fireAuthUid'],
        displayName: data['displayName'],
        userId: data['userId'],
        email: data['email'],
        photoURL: data['photoURL'], providerId: '',
        // providerId=data['providerId'],
        // lastMessageTime: ConsoleUtility.toDateTime(data['lastMessageTime'],
        // ),
      );

  Map<String, dynamic> toJson() {
    return {
      'fireAuthUid': fireAuthUid,
      'displayName': displayName,
      'userId': userId,
      // 'lastName': lastName,
      'email': email,
      // 'profileTitle': profileTitle,
      // 'userRoles': userRoles,
      'providerId': this.providerId,
      'photoURL': photoURL,
      // 'lastMessageTime': ConUtils.fromDateTimeToJson(lastMessageTime),
    };
  }

  String toPrint() {
    String str;
    str =
        ' ${this.displayName}\n ${this.email}\n ${this.photoURL}\n${this.providerId}\n${this.fireAuthUid}';
    return str;
  }
}


  /// Parked for Future

    // AppUserModel copyWith({
    //   String uid,
    //   String email,
    //   String displayName,
    //   // final String lastName;
    //   // final String userRoles;
    //   String photoURL,
    //   String providerId,
  //  ) =>
  //       AppUserModel(
  //         fireAuthUid:  uid ?? this.fireAuthUid,
  //         displayName: displayName ?? this.displayName,
  //         email: email ?? this.email,
  //         photoURL: photoURL ?? this.photoURL,
  //       );