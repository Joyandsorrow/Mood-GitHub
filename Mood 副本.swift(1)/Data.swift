import SwiftUI

struct bottleImage : Identifiable, Codable{
    var id = UUID()
    var Papertext : String
    var moodtext : String
    var weathertext : String
    var tomorrowplan : String
    var datenow : Date
    var tapButton : Bool
    var isok : Bool
}

class bottleImageData {
    
    static let PROJECT_LIST = "projectList"
    
    // 将 项目数据 保存到本地的 项目数据列表
    static func saveProject(project: bottleImage) {
        let encoder = JSONEncoder()
        let decoder = JSONDecoder()
        
        // 如果拿到数据，则增加到数据再放回去
        if let data = UserDefaults.standard.value(forKey: PROJECT_LIST) as? Data {
            // 存储的是 data ，所以先 解码 成数组
            if var objectList = try? decoder.decode(Array.self, from: data)  as [bottleImage] {
                // 将新的数据加到数组里
                objectList.append(project)
                // 再把数组 编码 存起来
                if let encoded = try? encoder.encode(objectList) {
                    UserDefaults.standard.set(encoded,forKey: PROJECT_LIST)
                    UserDefaults.standard.synchronize()
                }
            }
        } else {
            var projectList = [bottleImage]()
            projectList.append(project)
            if let encoded = try? encoder.encode(projectList) {
                UserDefaults.standard.set(encoded,forKey: PROJECT_LIST)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    
    static func loadProject() -> [bottleImage] {
        let decoder = JSONDecoder()
        if let data = UserDefaults.standard.value(forKey: PROJECT_LIST) as? Data {
            if let object = try? decoder.decode(Array<bottleImage>.self, from: data) {
                return object
            }
        }
        return []
    }
    
}


