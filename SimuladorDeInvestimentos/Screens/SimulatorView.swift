import SwiftUI

struct SimulatorView: View {
    
    @ObservedObject var viewModel: SimulatorViewModel
    @State private var mostrarResultado = false
    
    var body: some View {
        ZStack {
                LinearGradient(
                    colors: [AppColors.primaryGreenSoft, AppColors.screenBackground],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                ScrollView {
                    VStack (alignment: .center, spacing: AppSpacing.cardSpacing) {
                        Text("Configure sua Simulação")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(AppColors.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            
                       
                        Text("Preencha os dados para calcular sua projeção")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(AppColors.secondaryText)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 0)
                            .padding(.horizontal)
                       
                        
                        VStack(alignment: .leading, spacing: AppSpacing.contentSpacing) {
                            HStack {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(AppColors.primaryGreen)
                                
                                Text("Valor inicial")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(AppColors.primaryText)
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 6) {
                                    Text("R$")
                                        .foregroundStyle(AppColors.primaryText)

                                    TextField("0,00", text: $viewModel.valorInicial)
                                        .keyboardType(.decimalPad)
                                }
                                .padding(.horizontal, AppSpacing.cardSpacing)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .background(AppColors.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                                        .stroke(AppColors.cardBorder, lineWidth: 1)
                                )
                                .cornerRadius(AppSpacing.smallCornerRadius)

                                Text("Valor que você já possui para investir")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(AppColors.secondaryText)
                            }
                            
                            HStack {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(AppColors.primaryGreen)
                                
                                Text("Aporte mensal")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(AppColors.primaryText)
                                Spacer()
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 6) {
                                    Text("R$")
                                        .foregroundStyle(AppColors.primaryText)

                                    TextField("0,00", text: $viewModel.aporteMensal)
                                        .keyboardType(.decimalPad)
                                }
                                .padding(.horizontal, AppSpacing.cardSpacing)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .background(AppColors.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                                        .stroke(AppColors.cardBorder, lineWidth: 1)
                                )
                                .cornerRadius(AppSpacing.smallCornerRadius)

                                Text("Valor que você investirá todos os meses")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(AppColors.secondaryText)
                            }
                            
                            HStack {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(AppColors.primaryGreen)
                                
                                Text("Taxa de juros (% ao ano)")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(AppColors.primaryText)
                                Spacer()
                            }
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 6) {
                                    TextField("12,00", text: $viewModel.taxaJurosAoAno)
                                        .keyboardType(.decimalPad)
                                    Text("%")
                                        .foregroundStyle(AppColors.primaryText)
                                }
                                .padding(.horizontal, AppSpacing.cardSpacing)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .background(AppColors.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                                        .stroke(AppColors.cardBorder, lineWidth: 1)
                                )
                                .cornerRadius(AppSpacing.smallCornerRadius)

                                Text("Taxa anual esperada (ex: CDI, Tesouro Direto)")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(AppColors.secondaryText)
                            }
                            
                            HStack {
                                Image(systemName: "arrow.left.circle.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(AppColors.primaryGreen)
                                
                                Text("Tempo (anos)")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundStyle(AppColors.primaryText)
                                Spacer()
                            }
                            
                            VStack(alignment: .leading, spacing: 6) {
                                HStack(spacing: 6) {
                                    TextField("5", text: $viewModel.tempoDeInvestimento)
                                        .keyboardType(.decimalPad)
                                    Text("anos")
                                        .foregroundStyle(AppColors.secondaryText)
                                }
                                .padding(.horizontal, AppSpacing.cardSpacing)
                                .padding(.vertical, 14)
                                .frame(maxWidth: .infinity, minHeight: 52)
                                .background(AppColors.cardBackground)
                                .overlay(
                                    RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                                        .stroke(AppColors.cardBorder, lineWidth: 1)
                                )
                                .cornerRadius(AppSpacing.smallCornerRadius)

                                Text("Por quanto tempo você quer investir")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundStyle(AppColors.secondaryText)
                            }
                            
                            Button(action: {
                                viewModel.calcularSimulacao()
                                mostrarResultado = viewModel.resultado != nil
                            }, label: {
                                HStack(spacing: AppSpacing.cardSpacing) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(AppColors.iconForeground)

                                    Text("Calcular Investimento")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(AppColors.iconForeground)
                                }
                                .padding(AppSpacing.cardSpacing)
                                .frame(maxWidth: .infinity)
                                .frame(height: AppSpacing.buttonHeight)
                                .background(AppColors.primaryGreen)
                                .cornerRadius(AppSpacing.mediumCornerRadius)
                            })
                        }
                        .padding()
                    }
                    .padding(.top, AppSpacing.cardSpacing)
                    .padding(.bottom, AppSpacing.screenPadding)
                }
            }
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(isPresented: $mostrarResultado) {
            if let resultado = viewModel.resultado {
                ResultView(resultado: resultado)
            }
        }
    }
}

struct SimulatorView_Previews: PreviewProvider {
    static var previews: some View {
        SimulatorView(viewModel: SimulatorViewModel())
    }
}
