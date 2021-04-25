import 'package:teste/app/models/professor.dart';

abstract class ProfessorDAO{

  save(Professor professor);

  Future<List<Professor>>find();

}