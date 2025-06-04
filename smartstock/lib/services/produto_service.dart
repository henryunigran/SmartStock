import '../models/produto.dart';
import '../repositories/produto_repository.dart';

class ProdutoService {
  final ProdutoRepository _repository;

  ProdutoService(this._repository);

  Future<void> criarProduto(Produto produto) async {
    if (produto.nome.isEmpty || produto.preco <= 0 || produto.quantidade < 0) {
      throw Exception('Dados inválidos do produto');
    }
    await _repository.adicionarProduto(produto);
  }

  Future<List<Produto>> listarProdutos() {
    return _repository.buscarTodos();
  }

  Future<void> editarProduto(Produto produto) {
    return _repository.atualizarProduto(produto);
  }

  Future<void> deletarProduto(String id) {
    return _repository.removerProduto(id);
  }
}
