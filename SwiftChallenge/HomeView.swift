//
//  HomeView.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            // Fondo degradado
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.804, green: 0.878, blue: 0.788).opacity(20), Color.white]),
                           startPoint: .top, endPoint: .center)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    HomeView()
}
