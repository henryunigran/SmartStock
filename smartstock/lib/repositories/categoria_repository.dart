import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/categoria.dart';

class CategoriaRepository {
  final CollectionReference _categoriasRef =
      FirebaseFirestore.instance.collection('categorias');

  Future<void> adicionarCategoria(Categoria categoria) async {
    await _categoriasRef.doc(categoria.id).set(categoria.toMap());
  }

  Future<List<Categoria>> buscarTodas() async {
    final snapshot = await _categoriasRef.get();
    return snapshot.docs
        .map((doc) => Categoria.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
