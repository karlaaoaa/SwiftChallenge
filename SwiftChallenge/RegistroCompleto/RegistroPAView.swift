//
//  RegistroPAView.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import SwiftUI

struct RegistroPAView: View {
    @State private var peso = 70
    @State private var estatura = 170
    
    let limitePeso = Array(30...250)
    let limiteEstatura = Array(100...220)
    
    var body: some View {
        NavigationStack {

            ZStack {
                // Fondo degradado
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.804, green: 0.878, blue: 0.788).opacity(20), Color.white]),
                               startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // Título
                    Text("Selecciona tu peso y estatura")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(20)
                        .multilineTextAlignment(.center)
                    
                    // Campos
                    Picker("Peso", selection: $peso) {
                        ForEach(limitePeso, id: \.self) { peso_ in
                            Text("\(peso_) kg")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 100)
                    .clipped()


                    Divider().padding(.vertical)

                    Picker("Estatura", selection: $estatura) {
                        ForEach(limiteEstatura, id: \.self) { estatura_ in
                            Text("\(estatura_) cm")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(height: 100)
                    .clipped()
                    
                    NavigationLink(destination: RegistroPAView()) {
                        Text("Siguiente")
                            .foregroundColor(.black)
                            .fontWeight(.none)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.6, green: 0.8, blue: 0.65).opacity(0.6))
                            .cornerRadius(10)
                            .padding(.horizontal, 60)
                            .padding(25)
                    }
                    
                }
                .padding(.horizontal, 36)
            }
        }
    }
}


#Preview {
    RegistroPAView()
}
