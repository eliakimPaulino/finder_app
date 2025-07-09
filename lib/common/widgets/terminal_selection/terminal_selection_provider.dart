import 'package:flutter/material.dart';

import 'model/flexibel_terminal_model.dart';

class TerminalSelectionProvider with ChangeNotifier {
  final List<Terminal> _selecionados = [];

  List<Terminal> get selecionados => _selecionados;

  void adicionarTerminal(Terminal terminal) {
    if (_selecionados.any((t) => t.id == terminal.id)) {
      _selecionados.removeWhere((t) => t.id == terminal.id);
    } else {
      _selecionados.add(terminal);
    }
    notifyListeners();
  }

  void limparSelecionado(String terminalId) {
    _selecionados.removeWhere((t) => t.id == terminalId);
    notifyListeners();
  }

  void limparSelecionados() {
    _selecionados.clear();
    notifyListeners();
  }

}