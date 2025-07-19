class ComponentEntity {
  final String item;
  final String descricao;
  final String area;
  final String localReferencia;
  final String prateleira;
  final String posicao;
  final String projeto;
  final String sigla;
  final String montagem;
  final String fluxo;

  const ComponentEntity({
    required this.item,
    required this.descricao,
    required this.area,
    required this.localReferencia,
    required this.prateleira,
    required this.posicao,
    required this.projeto,
    required this.sigla,
    required this.montagem,
    required this.fluxo,
  });

  // Função para capitalizar a primeira letra de cada palavra, com exceções
  String capitalizarPrimeiraLetraComExcecoes(String texto) {
    // Lista de palavras que não devem ser capitalizadas
    List<String> excecoes = [
      'de',
      'da',
      'do',
      'dos',
      'das',
      'a',
      'o',
      'os',
      'as',
      'para',
      'em',
      'com',
      'sobre',
      'entre',
    ];

    // Lista de palavras que devem ser mantidas em maiúsculas
    List<String> maintainCapitalize = [
      'GIRATORIA-D28-LATAO-ISO8434-1L',
      'TRS',
      'DD',
      'HAN',
      'EE',
      'MM',
      'AA',
      'CC',
      'DDC',
      'DDA',
      'DDE',
      'DDAA',
      'DDCC',
      'DDMM',
      'DDMMCC',
    ];

    // Separar a string em palavras
    List<String> palavras = texto.split(" ");

    // Capitalizar a primeira letra de cada palavra, com exceção das palavras na lista
    List<String> palavrasFormatadas = palavras.map((palavra) {
      if (palavra.isNotEmpty) {
        // Verificar se a palavra é uma exceção
        if (excecoes.contains(palavra.toLowerCase())) {
          return palavra.toLowerCase(); // Deixar em minúscula
        }
        if (maintainCapitalize.contains(palavra.toUpperCase())) {
          return palavra.toUpperCase(); // Manter em maiúsculas
        }
        return palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
      }
      return palavra;
    }).toList();

    // Reunir as palavras de volta em uma string
    return palavrasFormatadas.join(" ");
  }

  // Método para retornar uma nova instância de ComponentEntity com a descrição formatada
  ComponentEntity formatarDescricao() {
    return ComponentEntity(
      item: item,
      descricao: capitalizarPrimeiraLetraComExcecoes(descricao),
      area: area,
      localReferencia: localReferencia,
      prateleira: prateleira,
      posicao: posicao,
      projeto: projeto,
      sigla: sigla,
      montagem: montagem,
      fluxo: fluxo,
    );
  }
}
