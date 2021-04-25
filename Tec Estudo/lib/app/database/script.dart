final createTableAluno = """
      CREATE TABLE aluno(
        id INT PRIMARY KEY,
        nome VARCHAR[200] NOT NULL,
        sobrenome VARCHAR[200] NOT NULL,
        email VARCHAR[150] NOT NULL,
        senha VARCHAR[200] NOT NULL,
        nivel_acesso VARCHAR[20] NOT NULL,
      )
    """;
final insertAluno = """
      INSERT INTO aluno (nome, sobrenome, email, senha, nivel_acesso)
      VALUES()
    """;

final createTableProfessor = """
      CREATE TABLE professor(
        id INT PRIMARY KEY,
        nome VARCHAR[200] NOT NULL,
        sobrenome VARCHAR[200] NOT NULL,
        email VARCHAR[150] NOT NULL,
        senha VARCHAR[200] NOT NULL,
        materia VARCHAR[200] NOT NULL,
        nivel_acesso VARCHAR[20] NOT NULL,
      )
    """;
final insertProfessor = """
      INSERT INTO professor (nome, sobrenome, email, senha, materia, nivel_acesso)
      VALUES('','','','','')
    """;
