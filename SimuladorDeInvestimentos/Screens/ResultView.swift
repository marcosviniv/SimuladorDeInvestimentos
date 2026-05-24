import SwiftUI

struct ResultView: View {

    @Environment(\.dismiss) private var dismiss
    let resultado: ResultadoSimulacao

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [AppColors.primaryGreenSoft, AppColors.screenBackground],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 0) {
                headerView
                
                ScrollView {
                    VStack(spacing: AppSpacing.contentSpacing){
                        totalAcumuladoCard
                        resumeCard
                        yearlySummaryCard
                    }
                    .padding()
                }
               
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }

    private var headerView: some View {
        HStack(spacing: AppSpacing.cardSpacing) {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(AppColors.primaryText)
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.plain)

            RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                .fill(AppColors.primaryGreen)
                .frame(width: 32, height: 32)
                .overlay(
                    Image(systemName: "chart.line.uptrend.xyaxis")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(AppColors.iconForeground)
                )

            Text("Resultado da Simulação")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(AppColors.primaryText)

            Spacer()
        }
        .padding(.horizontal, AppSpacing.screenPadding)
        .frame(maxWidth: .infinity)
        .frame(height: 72)
        .background(AppColors.cardBackground)
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(AppColors.cardBorder)
                .frame(height: 1)
        }
    }
    
    private var totalAcumuladoCard: some View {
        VStack (spacing: AppSpacing.cardSpacing) {
           
            Image(systemName: "trophy.fill")
                .font(Font.system(size: 32, weight: .bold))
                .foregroundStyle(AppColors.primaryGreen)
                .padding(10)
            
            Text("Valor final acumulado")
                .font(Font.system(size: 16, weight: .semibold))
                .foregroundStyle(AppColors.primaryText)
                
            Text(resultado.valorFinal)
                .font(Font.system(size: 32, weight: .bold))
                .foregroundStyle(AppColors.primaryText)
            Text("após \(resultado.anos) anos de investimento")
                .font(Font.system(size: 14, weight: .semibold))
                .foregroundStyle(AppColors.secondaryText)
        }
        .padding(AppSpacing.cardPadding)
        .frame(maxWidth: .infinity, alignment: .center)
        .background(AppColors.cardBackground)
        .cornerRadius(AppSpacing.mediumCornerRadius)
    }
    
    private var resumeCard: some View {
        HStack(spacing: AppSpacing.cardSpacing) {
            resumeItemCard(
                icon: "banknote.fill",
                title: "Total investido",
                value: resultado.valorInvestido,
                color: .blue
            )
            
            resumeItemCard(
                icon: "chart.line.uptrend.xyaxis",
                title: "Lucro obtido",
                value: resultado.lucro,
                color: AppColors.primaryGreen
            )
        }
    }
    
    private var yearlySummaryCard: some View {
        VStack(alignment: .leading, spacing: AppSpacing.cardSpacing) {
            HStack {
                Image(systemName: "list.bullet")
                    .foregroundStyle(AppColors.primaryGreen)

                Text("Resumo por Ano")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(AppColors.primaryText)
            }

            VStack(spacing: 0) {
                ForEach(resultado.resumoAnual) { resultadoAnual in
                    yearlySummaryRow(resultadoAnual)
                }
            }
        }
        .padding(AppSpacing.cardPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(AppColors.cardBackground)
        .cornerRadius(AppSpacing.mediumCornerRadius)
    }
    
    private func resumeItemCard(icon: String, title: String, value: String, color: Color) -> some View {
        VStack(spacing: 10) {
            Image(systemName: icon)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(color)
                .frame(width: 38, height: 38)
                .background(color.opacity(0.15))
                .cornerRadius(AppSpacing.smallCornerRadius)
            
            Text(title)
                .font(.system(size: 13, weight: .regular))
                .foregroundStyle(AppColors.primaryText)
                .lineLimit(1)
                .minimumScaleFactor(0.9)
            
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(AppColors.primaryText)
                .lineLimit(1)
                .minimumScaleFactor(0.8)
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 10)
        .frame(maxWidth: .infinity)
        .background(AppColors.cardBackground)
        .cornerRadius(AppSpacing.mediumCornerRadius)
    }
    
    private func yearlySummaryRow(_ resultadoAnual: ResultadoAnual) -> some View {
        HStack {
            Text("Ano \(resultadoAnual.ano)")
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(AppColors.primaryText)

            Spacer()

            Text(resultadoAnual.valorFormatado)
                .font(.system(size: 15, weight: .bold))
                .foregroundStyle(AppColors.primaryText)
        }
        .padding(.vertical, 14)
    }
}

#Preview {
    ResultView(resultado: .preview)
}
