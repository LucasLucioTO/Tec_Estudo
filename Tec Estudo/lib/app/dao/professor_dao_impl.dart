import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/conexaoDB.dart';
import 'package:teste/app/interfaces/professor_dao.dart';
import 'package:teste/app/models/professor.dart';

class ProfessorDAOimpl implements ProfessorDAO {
  Database _db;

  @override
  Future<List<Professor>> find() async {
    Database db = await ConexaoDB.get();
    List<Map<String, dynamic>> resultado = await db.query('professor');
    List<Professor> listaProfessores = <Professor>[];

    for (var jsonPacote in resultado) {
      listaProfessores.add(Professor.fromMap(jsonPacote));
    }
    return listaProfessores;
  }

  @override
  save(Professor professor) async {
    _db = await ConexaoDB.get();
    var sql;
    if (professor.id == null) {
      sql =
          'INSERT INTO profesor(nome, sobrenome, email, senha, materia, nivel_acesso) VALUES(?,?,?,?,?,?)';
      _db.rawInsert(sql, [
        professor.nome,
        professor.sobrenome,
        professor.email,
        professor.senha,
        professor.materia,
        professor.nivel_acesso
      ]);
    } else {
      sql =
          'UPDATE professor SET nome = ?, sobrenome = ?, email = ?, senha = ?, materia = ?, nivel_acesso = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        professor.nome,
        professor.sobrenome,
        professor.email,
        professor.senha,
        professor.materia,
        professor.nivel_acesso,
        professor.id
      ]);
    }
  }
}