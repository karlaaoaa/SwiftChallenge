//
//  RegistroCPView.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//
//Cambios re importantesptm

import SwiftUI

struct RegistroCondicionesView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var colesterolAlto: String = ""
    @State private var presionAlta: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color(red: 0.804, green: 0.878, blue: 0.788).opacity(20), Color.white]),
                    startPoint: .top,
                    endPoint: .center
                )
                .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    
                    
                    Text("Condiciones de salud")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Pregunta 1
                    VStack(spacing: 12) {
                        Text("¿Tienes colesterol alto?")
                            .font(.title3)
                            .fontWeight(.semibold)

                        HStack(spacing: 40) {
                            OpcionBoton(titulo: "Sí", seleccionado: colesterolAlto == "Sí") {
                                colesterolAlto = "Sí"
                            }
                            OpcionBoton(titulo: "No", seleccionado: colesterolAlto == "No") {
                                colesterolAlto = "No"
                            }
                        }
                    }
                    
                    // Pregunta 2
                    VStack(spacing: 12) {
                        Text("¿Tienes presión arterial alta?")
                            .font(.title3)
                            .fontWeight(.semibold)

                        HStack(spacing: 40) {
                            OpcionBoton(titulo: "Sí", seleccionado: presionAlta == "Sí") {
                                presionAlta = "Sí"
                            }
                            OpcionBoton(titulo: "No", seleccionado: presionAlta == "No") {
                                presionAlta = "No"
                            }
                        }
                    }

                    NavigationLink(destination: RegistroGeneroView()) {
                        Text("Siguiente")
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(red: 0.6, green: 0.8, blue: 0.65).opacity(0.6))
                            .cornerRadius(10)
                            .padding(.horizontal, 80)
                    }
                }
                .padding()
            }
        }
    }
}

// Reutilizable para botones de opción
struct OpcionBoton: View {
    let titulo: String
    let seleccionado: Bool
    let accion: () -> Void
    
    var body: some View {
        Button(action: accion) {
            Text(titulo)
                .font(.title3)
                .padding()
                .frame(width: 80)
                .background(seleccionado ? Color(red: 0.6, green: 0.8, blue: 0.65).opacity(0.6) : Color.gray.opacity(0.2))
                .foregroundColor(.black)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(seleccionado ? Color.green : Color.clear, lineWidth: 2)
                )
        }
    }
}

#Preview {
    RegistroCondicionesView()
}

