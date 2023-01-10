# Estudos Flutter Web Navigação 2.0

Esse projeto foi criado com o intuito da realização de estudos sobre a navegação 2.0 do flutter web. O mesmo consiste em um exemplo de trabalho de roteamento da Web flutter com rotas privadas e protegidas junto com parâmetros.

## Pré-requisito 
Flutter 3.3.9 • channel stable • https://github.com/flutter/flutter.git
Framework • revision b8f7f1f986 (7 weeks ago) • 2022-11-23 06:43:51 +0900
Engine • revision 8f2221fbef
Tools • Dart 2.18.5 • DevTools 2.15.0

## Fluxo principal
Existe uma tela de login inicial onde caso o usuário coloque qualquer link direto, caso não esteja autenticado ele é redirecionado para a tela de login. Porém quando o usuário está autenticado ele pode navegar pelo rota direta com ou sem parâmetros, caso a rota exista ele irar para a tela, caso não, irar mostrar um aviso dizendo que a rota não existe. Caso ele navegue por uma rota que exista e passe algum parâmetro o mesmo será exibido na tela.

## Importante
Foi usado para armazenamento de informação do usuário logado o [shared preferences](https://pub.dev/packages/shared_preferences), que armazena no localstorage a informação.


## Getting Started

```flutter
flutter pub get
```
```flutter
flutter build web
```

## Créditos 
Copyright © 2020 [Pushkar Kumar](https://github.com/Pushkar952/Flutter_Web_Navigation2.0/blob/main/README.md ).