import Foundation
import Combine

final class SimulatorViewModel: ObservableObject {
    
    @Published var valorInicial: String = ""
    @Published var aporteMensal: String = ""
    @Published var taxaJurosAoAno: String = ""
    @Published var tempoDeInvestimento: String = ""
}
