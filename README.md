# BirdBites

**BirdBites** is a smart application developed as a final project for the **Microcontrollers and Microprocessors** course. Designed to monitor and enhance interaction with automatic bird feeders, the app provides real-time status updates and integrates advanced AI features to recognize and inform users about bird species visiting the feeder.

> 🛠️ Developed by **Melissa Guedes**, **Bianca Oliveira**, and **Izadora Montenegro**

---

## 🐦 Project Overview

BirdBites combines hardware integration, machine learning, and artificial intelligence to create a modern and educational bird-watching experience. It allows users to:

- 📊 **Monitor feeder status**: Get real-time data on food levels, usage, and refill times.  
- 🧠 **Identify bird species**: A Core ML model trained with Create ML recognizes birds from photos.  
- 💬 **Learn more with Gemini AI**: Once a bird is identified, an integrated Gemini AI assistant provides additional species details.  
- 🌐 **IoT Communication**: Uses the **MQTT protocol** to communicate efficiently between the app and the feeder hardware.

---

## 🎯 Key Features

- **Feeder Monitoring**  
  Displays live data from the feeder (e.g., food availability), transmitted via MQTT from sensors connected to microcontrollers.

- **Bird Recognition**  
  Core ML model classifies bird species locally on-device, trained with a curated dataset in **Create ML**.

- **AI-Assisted Information**  
  The app connects to **Gemini AI** to provide users with interesting facts, behaviors, and habitats of the identified species.

- **Built with Swift**  
  Developed using Swift and SwiftUI for an intuitive and responsive user interface.

---

## 🧰 Technologies Used

- **Swift / SwiftUI** — For developing the iOS application  
- **Core ML** — To run the on-device bird classification model  
- **Create ML** — Used to train the bird species recognition model  
- **Gemini AI API** — Integrated to enrich the experience with dynamic bird information  
- **MQTT Protocol** — For efficient, lightweight communication between feeder hardware and the app  

---
