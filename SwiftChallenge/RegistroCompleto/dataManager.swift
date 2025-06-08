import Foundation
import Combine

@MainActor
class MLDataManager: ObservableObject {
    static let shared = MLDataManager()
    
    @Published var inputData = InputData()
    @Published var isLoading = false
    @Published var lastPrediction: MLResponse?
    @Published var errorMessage: String?
    
    private let apiURL = "https://diabetes-clustering.onrender.com/predict"
    
    private init() {}
    
    // Update specific fields from different views
    func updateHighBP(_ value: Bool) {
        inputData.HighBP = value
        clearPreviousResults()
    }
    
    func updateHighChol(_ value: Bool) {
        inputData.HighChol = value
        clearPreviousResults()
    }
    
    func updateGenHlth(_ value: Int) {
        inputData.GenHlth = value
        clearPreviousResults()
    }
    
    func updateSex(_ value: Int) {
        inputData.Sex = value
        clearPreviousResults()
    }
    
    func updateDiabetes(_ value: Bool) {
        inputData.Diabetes = value
        clearPreviousResults()
    }
    
    func updateAge(_ value: Int) {
        inputData.Age = value
        clearPreviousResults()
    }
    
    func updateBMI(_ value: Int) {
        inputData.BMI = value
        clearPreviousResults()
    }
    
    private func clearPreviousResults() {
        lastPrediction = nil
        errorMessage = nil
    }
    
    // Reset all data
    func resetData() {
        inputData = InputData()
        lastPrediction = nil
        errorMessage = nil
    }
    
    // Send data to ML model API
    func predictCluster() async {
        guard inputData.isComplete() else {
            DispatchQueue.main.async {
                self.errorMessage = "Please fill all required fields"
            }
            return
        }
        
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = nil
        }
        
        do {
            let prediction = try await performPrediction()
            DispatchQueue.main.async {
                self.lastPrediction = prediction
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
    
    private func performPrediction() async throws -> MLResponse {
        guard let url = URL(string: apiURL) else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let requestBody = inputData.toDictionary()
        request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let mlResponse = try JSONDecoder().decode(MLResponse.self, from: data)
        return mlResponse
    }
}

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError:
            return "Failed to decode response"
        }
    }
}
