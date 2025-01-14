//
//  MQTTManager.swift
//  birdBites
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/01/25.
//

import Foundation
import CocoaMQTT

class MQTTManager: ObservableObject {
    @Published var receivedData: ComedouroData?

    private var mqttClient: CocoaMQTT?

    init() {
        configureMQTT()
    }

    public func configureMQTT() {
        let clientID = "iOSClient-\(UUID().uuidString)"
        mqttClient = CocoaMQTT(clientID: clientID, host: "test.mosquitto.org", port: 1883)
        mqttClient?.username = nil
        mqttClient?.password = nil
        mqttClient?.keepAlive = 60
        mqttClient?.delegate = self
        mqttClient?.connect()
    }

    func publish(message: String, topic: String) {
        mqttClient?.publish(topic, withString: message, qos: .qos1)
    }

    func disconnect() {
        mqttClient?.disconnect()
    }
}

extension MQTTManager: CocoaMQTTDelegate {
    func mqtt(_ mqtt: CocoaMQTT, didConnectAck ack: CocoaMQTTConnAck) {
        if ack == .accept {
            print("Conectado ao broker MQTT com sucesso!")
            mqtt.subscribe("STATUS_COMEDOURO")
        } else {
            print("Falha ao conectar ao broker: \(ack)")
        }
    }

    func mqtt(_ mqtt: CocoaMQTT, didReceiveMessage message: CocoaMQTTMessage, id: UInt16) {
        if let jsonString = message.string {
            print("Mensagem recebida: \(jsonString)")
            if let data = try? JSONDecoder().decode(ComedouroData.self, from: Data(jsonString.utf8)) {
                DispatchQueue.main.async {
                    self.receivedData = data
                }
            } else {
                print("Erro ao decodificar os dados recebidos.")
            }
        }
    }

    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics topics: [String]) {
        print("Inscrito nos tópicos: \(topics)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didUnsubscribeTopics topics: [String]) {
        print("Cancelou inscrição nos tópicos: \(topics)")
    }

    func mqttDidDisconnect(_ mqtt: CocoaMQTT, withError err: Error?) {
        print("Desconectado do broker MQTT: \(err?.localizedDescription ?? "Sem erro")")
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishMessage message: CocoaMQTTMessage, id: UInt16) {
        print("Mensagem publicada: \(message.string ?? "Sem conteúdo")")
    }

    func mqtt(_ mqtt: CocoaMQTT, didPublishAck id: UInt16) {
        print("Publicação confirmada para mensagem com ID \(id)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didStateChangeTo state: CocoaMQTTConnState) {
        print("Mudança de estado: \(state)")
    }

    func mqtt(_ mqtt: CocoaMQTT, didReceive trust: SecTrust, completionHandler: @escaping (Bool) -> Void) {
        completionHandler(true)
    }

    func mqttDidPing(_ mqtt: CocoaMQTT) {
        print("Ping enviado.")
    }

    func mqttDidReceivePong(_ mqtt: CocoaMQTT) {
        print("Pong recebido.")
    }
    
    
    func mqtt(_ mqtt: CocoaMQTT, didSubscribeTopics success: NSDictionary, failed: [String]) {
        if failed.count > 0 {
            print("Falha ao se inscrever nos tópicos: \(failed)")
        }
        if success.count > 0 {
            print("Inscrito com sucesso nos tópicos: \(success)")
        }
    }
}
