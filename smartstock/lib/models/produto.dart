class Produto {
  final String id;
  final String nome;
  final String descricao;
  final double preco;
  final int quantidade;
  final String categoriaId;

  Produto({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
    required this.quantidade,
    required this.categoriaId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'preco': preco,
      'quantidade': quantidade,
      'categoriaId': categoriaId,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    return Produto(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      preco: (map['preco'] as num).toDouble(),
      quantidade: map['quantidade'],
      categoriaId: map['categoriaId'],
    );
  }
}
