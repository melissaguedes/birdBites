//
//  ComedouroData.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import Foundation

struct ComedouroData: Codable {
    let luminosidade: Double
    let temperaturaExterno: Double
    let umidadeExterno: Double
    let temperaturaInterno: Double
    let umidadeInterno: Double
    let quantidadeComida: Int
}
