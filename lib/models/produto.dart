// Classe produto, uma classe modelo que contém valores que precisam ser inseridos ou retornados
// como nome, valor e imagem do produto.

class Produto {
  final String nome;
  final String desc;
  final String valor;
  final String imagem;
  bool adicionado = false;

  Produto(
      {required this.nome,
      required this.desc,
      required this.valor,
      required this.imagem});
}
