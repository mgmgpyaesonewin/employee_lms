class User {
  final String name;
  final String profileLink;
  final String email;
  final int point;
  final String userId;

  User(this.name, this.email, this.profileLink, this.userId, {this.point = 0});

  User.fromMap(Map<String, dynamic> map)
      : assert(map['name'] != null),
        assert(map['email'] != null),
        assert(map['profile_link'] != null),
        name = map['name'],
        email = map['email'],
        point = map['point'],
        userId = map['userId'],
        profileLink = map['profile_link'];

  Map<String, dynamic> toMap() => {
        'name': name,
        'profile_link': profileLink,
        'userId': userId,
        'email': email,
        'point': point
      };

  // User.fromSnapshot(DocumentSnapshot snapshot)
  //     : this.fromMap(snapshot.data, snapshot.documentID,
  //           reference: snapshot.reference);
}
