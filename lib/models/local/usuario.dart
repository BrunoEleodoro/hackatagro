class Usuario {
  Usuario({
    required this.id,
    required this.img,
    required this.userPlan,
    required this.name,
    required this.email,
    required this.firebaseUID,
    required this.birthDate,
    required this.plataforma,
  });

  final String id;
  final String img;
  final String userPlan;
  final String name;
  final String email;
  final String firebaseUID;
  final String birthDate;
  final String plataforma;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['_id'] as String,
        img: json['img'] as String,
        userPlan: json['userPlan'] as String,
        name: json['name'] as String,
        email: json['email'] as String,
        firebaseUID: json['firebaseUID'] as String,
        birthDate: json['birthDate'] as String,
        plataforma: json['plataforma'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'img': img,
        'userPlan': userPlan,
        'name': name,
        'email': email,
        'firebaseUID': firebaseUID,
        'birthDate': birthDate,
        'plataforma': plataforma,
      };
}
