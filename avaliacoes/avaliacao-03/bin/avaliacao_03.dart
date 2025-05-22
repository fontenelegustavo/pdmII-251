import 'dart:async';
import 'dart:isolate';

void main() async {
  // Criando um isolate para executar uma operação assíncrona - Serve como canal de comunicação para receber mensagens de outro isolate
  final receivePort = ReceivePort();
  await Isolate.spawn(doAsyncOperation, receivePort.sendPort);

  // Executando outras tarefas enquanto aguarda a conclusão da operação assíncrona
  print('Iniciando outras tarefas...');
  await Future.delayed(Duration(seconds: 1));
  print('Continuando outras tarefas...');

  // Recebendo o resultado da operação assíncrona
  final result = await receivePort.first;
  print('Resultado: $result');
}

void doAsyncOperation(SendPort sendPort) async {
  // Executando uma operação assíncrona em um isolate separado
  final result = "Gustavo Fontenele Coêlho";
  sendPort.send(result);
}