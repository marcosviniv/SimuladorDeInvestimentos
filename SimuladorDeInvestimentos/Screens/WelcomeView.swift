import SwiftUI

struct WelcomeView: View {

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
                    VStack(alignment: .center, spacing: AppSpacing.contentSpacing) {
                        RoundedRectangle(cornerRadius: AppSpacing.largeCornerRadius)
                            .fill(AppColors.primaryGreen)
                            .frame(width: AppSpacing.headerIconSize, height: AppSpacing.headerIconSize)
                            .overlay(
                                Image(systemName: "brazilianrealsign.bank.building.fill")
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundStyle(AppColors.iconForeground)
                            )

                        Text("Simulador de Investimentos")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(AppColors.primaryText)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)

                        Text("Descubra quanto seus investimentos podem render com aportes mensais e juros compostos")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(AppColors.secondaryText)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)

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
                                Text("Simulação Inteligente")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundStyle(AppColors.primaryText)

                                Text("Calcule projeções precisas com juros compostos")
                                    .font(.system(size: 14, weight: .light))
                                    .foregroundStyle(AppColors.secondaryText)
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
                            Text("Pronto para começar?")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundStyle(AppColors.primaryText)

                            Text("Configure sua simulação e descubra o potencial dos seus investimentos")
                                .font(.system(size: 16, weight: .light))
                                .foregroundStyle(AppColors.secondaryText)
                                .multilineTextAlignment(.center)

                            NavigationLink {
                                SimulatorView()
                            } label: {
                                HStack(spacing: AppSpacing.cardSpacing) {
                                    Image(systemName: "checkmark.circle.fill")
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
                    .padding(.top, AppSpacing.topPadding)
                    .padding(.bottom, AppSpacing.screenPadding)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
