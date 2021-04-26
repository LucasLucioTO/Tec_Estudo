import 'package:teste/app/domain/entities/aluno.dart';

abstract class AlunoDAO {
  save(Aluno aluno);

  Future<List<Aluno>> find();
}
