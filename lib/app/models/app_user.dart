

/// default [photoURL] if none provided
// String _photoURLifBlank = constants.kPhotoURLIfBlank;
// 'https://st4.depositphotos.com/15973376/24173/v/950/depositphotos_241732228-stock-illustration-user-account-circular-line-icon.jpg';

class AppUserField {
  static final String lastMessageTime = 'lastMessageTime';
}

class UserModel {
  UserModel(this.userId, this.displayName, this.email, this.phone);
  late final String userId, displayName, email, phone;
  late final String providerId, photoURL;
  UserModel.fromMinimal({required this.displayName});

//  UserModel.fromUserCredential(this.userId, this.displayName, this.email, this.phone,
//       {UserCredential userCredential, String providerId}) {
//     switch (providerId) {
//       case 'Phone':
//         this.userId = userCredential.user.phoneNumber;
//         displayName = 'User@  ${userCredential.user.phoneNumber}';
//         this.photoURL = '';
//         this.email = '';
//         break;
//       case 'Email':
//         this.userId = userCredential.user.email;
//         this.displayName = userCredential.user.email;
//         this.photoURL = '';
//         break;
//       default:
//         this.userId = userCredential.user.email;
//         this.displayName = userCredential.user.email;
//         this.photoURL = userCredential.user.photoURL;
//         this.email = userCredential.user.email;
//     this. providerId = providerId;
//     }

//       fireAuthUid = userCredential.user.uid;
//   }

  UserModel.fromData(Map<String, dynamic> data, this.phone, this.providerId)
      : displayName = data['displayName'],
        userId = data['userId'],
        email = data['email'],
        photoURL = data['photoURL'];
  // fireAuthUid = data['fireAuthUid'],
  // providerId = providerId,

static UserModel fromJson(Map<String, dynamic> data) => UserModel(
       data['userId'],
         data['displayName'],
        
        data['email'],
        data['photoURL'],
        // providerId=data['providerId'],
        );
      



}
