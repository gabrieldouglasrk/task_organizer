import '../lib/models/task.dart';
import 'dart:io';

void main() {
  List<Task> tasks = [];

  while (true) {
    print('\n1 - Adicionar tarefa');
    print('2 - Listar tarefas');
    print('3 - Marcar como concluída');
    print('4 - Sair');
    String? opcao = stdin.readLineSync();

    if (opcao == '1') {
      print('Nome da tarefa:');
      String? nome = stdin.readLineSync();
      if (nome != null && nome.isNotEmpty) {
        tasks.add(Task(nome));
      }
    } else if (opcao == '2') {
      for (int i = 0; i < tasks.length; i++) {
        String status = tasks[i].completed ? '[x]' : '[ ]';
        print('$i - $status ${tasks[i].name}');
      }
    } else if (opcao == '3') {
      print('Número da tarefa:');
      int? idx = int.tryParse(stdin.readLineSync() ?? '');
      if (idx != null && idx >= 0 && idx < tasks.length) {
        tasks[idx].completed = true;
      }
    } else if (opcao == '4') {
      break;
    }
  }
}