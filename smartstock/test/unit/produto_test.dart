import 'package:flutter_test/flutter_test.dart';
import 'package:smartstock/models/entidades.dart';

void main() {
  group('Produto Model', () {
    test('deve converter Produto para Map e de volta corretamente', () {
      final produto = Produto(
        id: '1',
        nome: 'Caneta',
        descricao: 'Azul',
        preco: 2.5,
        quantidade: 100,
        categoriaId: 'cat1',
      );

      final map = produto.toMap();
      final produtoConvertido = Produto.fromMap(map);

      expect(produtoConvertido.id, '1');
      expect(produtoConvertido.nome, 'Caneta');
      expect(produtoConvertido.preco, 2.5);
    });
  });
}
