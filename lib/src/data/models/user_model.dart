class UserModel {
  final String? id;
  final String? name;
  final int? registration;
  final int? status;
  final int? passwordUpdate;
  final String? email;
  final bool? emailVerification;
  final Object prefs;

  UserModel({
    required this.id,
    required this.name,
    required this.registration,
    required this.status,
    required this.passwordUpdate,
    required this.email,
    required this.emailVerification,
    required this.prefs,
  });

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      id: data['\$id'],
      name: data['name'],
      registration: data['registration'],
      status: data['status'],
      passwordUpdate: data['passwordUpdate'],
      email: data['email'],
      emailVerification: data['emailVerification'],
      prefs: data['prefs'],
    );
  }

  Map<String, dynamic> toJson() => {
    '\$id': id,
    'name': name,
    'registration': registration,
    'status': status,
    'passwordUpdate': passwordUpdate,
    'email': email,
    'emailVerification': emailVerification,
    'prefs': prefs,
  };
}