class ComponentEntity {
  final String dtr;
  final String description;
  final String area;
  final String referenceLocation;
  final String shelf;
  final String position;

  const ComponentEntity({
    required this.dtr,
    required this.description,
    required this.area,
    required this.referenceLocation,
    required this.shelf,
    required this.position,
  });
}
  // // Função para capitalizar a primeira letra de cada palavra, com exceções
  // String capitalizarPrimeiraLetraComExcecoes(String texto) {
  //   // Lista de palavras que não devem ser capitalizadas
  //   List<String> excecoes = [
  //     'de',
  //     'da',
  //     'do',
  //     'dos',
  //     'das',
  //     'a',
  //     'o',
  //     'os',
  //     'as',
  //     'para',
  //     'em',
  //     'com',
  //     'sobre',
  //     'entre',
  //   ];

  //   // Lista de palavras que devem ser mantidas em maiúsculas
  //   List<String> maintainCapitalize = [
  //     'GIRATORIA-D28-LATAO-ISO8434-1L',
  //     'TRS',
  //     'DD',
  //     'HAN',
  //     'EE',
  //     'MM',
  //     'AA',
  //     'CC',
  //     'DDC',
  //     'DDA',
  //     'DDE',
  //     'DDAA',
  //     'DDCC',
  //     'DDMM',
  //     'DDMMCC',
  //   ];

  //   // Separar a string em palavras
  //   List<String> palavras = texto.split(" ");

  //   // Capitalizar a primeira letra de cada palavra, com exceção das palavras na lista
  //   List<String> palavrasFormatadas = palavras.map((palavra) {
  //     if (palavra.isNotEmpty) {
  //       // Verificar se a palavra é uma exceção
  //       if (excecoes.contains(palavra.toLowerCase())) {
  //         return palavra.toLowerCase(); // Deixar em minúscula
  //       }
  //       if (maintainCapitalize.contains(palavra.toUpperCase())) {
  //         return palavra.toUpperCase(); // Manter em maiúsculas
  //       }
  //       return palavra[0].toUpperCase() + palavra.substring(1).toLowerCase();
  //     }
  //     return palavra;
  //   }).toList();

  //   // Reunir as palavras de volta em uma string
  //   return palavrasFormatadas.join(" ");
  // }

  // // Método para retornar uma nova instância de ComponentEntity com a descrição formatada
  // ComponentEntity formatarDescricao() {
  //   return ComponentEntity(
  //     dtr: dtr,
  //     description: capitalizarPrimeiraLetraComExcecoes(description),
  //     area: area,
  //     referenceLocation: referenceLocation,
  //     shelf: shelf,
  //     position: position,
  //   );
  // }

