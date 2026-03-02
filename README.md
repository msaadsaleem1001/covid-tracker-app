# 🦠 COVID-19 Tracker App

A production-ready COVID-19 Tracker application built with **Flutter**.
The app provides real-time global and country-specific pandemic statistics using a public REST API.

---

## 📌 Overview

This application fetches and displays live COVID-19 statistics including:

- Global aggregated data
- Country-wise statistics
- Detailed metrics (Total, Active, Recovered, Deaths, Critical)
- Real-time search functionality

---

## 🏗 Architecture

The app is structured using a modular approach:

lib/
├── models/        # Data models
├── services/      # API layer
├── view/          # UI screens
└── main.dart      # Entry point

- Separation of concerns
- API abstraction layer
- Model-based JSON parsing

---

## 🛠 Tech Stack

- Flutter
- Dart
- REST API Integration
- HTTP package
- State Management (SetState())

---

## 🌐 API Endpoints

Global Data:
https://disease.sh/v3/covid-19/all

Country Data:
https://disease.sh/v3/covid-19/countries

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Emulator or Physical Device

Check setup:

flutter doctor

---

### Installation

Clone the repository:

git clone https://github.com/msaadsaleem1001/covid-tracker-app.git

Navigate into project directory:

cd covid-tracker-app

Install dependencies:

flutter pub get

Run the app:

flutter run

---

## 📈 Future Improvements

- Chart-based visualization
- Vaccination data integration
- Dark mode support
- Offline caching
- Pagination for country data

---

## 👨‍💻 Author

Saad Saleem 
https://github.com/msaadsaleem1001
