class Usuario {
  final String id;
  final String nome;
  final String email;
  final String senha;

  Usuario({
    required this.id,
    required this.nome,
    required this.email,
    required this.senha,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}

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
      preco: map['preco'],
      quantidade: map['quantidade'],
      categoriaId: map['categoriaId'],
    );
  }
}

class Categoria {
  final String id;
  final String nome;

  Categoria({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      nome: map['nome'],
    );
  }
}

class Relatorio {
  final String id;
  final DateTime data;
  final String descricao;

  Relatorio({
    required this.id,
    required this.data,
    required this.descricao,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'data': data.toIso8601String(),
      'descricao': descricao,
    };
  }

  factory Relatorio.fromMap(Map<String, dynamic> map) {
    return Relatorio(
      id: map['id'],
      data: DateTime.parse(map['data']),
      descricao: map['descricao'],
    );
  }
}
