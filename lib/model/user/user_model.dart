class UserModel {
  String? fullname;
  String? uid;
  String? email;
  String? profilePic;

  UserModel({this.fullname, this.uid, this.email, this.profilePic});

  UserModel.fromMap(Map<String, dynamic> map) {
    fullname = map['fullname'];
    uid = map['uid'];
    email = map['email'];
    profilePic = map['profilePic'];
  }

  Map<String, dynamic> toMap() => {
        'fullname': fullname,
        'uid': uid,
        'email': email,
        'profilePic': profilePic,
      };
}
