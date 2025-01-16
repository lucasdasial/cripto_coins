# Cripto Coins 🪙
Uma aplicação para acompanhar e pesquisar informações sobre criptomoedas em tempo real.

---

## Funcionalidades
- Pesquisa de criptomoedas.
- Acompanhamento de preços e dados do ativo.
- Gráfico de histórico de preços.
- Gerenciamento de favoritos


---

## Configuração do Projeto 

Siga os passos abaixo para configurar e executar o projeto:

### 1. Pré-requisitos
Antes de iniciar, certifique-se de que o seguinte está configurado no seu ambiente:
- **Flutter**: Siga as instruções para instalar o Flutter na [documentação oficial](https://flutter.dev/docs/get-started/install).
- **Dispositivo Android ou Emulador**: Um dispositivo físico ou emulador configurado para rodar o aplicativo.

### 2. Obtenha uma chave da API
Para utilizar a API da CoinGecko, será necessário gerar uma chave de API:
1. Acesse a [documentação da CoinGecko](https://docs.coingecko.com/reference/setting-up-your-api-key).
2. Siga as instruções para gerar sua `API_KEY`.

### 3. Configure o arquivo `.env`
1. No diretório do projeto, localize o arquivo modelo `.env.example`.
2. Crie uma cópia desse arquivo e renomeie para `.env`.
3. No arquivo `.env`, adicione sua chave da API no formato abaixo:
```env
   API_KEY=sua_chave_api_aqui
````
### 4. Instale as dependências do projeto
Abra o terminal na raiz do projeto e execute o seguinte comando para instalar as dependências necessárias:
```DART
flutter pub get
```

### 5. Inicie o aplicativo
Certifique-se de que um emulador Android ou dispositivo físico está conectado. Em seguida, execute o seguinte comando para iniciar o aplicativo:
```DART
flutter run
```
---

### 6. Gerar arquivo .apk
Para compilar a aplicação e gerar o arquivo .apk em modo debug, utilize:
```DART
flutter build apk --debug 
```

O arquivo pode ser encontrado em: `build\app\outputs\apk\debug\app-debug.apk`  
Caso prefira você pode baixar o arquivo no seguinte link: [app-download](https://drive.google.com/file/d/1ArgJj5ItY4PpENbOTT4gscFtMV3ER29I/view?usp=sharing).
