class Celula {
  final String id;
  final String nome;
  final String igreja;
  final String diaSemana;
  final String horario;
  final double distancia;
  final bool isOnline;
  final String? linkReuniao;

  Celula({
    required this.id,
    required this.nome,
    required this.igreja,
    required this.diaSemana,
    required this.horario,
    required this.distancia,
    this.isOnline = false,
    this.linkReuniao,
  });
}
