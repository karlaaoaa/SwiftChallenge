//
//  RegistroFechaView.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import SwiftUI

struct RegistroFechaView: View {
    @StateObject private var dataManager = MLDataManager.shared
    @State private var birthday = Date()
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                // Fondo degradado
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.804, green: 0.878, blue: 0.788).opacity(20), Color.white]),
                               startPoint: .top, endPoint: .center)
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    // Título
                    Text("Selecciona tu fecha de nacimiento")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(20)
                        .multilineTextAlignment(.center)
                    
                    // Campos
                    DatePicker("Fecha de nacimiento", selection: $birthday, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                        .environment(\.locale, Locale(identifier: "es_ES"))
                    
                    NavigationLink(destination: RegistroPAView()) {
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
        .onAppear {
            // Cargar fecha existente del dataManager si hay una edad guardada
            if let existingAge = dataManager.inputData.Age {
                // Calcular fecha aproximada basada en la edad
                let calendar = Calendar.current
                if let approximateDate = calendar.date(byAdding: .year, value: -existingAge, to: Date()) {
                    birthday = approximateDate
                }
            }
        }
    }
    
    // Función para calcular la edad basada en la fecha de nacimiento
    private func calculateAge(from birthDate: Date) -> Int {
        let calendar = Calendar.current
        let now = Date()
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: now)
        if let age = ageComponents.year {
            dataManager.updateAge(age)
            return age
        } else {
            // Valor por defecto en caso de error
            dataManager.updateAge(0)
            return 0
        }
    }
}
#Preview {
    RegistroFechaView()
}
