import 'package:teste/app/domain/entities/professor.dart';

abstract class ProfessorDAO {
  save(Professor professor);

  Future<List<Professor>> find();
}
