import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/relatorio.dart';

class RelatorioRepository {
  final CollectionReference _relatoriosRef =
      FirebaseFirestore.instance.collection('relatorios');

  Future<void> adicionarRelatorio(Relatorio relatorio) async {
    await _relatoriosRef.doc(relatorio.id).set(relatorio.toMap());
  }

  Future<List<Relatorio>> buscarTodos() async {
    final snapshot = await _relatoriosRef.get();
    return snapshot.docs
        .map((doc) => Relatorio.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
