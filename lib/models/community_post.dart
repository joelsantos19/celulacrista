class CommunityPost {
  final String id;
  final String titulo;
  final String conteudo;
  final bool isAnonymous;
  final String? autor;

  CommunityPost({
    required this.id,
    required this.titulo,
    required this.conteudo,
    this.isAnonymous = false,
    this.autor,
  });
}
