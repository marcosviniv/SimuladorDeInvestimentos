import Foundation

struct ResultadoSimulacao {
    let valorFinal: String
    let valorInvestido: String
    let lucro: String
    let anos: Int
    let resumoAnual: [ResultadoAnual]
}

struct ResultadoAnual: Identifiable {
    let id = UUID()
    let ano: Int
    let valorFormatado: String
}

extension ResultadoSimulacao {
    static let preview = ResultadoSimulacao(
        valorFinal: "R$ 156.438,92",
        valorInvestido: "R$ 65.000,00",
        lucro: "R$ 91.438,92",
        anos: 10,
        resumoAnual: [
            ResultadoAnual(ano: 1, valorFormatado: "R$ 12.750,00"),
            ResultadoAnual(ano: 2, valorFormatado: "R$ 27.300,00"),
            ResultadoAnual(ano: 3, valorFormatado: "R$ 43.836,00"),
            ResultadoAnual(ano: 4, valorFormatado: "R$ 62.496,32"),
            ResultadoAnual(ano: 5, valorFormatado: "R$ 83.435,88")
        ]
    )
}
