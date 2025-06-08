//
//  UsuarioModel.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import Foundation

struct Usuario: Identifiable {
    let id = UUID()
    let user: String
    let password: String
}
