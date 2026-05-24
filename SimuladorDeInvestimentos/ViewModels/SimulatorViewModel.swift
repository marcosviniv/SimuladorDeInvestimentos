import Foundation
import Combine

final class SimulatorViewModel: ObservableObject {

    @Published var valorInicial: String = ""
    @Published var aporteMensal: String = ""
    @Published var taxaJurosAoAno: String = ""
    @Published var tempoDeInvestimento: String = ""
    
    @Published var resultado: ResultadoSimulacao?
    
    func calcularSimulacao() {
        let valorInicialConvertido = converterParaDouble(valorInicial)
        let aporteMensalConvertido = converterParaDouble(aporteMensal)
        let taxaJurosConvertida = converterParaDouble(taxaJurosAoAno)
        let tempoConvertido = Int(tempoDeInvestimento) ?? 0
        
        guard tempoConvertido > 0 else {
            resultado = nil
            return
        }
        
        let taxaAnual = taxaJurosConvertida / 100
        let taxaMensal = pow(1 + taxaAnual, 1.0 / 12.0) - 1
        let meses = tempoConvertido * 12
      
        //MARK: Simular mes a mes
        var saldo = valorInicialConvertido
        var resumoAnual: [ResultadoAnual] = []

        for mes in 1...meses {
            saldo += aporteMensalConvertido
            saldo *= (1 + taxaMensal)

            if mes % 12 == 0 {
                let ano = mes / 12

                resumoAnual.append(
                    ResultadoAnual(
                        ano: ano,
                        valorFormatado: formatarMoeda(saldo)
                    )
                )
            }
        }
        
        let valorInvestido = valorInicialConvertido + (aporteMensalConvertido * Double(meses))
        let lucro = saldo - valorInvestido

        resultado = ResultadoSimulacao(
            valorFinal: formatarMoeda(saldo),
            valorInvestido: formatarMoeda(valorInvestido),
            lucro: formatarMoeda(lucro),
            anos: tempoConvertido,
            resumoAnual: resumoAnual
        )
        
        
    }
    
    //MARK: Formatar para Moeda Brasileira
    private func formatarMoeda(_ valor: Double) -> String {
        let formatador = NumberFormatter()
        formatador.numberStyle = .currency
        formatador.locale = Locale(identifier: "pt_BR")
        formatador.minimumFractionDigits = 2
        formatador.maximumFractionDigits = 2

        return formatador.string(from: NSNumber(value: valor)) ?? "R$ 0,00"
    }
    
    
    private func converterParaDouble(_ texto: String) -> Double {
        let textoFinal = texto
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: ".")
        return Double(textoFinal) ?? 0
        
    }
}
