import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/conexaoDB.dart';
import 'package:teste/app/interfaces/aluno_dao.dart';
import 'package:teste/app/models/aluno.dart';

class AlunoDAOimpl implements AlunoDAO {
  Database _db;

  @override
  Future<List<Aluno>> find() async {
    Database db = await ConexaoDB.get();
    List<Map<String, dynamic>> resultado = await db.query('professor');
    List<Aluno> listaAlunos = <Aluno>[];

    for (var jsonPacote in resultado) {
      listaAlunos.add(Aluno.fromMap(jsonPacote));
    }
    return listaAlunos;
  }

  @override
  save(Aluno aluno) async {
    _db = await ConexaoDB.get();
    var sql;
    if (aluno.id == null) {
      sql =
          'INSERT INTO aluno(nome, sobrenome, email, senha, nivel_acesso) VALUES(?,?,?,?,?)';
      _db.rawInsert(sql, [
        aluno.nome,
        aluno.sobrenome,
        aluno.email,
        aluno.senha,
        aluno.nivel_acesso
      ]);
    } else {
      sql =
          'UPDATE aluno SET nome = ?, sobrenome = ?, email = ?, senha = ?, nivel_acesso = ? WHERE id = ?';
      _db.rawUpdate(sql, [
        aluno.nome,
        aluno.sobrenome,
        aluno.email,
        aluno.senha,
        aluno.nivel_acesso,
        aluno.id
      ]);
    }
  }
}
