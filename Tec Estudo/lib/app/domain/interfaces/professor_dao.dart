import 'package:teste/app/domain/models/professor.dart';

abstract class ProfessorDAO {
  save(Professor professor);

  Future<List<Professor>> find();
}
