import Foundation

class IBLWebAppAuth {
    
    static func login(server: String, username: String, password: String) {
        let url = URL(string: server + "/wp-json/ibl-wp-platform/v1/mentor-sign-in")!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let message = [
            "username": username,
            "password": password
        ]
        
        do {
            let data = try encoder.encode(message)
            request.httpBody = data
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
            }
            task.resume()
        }
        catch {
            print("Could not send POST to web edx")
        }
    }
    
    
    static func register(server: String, email: String, username: String, password: String) {
        let url = URL(string: server + "/wp-json/ibl-wp-platform/v1/mentor-sign-up")!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        let encoder = JSONEncoder()
        let message = [
            "username": username,
            "name": username,
            "email": email,
            "password": password
        ]
        
        do {
            let data = try encoder.encode(message)
            request.httpBody = data
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
                
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
            }
            task.resume()
        }
        catch {
            print("Could not send POST to web edx")
        }
    }
}
