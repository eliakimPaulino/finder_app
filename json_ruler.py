import json

def adicionar_section(data):
    if isinstance(data, list):
        return [adicionar_section(item) for item in data]
    
    elif isinstance(data, dict):
        nova_estrutura = {}
        for chave, valor in data.items():
            nova_estrutura[chave] = adicionar_section(valor)
            if chave == "stripping":
                nova_estrutura["section"] = ""  # Adiciona após 'stripping'
        return nova_estrutura
    
    else:
        return data  # valor simples

# === Leitura do arquivo original ===
with open("C:/Users/eliak/Documents/flutter/finder_app/assets/data/pep/pep_440_rev6.json", "r", encoding="utf-8") as f:
    conteudo = json.load(f)

# === Modificação ===
conteudo_modificado = adicionar_section(conteudo)

# === Salvando em novo arquivo (ou sobrescrevendo) ===
with open("arquivo_modificado.json", "w", encoding="utf-8") as f:
    json.dump(conteudo_modificado, f, ensure_ascii=False, indent=4)

print("Modificação concluída com sucesso!")