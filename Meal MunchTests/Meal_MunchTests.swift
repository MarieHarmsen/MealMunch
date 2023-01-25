import XCTest
@testable import Meal_Munch

class Meal_MunchTests: XCTestCase {
    let sut = HomeViewModel()
    let baseURL = "https://api.spoonacular.com/recipes/complexSearch?"
    let query = "chicken"
    let apiKey = APIKeys().getSpoonfulAPIKey()
    
    let mockRecipeResponse = """
    {
        "results": [
            {
                "id": 782585,
                "title": "Cannellini Bean and Asparagus Salad with Mushrooms",
                "imageType": "jpg",
                "image": "https://spoonacular.com/recipeImages/782585-312x231.jpg"
            },
            {
                "id": 716426,
                "title": "Cauliflower, Brown Rice, and Vegetable Fried Rice",
                "imageType": "jpg",
                "image": "https://spoonacular.com/recipeImages/716426-312x231.jpg"
            }
        ],
        "totalResults": 5221,
        "offset": 0,
        "number": 10
    }
    """
    
    func testGetRecipeData() {
        let session = URLSessionMock()
        session.data = mockRecipeResponse.data(using: .utf8)
        let task = session.dataTask(with: URL(string: "\(baseURL)query=\(query)&type&apiKey=\(apiKey)")!) { data, response, error in
            XCTAssertNil(error)
            if let data = data {
                do {
                    let recipe = try JSONDecoder().decode(Recipe.self, from: data)
                    XCTAssertEqual(recipe.meals?[0].title, "Cannellini Bean and Asparagus Salad with Mushrooms")
                } catch {
                    XCTFail()
                }
            }
        }
    }
    
    func testGetRecipeDataNoUrl() {
        sut.getRecipeData(baseURL: baseURL, query: query, apiKey: apiKey) { result in
            switch result {
            case .success(_):
                XCTFail("This should fail with noUrl")
            case .failure(let error):
                XCTAssertEqual(error, .noURLFound)
            }
        }
    }
                        
    func testGetDataSuccess() {
        sut.getRecipeData(baseURL: baseURL, query: query, apiKey: apiKey) { result in
            switch result {
            case .success(let products):
                XCTAssertEqual(products.number, 10)
            case .failure(_):
                XCTFail("This should pass")
            }
        }
    }
}
