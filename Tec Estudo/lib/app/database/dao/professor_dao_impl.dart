import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/conexaoDB.dart';
import 'package:teste/app/domain/interfaces/professor_dao.dart';
import 'package:teste/app/domain/entities/professor.dart';

class ProfessorDAOimpl implements ProfessorDAO {
  Database _db;

  @override
  Future<List<Professor>> find() async {
    Database db = await ConexaoDB.get();
    List<Map<String, dynamic>> resultado = await db.query('professor');
    List<Professor> listaProfessores = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Professor(
          id: linha['id'],
          login: linha['login'],
          nome: linha['nome'],
          sobrenome: linha['sobrenome'],
          email: linha['email'],
          senha: linha['senha'],
          materia: linha['materia'],
          nivel_acesso: linha['nivel_acesso']);
    });
    return listaProfessores;
  }

  @override
  save(Professor professor) async {
    _db = await ConexaoDB.get();
    var sql;
    if (professor.id == null) {
      sql =
          'INSERT INTO profesor(login, nome, sobrenome, email, senha, materia, nivel_acesso) VALUES(?,?,?,?,?,?)';
      _db.rawInsert(sql, [
        professor.nome,
        professor.login,
        professor.sobrenome,
        professor.email,
        professor.senha,
        professor.materia,
        professor.nivel_acesso
      ]);
    } else {
      sql = 'UPDATE professor SET senha = ? WHERE id = ?';
      _db.rawUpdate(sql, [professor.senha, professor.id]);
    }
  }
}
