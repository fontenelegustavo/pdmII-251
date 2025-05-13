// Agregação e Composição
import 'dart:convert';

class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  Map toJson() => {
    'nome': _nome
  };
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  Map toJson() => {
    'nome': _nome,
    'dependentes': _dependentes
  };
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  Map toJson() => {
    'nome': _nomeProjeto,
    'funcionarios': _funcionarios
  };
}

void main() {
  // 1. Criar varios objetos Dependentes
  Dependente andre = Dependente("Dependente 1 André");
  Dependente gerson = Dependente("Dependente 2 Gerson");
  Dependente jonas = Dependente("Dependente 3 Jonas");
  Dependente enzo = Dependente("Dependente 4 Enzo");
  Dependente sid = Dependente("Dependente 5 Sid");
  Dependente cleiton = Dependente("Dependente 6 Cleiton");

  // 2. Criar varios objetos Funcionario
  // 3. Associar os Dependentes criados aos respectivos
  //    funcionarios
  Funcionario parmenides = Funcionario("Funcionário 1 Parmênides", [andre, gerson]);
  Funcionario heraclito = Funcionario("Funcionário 2 Heráclito", [jonas, enzo]);
  Funcionario camus = Funcionario("Funcionário 3 Camus", [sid, cleiton]);

  // 4. Criar uma lista de Funcionarios
  List<Funcionario> funcionarios = [parmenides, heraclito, camus];

  // 5. criar um objeto Equipe Projeto chamando o metodo
  //    contrutor que da nome ao projeto e insere uma
  //    coleção de funcionario
 EquipeProjeto osloTeam = EquipeProjeto("Equipe osloTeam", funcionarios);

  // 6. Printar no formato JSON o objeto Equipe Projeto.
  String osloTeamJson = jsonEncode(osloTeam);
  print('Bom dia/tarde/noite!');
  print(osloTeamJson);
}