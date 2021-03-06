import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/conexaoDB.dart';
import 'package:teste/app/domain/interfaces/aluno_dao.dart';
import 'package:teste/app/domain/entities/aluno.dart';

class AlunoDAOimpl implements AlunoDAO {
  Database _db;

  @override
  Future<List<Aluno>> find() async {
    _db = await ConexaoDB.get();
    List<Map<String, dynamic>> resultado = await _db.query('aluno');
    List<Aluno> listaAlunos = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Aluno(
          id: linha['id'],
          login: linha['login'],
          nome: linha['nome'],
          sobrenome: linha['sobrenome'],
          email: linha['email'],
          senha: linha['senha'],
          nivel_acesso: linha['nivel_acesso']);
    });
    return listaAlunos;
  }

  @override
  save(Aluno aluno) async {
    _db = await ConexaoDB.get();
    var sql;
    if (aluno.id == null) {
      sql =
          'INSERT INTO aluno(login, nome, sobrenome, email, senha, nivel_acesso) VALUES(?,?,?,?,?,?)';
      _db.rawInsert(sql, [
        aluno.nome,
        aluno.login,
        aluno.sobrenome,
        aluno.email,
        aluno.senha,
        aluno.nivel_acesso
      ]);
    } else {
      sql = 'UPDATE aluno SET  senha = ? WHERE id = ?';
      _db.rawUpdate(sql, [aluno.senha, aluno.id]);
    }
  }
}
