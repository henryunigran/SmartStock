import '../models/relatorio.dart';
import '../repositories/relatorio_repository.dart';

class RelatorioService {
  final RelatorioRepository _repository;

  RelatorioService(this._repository);

  Future<void> criarRelatorio(Relatorio relatorio) async {
    if (relatorio.descricao.isEmpty) {
      throw Exception('Descrição obrigatória');
    }
    await _repository.adicionarRelatorio(relatorio);
  }

  Future<List<Relatorio>> listarRelatorios() {
    return _repository.buscarTodos();
  }
}
