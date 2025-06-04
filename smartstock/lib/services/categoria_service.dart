import '../models/categoria.dart';
import '../repositories/categoria_repository.dart';

class CategoriaService {
  final CategoriaRepository _repository;

  CategoriaService(this._repository);

  Future<void> criarCategoria(Categoria categoria) async {
    if (categoria.nome.isEmpty) {
      throw Exception('Nome da categoria é obrigatório');
    }
    await _repository.adicionarCategoria(categoria);
  }

  Future<List<Categoria>> listarCategorias() {
    return _repository.buscarTodas();
  }
}
