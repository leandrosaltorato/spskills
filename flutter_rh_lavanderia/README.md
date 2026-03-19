## Tecnologias
- Flutter
## Tutorial para um novo projeto com lista
#### 1 Iniciar um novo projeto
- CTRL + Shift + P, Flutter: new Project, Empty ..., escoha a pasta, e coloque o nome de **lavanderia**.
- Crie uma pasta /assets e coloque as imagens que serão utilizadas.
- Altere o arquivo **pubspec.yaml**
```yaml
flutter:
  uses-material-design: true
  assets:
    - assets/
    - assets/dados/
```
#### 2 Crie a estrutura de pastas a seguir
```
assets
    dados
        funcionarios.json
    lavanderia.jpg
lib
    main.dart
    ui
        home.dart
        lista.dart
```

## Passo a passo para testar este códico
- 1 Clone este repositório.
- 2 Abra com VsCode, instale as dependências e execute o lib/main.dart
```bash
flutter pub get
flutter run
```

```json
[
  {
    "id": 1,
    "nome": "Mariana Souza",
    "cargo": "Atendente",
    "salario": 1850.50,
    "dataContatacao": "2022-03-15"
  },
  {
    "id": 2,
    "nome": "Carlos Pereira",
    "cargo": "Lavador",
    "salario": 2100.00,
    "dataContatacao": "2021-11-02"
  },
  {
    "id": 3,
    "nome": "Fernanda Lima",
    "cargo": "Passadeira",
    "salario": 1950.75,
    "dataContatacao": "2023-01-20"
  },
  {
    "id": 4,
    "nome": "João Batista",
    "cargo": "Gerente",
    "salario": 3500.00,
    "dataContatacao": "2020-08-10"
  },
  {
    "id": 5,
    "nome": "Aline Rocha",
    "cargo": "Auxiliar de Lavanderia",
    "salario": 1700.00,
    "dataContatacao": "2024-02-05"
  },
  {
    "id": 6,
    "nome": "Ricardo Alves",
    "cargo": "Motorista",
    "salario": 2200.30,
    "dataContatacao": "2022-07-18"
  },
  {
    "id": 7,
    "nome": "Patrícia Gomes",
    "cargo": "Atendente",
    "salario": 1820.00,
    "dataContatacao": "2023-06-12"
  },
  {
    "id": 8,
    "nome": "Eduardo Martins",
    "cargo": "Técnico de Manutenção",
    "salario": 2800.90,
    "dataContatacao": "2021-04-25"
  },
  {
    "id": 9,
    "nome": "Juliana Freitas",
    "cargo": "Passadeira",
    "salario": 2000.00,
    "dataContatacao": "2022-09-30"
  },
  {
    "id": 10,
    "nome": "Lucas Ribeiro",
    "cargo": "Auxiliar de Lavanderia",
    "salario": 1750.60,
    "dataContatacao": "2024-05-14"
  }
]
```
