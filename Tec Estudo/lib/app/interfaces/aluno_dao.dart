

import 'package:teste/app/models/aluno.dart';

abstract class AlunoDAO{

  save(Aluno aluno);

  Future<List<Aluno>>find();

}