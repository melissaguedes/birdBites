//
//  ContentView.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var mqttManager = MQTTManager()

    var body: some View {
        VStack {
            Text("Status do Comedouro")
                .font(.largeTitle)
                .padding()

            if let data = mqttManager.receivedData {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Luminosidade: \(data.luminosidade) lux")
                    Text("Temperatura Externa: \(data.temperaturaExterno) °C")
                    Text("Umidade Externa: \(data.umidadeExterno) %")
                    Text("Temperatura Interna: \(data.temperaturaInterno) °C")
                    Text("Umidade Interna: \(data.umidadeInterno) %")
                    Text("Quantidade de Comida: \(data.quantidadeComida) %")
                }
                .padding()
            } else {
                Text("Aguardando dados...")
                    .foregroundColor(.gray)
                    .padding()
            }
        }
        .onAppear {
            mqttManager.configureMQTT()
        }
        .onDisappear {
            mqttManager.disconnect()
        }
    }
}

#Preview {
    ContentView()
}
