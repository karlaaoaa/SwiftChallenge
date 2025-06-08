//
//  RegistroFechaView.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import SwiftUI

struct RegistroGeneroView: View {
    @State private var genero = ""

    var body: some View {
        NavigationStack {
            
            ZStack {
                // Fondo degradado
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.804, green: 0.878, blue: 0.788).opacity(20), Color.white]),
                               startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Título
                    Text("Selecciona tu género")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(20)
                        .multilineTextAlignment(.center)
                    
                    // Campos
                    HStack(spacing: 60) {
                        Button(action: {
                            genero = "Masculino"
                        }) {
                            Image(systemName: "figure.stand")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 90)
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(genero == "Masculino" ? Color.gray : Color.clear, lineWidth: 3)
                                )
                        }

                        Button(action: {
                            genero = "Femenino"
                        }) {
                            Image(systemName: "figure.stand.dress")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 90)
                                .padding()
                                .background(Color.white)
                                .foregroundStyle(.black)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(genero == "Femenino" ? Color.gray : Color.clear, lineWidth: 3)
                                )
                        }
                    }
                    
                    NavigationLink(destination: RegistroFechaView()) {
                        Text("Siguiente")
                            .foregroundColor(.black)
                            .fontWeight(.none)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.6, green: 0.8, blue: 0.65).opacity(0.6))
                            .cornerRadius(10)
                            .padding(.horizontal, 80)
                            .padding(15)
                    }
                    
                }
                .padding(.horizontal, 36)
            }
        }
    }
}

#Preview {
    RegistroGeneroView()
}
