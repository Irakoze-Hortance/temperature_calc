
---

# 🌡️ Temperature Converter App

This Flutter application allows users to convert temperatures between **Fahrenheit and Celsius** using simple and clear UI, suitable for both **portrait and landscape orientations**. The app maintains a **conversion history** for user reference.

---

## 📱 Features

* Convert:

  * **Celsius → Fahrenheit**
  * **Fahrenheit → Celsius**
* Easy toggle between conversion modes (only one mode can be selected at any time).
* Accepts **numeric input** for temperature.
* Outputs **converted result rounded to 2 decimal places**.
* Adds each conversion to a scrollable **history list**.
* Fully responsive layout for **portrait and landscape** views.

---

## 🧮 Conversion Formulae

* **Fahrenheit to Celsius**:

  $$
  °C = (°F - 32) \times \frac{5}{9}
  $$

* **Celsius to Fahrenheit**:

  $$
  °F = °C \times \frac{9}{5} + 32
  $$

---

## 🛠️ Built With

* [Flutter](https://flutter.dev/)
* Dart programming language
* Flutter official widgets:

  * `TextField`
  * `RadioListTile`
  * `ElevatedButton`
  * `Text`
  * `ListView`
  * `MediaQuery` for responsive layout

---

## 🚀 Getting Started

1. **Clone the repository**:

   ```bash
   git clone https://github.com/Irakoze-Hortance/temperature_calc
   cd temperature_calc
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:

   ```bash
   flutter run
   ```

---

## 🧪 Sample Interaction

* User inputs `3.5` and selects `Celsius → Fahrenheit`

  * Output: `38.30`
  * History: `C to F: 3.5 => 38.3`

* User inputs `55.0` and selects `Fahrenheit → Celsius`

  * Output: `12.78`
  * History: `F to C: 55.0 => 12.78`

---




