class Usuario {

  static final String ULID = '01j40txzxt3xh713e3fgyp04jd';

  String id;
  String nome;
  String email;

  Usuario({required this.id, required this.nome, required this.email});

  Usuario.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['nome'],
        email = json['email'];

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': this.id,
      'nome': this.nome,
      'email': this.email,
    };

    return data;
  }

  @override
  String toString() {
    return 'Usuario{id: $id, nome: $nome, email: $email}';
  }
}
