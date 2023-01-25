import Foundation

struct HomeViewModel {

    func getRecipeData(baseURL: String, query: String, apiKey: String, completion: @escaping (Result<Recipe, RecipeError>) ->()) {
        guard let url = URL(string: "\(baseURL)query=\(query)&type&apiKey=\(apiKey)") else {
            return completion(.failure(.noURLFound))
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let recipie = try JSONDecoder().decode(Recipe.self, from: data)
                    return completion(.success(recipie))
                } catch {
                    return completion(.failure(.customError(error)))
                }
            } else {
                return completion(.failure(.noData))
            }
        }
        task.resume()
    }
}
