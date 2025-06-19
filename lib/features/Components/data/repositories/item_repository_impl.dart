import '../../domain/entities/item_entity.dart';
import '../../domain/repositories/item_repository.dart';
import '../models/item_model.dart';

class ItemRepositoryImpl implements ItemRepository {
  @override
  Future<List<ItemEntity>> getItems() async {
    // Exemplo com dado mockado. Substituir com chamada a API local ou remota.
    final List<Map<String, dynamic>> rawData = [
      {
        "item": "DTR0000019362",
        "descricao": "CONECTOR FEMEA HAN DD 108",
        "area": "Compo",
        "local_referencia": "P.S.M.E. - Pequenas Sub-Montagens Elétricas",
        "prateleira": "P001",
        "posicao": "A01",
        "projeto": "Wanda",
        "sigla": "WAN",
        "montagem": "",
        "fluxo": "FL06",
      },
    ];

    return rawData.map((json) => ItemModel.fromJson(json)).toList();
  }
}
