import '../models/usuario.dart';
import '../repositories/usuario_repository.dart';

class UsuarioService {
  final UsuarioRepository _repository;

  UsuarioService(this._repository);

  Future<void> cadastrarUsuario(Usuario usuario) async {
    if (usuario.nome.isEmpty ||
        usuario.email.isEmpty ||
        usuario.senha.isEmpty) {
      throw Exception('Todos os campos são obrigatórios');
    }
    await _repository.adicionarUsuario(usuario);
  }

  Future<Usuario?> buscarPorId(String id) {
    return _repository.buscarPorId(id);
  }

  Future<List<Usuario>> listarUsuarios() {
    return _repository.buscarTodos();
  }
}
