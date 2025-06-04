import 'package:flutter_test/flutter_test.dart';
import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:smartstock/models/entidades.dart';

void main() {
  final instance = MockFirestoreInstance();

  group('Integração Produto + Firestore (Mock)', () {
    test('Adicionar e recuperar produto', () async {
      final produto = Produto(
        id: 'p1',
        nome: 'Lápis',
        descricao: 'Preto',
        preco: 1.2,
        quantidade: 50,
        categoriaId: 'cat1',
      );

      // Salvar produto
      await instance
          .collection('produtos')
          .doc(produto.id)
          .set(produto.toMap());

      // Recuperar
      final snapshot = await instance.collection('produtos').doc('p1').get();
      final produtoRecuperado = Produto.fromMap(snapshot.data()!);

      expect(produtoRecuperado.nome, 'Lápis');
      expect(produtoRecuperado.quantidade, 50);
    });
  });
}
