import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/produto.dart';

class ProdutoRepository {
  final CollectionReference _produtosRef =
      FirebaseFirestore.instance.collection('produtos');

  Future<void> adicionarProduto(Produto produto) async {
    await _produtosRef.doc(produto.id).set(produto.toMap());
  }

  Future<List<Produto>> buscarTodos() async {
    final snapshot = await _produtosRef.get();
    return snapshot.docs
        .map((doc) => Produto.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }

  Future<void> atualizarProduto(Produto produto) async {
    await _produtosRef.doc(produto.id).update(produto.toMap());
  }

  Future<void> removerProduto(String id) async {
    await _produtosRef.doc(id).delete();
  }
}
