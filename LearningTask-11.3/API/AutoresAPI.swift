import Foundation

/**
 Componente cliente da api de autores da casa do código.
 Implementação atual apenas simula um carregamento.
 Integrações com serviços HTTP estão fora do escopo da atividade atual e será tema mais a frente
 */
class AutoresAPI {
    
    var session: URLSession?
    var dataTask: URLSessionDataTask?
    var decoder: JSONDecoder?
    
    var uri: URL = URL(string: "https://casadocodigo-api.herokuapp.com/api/author")!
    
    init(session: URLSession? = .shared, decoder: JSONDecoder? = JSONDecoder()) {
        self.session = session
        self.decoder = decoder
    }
    
    func getAll(fromUrl url: URL, completionHandler: @escaping ([Autor]) -> Void,
                                failureHandler: @escaping (AutoresAPI.Error) -> Void) {
        dataTask?.cancel()
        dataTask = session?.dataTask(with: url, completionHandler: { [weak self] data, response, error in
            
            defer {
                self?.dataTask = nil
            }
            
            //Check for request failure.
            if let error = error {
                DispatchQueue.main.async {
                    failureHandler(Error.requestFailed(error))
                }
                return
            }
            
            //Check for server response failure
            guard let data = data,
                  let response = response as? HTTPURLResponse,
                  response.statusCode == 200 else {
                DispatchQueue.main.async {
                    failureHandler(Error.failedToFetch)
                }
                return
            }
            
            //check for parsing error and invalid data
            do {
                guard let self = self else {return}
                
                let response = try self.decoder?.decode([Autor].self, from: data)

                DispatchQueue.main.async {
                    guard let response = response else {return}
                    
                    completionHandler(response)
                }
                
            } catch {
                DispatchQueue.main.async {
                    failureHandler(.invalidData)
                }
            }
            
        })
        dataTask?.resume()
    }
}

extension AutoresAPI {
    enum Error: Swift.Error, LocalizedError{
        case requestFailed(Swift.Error)
        case failedToFetch
        case invalidData
        
        var errorDescription: String? {
            switch self {
            case .requestFailed(let error):
                return "Error while processing the request: \(error.localizedDescription)"
            case .failedToFetch:
                return "Unable to fetch data from server"
            case .invalidData:
                return "Unable to parse. Invalid data returned from server."
            }
        }
    }
}
