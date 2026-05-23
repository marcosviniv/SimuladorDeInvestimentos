//
//  ContentView.swift
//  SimuladorDeInvestimentos
//
//  Created by Marcos Vinícius Vieira on 23/05/26.
//

import SwiftUI

struct WellcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [Color.green.opacity(0.2), Color.white],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing)
                
                ScrollView {
                    VStack(alignment: .center, spacing: 12){
                        Rectangle()
                            .fill(
                                Color.green
                            )
                            .cornerRadius(20)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "brazilianrealsign.bank.building.fill")
                                    .font(.system(size: 40, weight: .bold))
                                    .foregroundStyle(Color.white)
                            )
                        Spacer()
                        Text("Simulador de\nInvestimentos")
                            .font(.system(size: 28, weight: .bold))
                            .foregroundStyle(Color.primary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("Descubra quanto seus investimentos\npodem render com aportes mensais e juros\ncompostos")
                            .font(.system(size: 20, weight: .light))
                            .foregroundStyle(Color.secondary)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(10)
                        
                        HStack(alignment: .top, spacing: 18) {
                            Rectangle()
                                .fill(
                                    Color.green
                                )
                                .cornerRadius(12)
                                .frame(width: 48, height: 48)
                                .overlay(
                                    Image(systemName: "dollarsign.square.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(Color.white)
                                )
                    
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Simulação Inteligente")
                                    .font(.system(size: 22, weight: .bold))
                                    .foregroundStyle(Color.primary)
                                Text("Calcule projeções precisas com juros compostos")
                                    .font(.system(size: 14, weight: .light))
                            }
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 10) {
                            Text("Pronto para começar?")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundStyle(Color.primary)
                            
                            Text("Configure sua simulação e descubra o potencial dos seus investimentos")
                                .font(.system(size: 16, weight: .light))
                                .multilineTextAlignment(.center)
                            
                            NavigationLink {
                                SimulatorView()
                            } label: {
                                HStack {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundStyle(Color.white)
                                    Text("Começar Simulação")
                                        .font(.system(size: 18, weight: .bold))
                                        .foregroundStyle(Color.white)
                                }
                                .padding(10)
                                .frame(maxWidth: .infinity)
                                .frame(height: 64)
                                .background(Color.green)
                                .cornerRadius(14)
                                
                            }
                            .buttonStyle(.plain)
                            .padding(20)
                        }
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(.white)
                        .cornerRadius(20)
                        .padding(24)
                        
                    }
                    .padding(.top, 100)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    WellcomeView()
}
