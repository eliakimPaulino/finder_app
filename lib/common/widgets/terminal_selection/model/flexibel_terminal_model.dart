class Terminal {
  final String id;
  final String nome;
  final String tipo;
  final String descricao;
  final Map<String, dynamic> detalhes;

  Terminal({
    required this.id,
    required this.nome,
    required this.tipo,
    required this.descricao,
    required this.detalhes,
  });

  factory Terminal.fromJson(Map<String, dynamic> json) {
    return Terminal(
      id: json['id'],
      nome: json['nome'],
      tipo: json['tipo'],
      descricao: json['descricao'],
      detalhes: json['detalhes'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'tipo': tipo,
      'descricao': descricao,
      'detalhes': detalhes,
    };
  }
}
