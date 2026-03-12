class Igreja {
  final String id;
  final String nome;
  final String cidade;
  final String descricao;
  final List<String> avisos;
  final String palavraPosCulto;
  final List<String> pedidosAjuda;

  Igreja({
    required this.id,
    required this.nome,
    required this.cidade,
    required this.descricao,
    required this.avisos,
    required this.palavraPosCulto,
    required this.pedidosAjuda,
  });
}
