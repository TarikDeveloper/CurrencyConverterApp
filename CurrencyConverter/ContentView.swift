import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State private var inputValue = ""
    @State private var inputCurrencyIndex = 0
    @State private var outputCurrencyIndex = 1
    private let currencies = ["USD", "EUR", "GBP", "CHF", "CAD", "JPY", "RUB", "BRL"]
    
    // Rates are based on USD
    private let rates = [
        [1.00, 0.85, 0.76, 0.88, 1.24, 108.34, 73.70, 6.68, 6.49],
        [1.18, 1.00, 0.89, 1.05, 1.45, 128.03, 87.77, 7.89, 7.76],
        [1.31, 1.12, 1.00, 1.19, 1.64, 145.59, 100.54, 9.08, 8.88],
        [1.13, 0.95, 0.84, 1.00, 1.35, 121.22, 81.69, 7.64, 7.46],
        [0.81, 0.69, 0.61, 0.74, 1.00, 80.18, 55.44, 5.34, 5.21],
        [0.0093, 0.0078, 0.0068, 0.0083, 0.0124, 1.00, 0.67, 0.062, 0.060],
        [0.014, 0.011, 0.009, 0.013, 0.019, 1.48, 1.00, 0.10, 0.096],
        [0.15, 0.13, 0.11, 0.13, 0.19, 16.12, 9.93, 1.00, 0.97]
    ]
    
    private var outputValue: Double {
        let inputAmount = Double(inputValue) ?? 0
        let rate = rates[inputCurrencyIndex][outputCurrencyIndex]
        return inputAmount * rate
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input Value")) {
                    TextField("Value", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Input Currency")) {
                    Picker("Input Currency", selection: $inputCurrencyIndex) {
                        ForEach(currencies.indices, id: \.self) {
                            Text(self.currencies[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Output Currency")) {
                    Picker("Output Currency", selection: $outputCurrencyIndex) {
                        ForEach(currencies.indices, id: \.self) {
                            Text(self.currencies[$0])
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Output Value")) {
                    Text("\(outputValue, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Currency Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
