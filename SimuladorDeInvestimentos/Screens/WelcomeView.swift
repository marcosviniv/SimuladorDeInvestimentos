import SwiftUI

struct WelcomeView: View {

    @StateObject private var simulatorViewModel = SimulatorViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [AppColors.primaryGreenSoft, AppColors.screenBackground],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .center, spacing: 20) {
                        RoundedRectangle(cornerRadius: AppSpacing.largeCornerRadius)
                            .fill(AppColors.primaryGreen)
                            .frame(width: AppSpacing.headerIconSize, height: AppSpacing.headerIconSize)
                            .overlay(
                                Image(systemName: "brazilianrealsign.bank.building.fill")
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundStyle(AppColors.iconForeground)
                            )

                        Text("Simulador de\nInvestimentos")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundStyle(AppColors.primaryText)
                            .lineSpacing(4)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("Projete seus investimentos com aportes mensais e juros compostos.")
                            .font(.system(size: 17, weight: .regular))
                            .foregroundStyle(AppColors.secondaryText)
                            .lineSpacing(4)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.horizontal, AppSpacing.screenPadding)

                        HStack(alignment: .top, spacing: AppSpacing.iconSpacing) {
                            RoundedRectangle(cornerRadius: AppSpacing.smallCornerRadius)
                                .fill(AppColors.primaryGreen)
                                .frame(width: AppSpacing.featureIconSize, height: AppSpacing.featureIconSize)
                                .overlay(
                                    Image(systemName: "dollarsign.square.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(AppColors.iconForeground)
                                )

                            VStack(alignment: .leading, spacing: AppSpacing.cardSpacing) {
                                Text("Planeje com clareza")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundStyle(AppColors.primaryText)

                                Text("Informe valores, prazo e taxa para visualizar uma projeção do investimento.")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundStyle(AppColors.secondaryText)
                                    .lineSpacing(3)
                            }
                        }
                        .padding(AppSpacing.cardPadding)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(AppColors.cardBackground)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppSpacing.largeCornerRadius)
                                .stroke(AppColors.cardBorder, lineWidth: 1)
                        )
                        .cornerRadius(AppSpacing.largeCornerRadius)
                        .padding(.horizontal, AppSpacing.screenPadding)

                        VStack(alignment: .center, spacing: AppSpacing.cardSpacing) {
                            Text("Vamos começar?")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(AppColors.primaryText)

                            Text("Leva menos de um minuto para configurar sua simulação.")
                                .font(.system(size: 16, weight: .regular))
                                .foregroundStyle(AppColors.secondaryText)
                                .lineSpacing(3)
                                .multilineTextAlignment(.center)

                            NavigationLink {
                                SimulatorView(viewModel: simulatorViewModel)
                            } label: {
                                HStack(spacing: AppSpacing.cardSpacing) {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(AppColors.iconForeground)

                                    Text("Começar Simulação")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(AppColors.iconForeground)
                                }
                                .padding(AppSpacing.cardSpacing)
                                .frame(maxWidth: .infinity)
                                .frame(height: AppSpacing.buttonHeight)
                                .background(AppColors.primaryGreen)
                                .cornerRadius(AppSpacing.mediumCornerRadius)
                            }
                            .buttonStyle(.plain)
                            .padding(.top, AppSpacing.cardSpacing)
                        }
                        .padding(AppSpacing.cardPadding)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(AppColors.cardBackground)
                        .overlay(
                            RoundedRectangle(cornerRadius: AppSpacing.largeCornerRadius)
                                .stroke(AppColors.cardBorder, lineWidth: 1)
                        )
                        .cornerRadius(AppSpacing.largeCornerRadius)
                        .padding(.horizontal, AppSpacing.screenPadding)
                    }
                    .padding(.top, 32)
                    .padding(.bottom, AppSpacing.screenPadding)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
