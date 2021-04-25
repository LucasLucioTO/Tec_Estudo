import 'package:teste/app/domain/models/aluno.dart';

abstract class AlunoDAO {
  save(Aluno aluno);

  Future<List<Aluno>> find();
}
