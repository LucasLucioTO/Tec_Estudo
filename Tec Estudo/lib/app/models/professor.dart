class Professor {
  int id;
  String nome;
  String sobrenome;
  String email;
  String senha;
  String materia;
  String nivel_acesso;
  Professor(this.id, this.nome, this.sobrenome, this.email, this.senha,
      this.materia, this.nivel_acesso);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'senha': senha,
      'materia': materia,
      'nivel_acesso': nivel_acesso
    };
    return map;
  }

  Professor.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    sobrenome = map['sobrenome'];
    email = map['email'];
    senha = map['senha'];
    materia = map['materia'];
    nivel_acesso = map['nivel_acesso'];
  }
}
