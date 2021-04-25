class Aluno {
  int id;
  String nome;
  String sobrenome;
  String email;
  String senha;
  String nivel_acesso;
  Aluno(this.id, this.nome, this.sobrenome, this.email, this.senha,
      this.nivel_acesso);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'nome': nome,
      'sobrenome': sobrenome,
      'email': email,
      'senha': senha,
      'nivel_acesso': nivel_acesso
    };
    return map;
  }

  Aluno.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    sobrenome = map['sobrenome'];
    email = map['email'];
    senha = map['senha'];
    nivel_acesso = map['nivel_acesso'];
  }
}
