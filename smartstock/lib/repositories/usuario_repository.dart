import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/usuario.dart';

class UsuarioRepository {
  final CollectionReference _usuariosRef =
      FirebaseFirestore.instance.collection('usuarios');

  Future<void> adicionarUsuario(Usuario usuario) async {
    await _usuariosRef.doc(usuario.id).set(usuario.toMap());
  }

  Future<Usuario?> buscarPorId(String id) async {
    final doc = await _usuariosRef.doc(id).get();
    if (doc.exists) {
      return Usuario.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<List<Usuario>> buscarTodos() async {
    final snapshot = await _usuariosRef.get();
    return snapshot.docs
        .map((doc) => Usuario.fromMap(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
