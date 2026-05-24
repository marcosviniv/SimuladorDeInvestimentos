# Simulador de Investimentos

Aplicativo iOS feito em SwiftUI para simular a evolução de um investimento com valor inicial, aportes mensais, taxa anual de juros e tempo em anos.

## Funcionalidades

- Tela inicial com apresentação do simulador.
- Formulário para informar:
  - valor inicial;
  - aporte mensal;
  - taxa de juros ao ano;
  - tempo de investimento em anos.
- Cálculo mês a mês usando juros compostos.
- Resultado com:
  - valor final acumulado;
  - total investido;
  - lucro obtido;
  - resumo por ano.
- Formatação de valores em moeda brasileira.

## Tecnologias

- Swift
- SwiftUI
- Xcode
- MVVM

## Estrutura

```text
SimuladorDeInvestimentos/
├── Helpers/
│   ├── AppColors.swift
│   └── AppSpacing.swift
├── Models/
│   └── ResultadoSimulacao.swift
├── Screens/
│   ├── WelcomeView.swift
│   ├── SimulatorView.swift
│   └── ResultView.swift
├── ViewModels/
│   └── SimulatorViewModel.swift
├── Assets.xcassets
└── SimuladorDeInvestimentosApp.swift
```

## Como Rodar

1. Abra o projeto no Xcode.
2. Selecione um simulador iOS.
3. Execute com `Cmd + R`.

## Como o Cálculo Funciona

O simulador converte a taxa anual em taxa mensal equivalente:

```swift
let taxaMensal = pow(1 + taxaAnual, 1.0 / 12.0) - 1
```

Depois simula o saldo mês a mês:

```swift
saldo += aporteMensal
saldo *= (1 + taxaMensal)
```

A cada 12 meses, o app salva um item no resumo anual.

## Status

Projeto em desenvolvimento, com fluxo principal de simulação e tela de resultado implementados.
