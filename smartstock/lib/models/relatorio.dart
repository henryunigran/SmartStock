class Relatorio {
  final String id;
  final DateTime data;
  final String descricao;

  Relatorio({required this.id, required this.data, required this.descricao});

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
