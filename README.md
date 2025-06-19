# 📦 App de Gestão de Componentes Elétricos

Aplicativo Flutter para controle de materiais e componentes elétricos no setor de produção ferroviária.

## 🧩 Funcionalidades

- 📁 Importação de planilhas `.csv` com dados de componentes.
- 🔍 Busca por item ou descrição.
- 🎯 Filtros por Área e Fluxo.
- 📋 Lista de materiais com detalhes como:
  - Código
  - Descrição
  - Localização (Área, Prateleira, Local)
- 📱 Interface amigável e responsiva.

## 🛠 Tecnologias

- **Flutter** (Material Design)
- `csv`: leitura e conversão de arquivos CSV
- `file_picker`: seleção de arquivos locais
- (Opcional: `hive` ou `sqflite` para persistência local)

## 📂 Estrutura de Pastas

```bash
lib/
├── core/                          # Código reutilizável e regras genéricas
│   ├── constants/                 # Constantes globais (cores, textos, etc.)
│   ├── errors/                    # Classes de exceção e falhas
│   ├── usecases/                  # Casos de uso base (ex: UseCase<T, Params>)
│   ├── utils/                     # Utilitários e helpers gerais
│   └── widgets/                   # Widgets genéricos compartilhados
│
├── features/
│   ├── auth/                      # Funcionalidades de autenticação
│   │   ├── data/
│   │   │   ├── models/            # Modelos para API/local
│   │   │   ├── datasources/      # Fontes de dados (ex: local ou remoto)
│   │   │   └── repositories/     # Implementações de repositórios
│   │   ├── domain/
│   │   │   ├── entities/         # Entidades de domínio (ex: User)
│   │   │   ├── usecases/         # Casos de uso (ex: LoginUser)
│   │   │   └── repositories/     # Contratos de repositórios
│   │   └── presentation/
│   │       ├── pages/            # Telas da interface (login, cadastro, etc.)
│   │       └── controllers/      # Lógica dos estados e inputs (ex: Provider, Cubit)
│
│   ├── Components/               # Funcionalidade principal: gestão de componentes elétricos
│   │   ├── data/
│   │   │   ├── models/           
│   │   │   ├── datasources/      
│   │   │   └── repositories/     
│   │   ├── domain/
│   │   │   ├── entities/         
│   │   │   ├── usecases/         
│   │   │   └── repositories/     
│   │   └── presentation/
│   │       ├── pages/            # Telas como: listagem, detalhes, importação
│   │       └── controllers/      # Lógica de controle (busca, filtro, etc.)
│
│   └── user_profile/             # Funcionalidade de perfil de usuário
│       ├── data/
│       │   ├── models/           
│       │   ├── datasources/      
│       │   └── repositories/     
│       ├── domain/
│       │   ├── entities/         
│       │   ├── usecases/         
│       │   └── repositories/     
│       └── presentation/
│           ├── pages/            # Exibição do perfil, edição de dados
│           └── controllers/      # Controladores de estado do perfil
