import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../services/produto_service.dart';

class ProdutoProvider with ChangeNotifier {
  final ProdutoService _service;

  ProdutoProvider(this._service);

  List<Produto> _produtos = [];
  bool _carregando = false;

  List<Produto> get produtos => _produtos;
  bool get carregando => _carregando;

  Future<void> carregarProdutos() async {
    _carregando = true;
    notifyListeners();

    _produtos = await _service.listarProdutos();

    _carregando = false;
    notifyListeners();
  }

  Future<void> adicionarProduto(Produto produto) async {
    await _service.criarProduto(produto);
    await carregarProdutos();
  }

  Future<void> atualizarProduto(Produto produto) async {
    await _service.editarProduto(produto);
    await carregarProdutos();
  }

  Future<void> removerProduto(String id) async {
    await _service.deletarProduto(id);
    await carregarProdutos();
  }
}
