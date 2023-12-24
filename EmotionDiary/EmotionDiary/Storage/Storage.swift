//
//  Storage.swift
//  TextfieldTest
//
//  Created by joonwon lee on 2022/07/01.
//

import Foundation

public class Storage {
    
    private init() { }
    
    // TODO: directory 설명
    // TODO: FileManager 설명
    enum Directory {
        case documents
        case caches
        
        /*
        일기들이 영구적으로 보관되어야하기 때문에, 일기들을 documents에 저장할 예정이다.
        저장은 JSON파일 형태로 저장할려고 한다.
        Storage를 가져다가 저장하는 객체는 MoodDiaryStorage가 있다.
        MoodDiaryStorage에 Diary관련한 객체들을 넣어준다. (diary_list.json에 저장을 해!라고 해주는 것이 MoodDiaryStorage이다.)
        저장된 데이터를 가져와서 MoodDiary배열 형태로 가져와 주는 것도, Storage.retrive메서드를 이용한다.
        앱 내의 데이터를 저장할 때, 모바일 앱에 데이터를 저장할 때는 시퀄라이트 혹은 DB를 써야하지않아? 라고 많이 말한다.
         이거는 어떤 Data를 앱 내에 저장하는 방법들은 여러가지가 있다.
         - 설정파일에 쓰기
         - 파일에 쓰기
         - DB에 쓰기
         각각의 쓰이는 용도가 그때그때 다르다. 각각의 방법들이 장단점이 있다. 예를 들어, DB를 왜 안쓰냐? 라고 했을 때,
         DB를 썼을 때, 주의해야할 것은 DB수정작업 등이 있을 때는 잘못하면 앱크래쉬가 빈번하다.
         DB에도 여러 종류가 있다. Apple에서 제공하는 CoreData, Ram (각각의 DB관리해주는) -> Manage Cost가 있기 때문에, 버전업 혹은 스키마 수정작업 등이 있을 때, 까다롭게 해줘야한다.
         이것들 이외에도 DB가 필요한 경우가 있냐?라고 했을 때, DB는 몇 백건, 몇 천건 이상의 고속으로 처리하기는 좋다. 몇 천건이 안된다고 했을 떄, 라이트하게 파일에 쓰고, 읽고 할 수도 있다.
         파일로 쓰는 방법이 있을 텐데, JSON형태로 하는 이유는?
         정보들이 JSON으로 Encoding, Decoding 시킨 다음에, 서버에 보내는 경우가 있다. 서버보내기 전에 사전작업이라고 생각하면 좋을 것 같다.
         그 외에도 아카이빙 방법 등도 있다.
         # 정리
         결국에는 정보들에 저장에 있어서, 앱 내에 저장을 영원히 하기에는 어려울 수 있다. 서버로 저장하는 방법을 고려해야한다.
        */
        
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            case .caches:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
    
    // TODO: Codable 설명, JSON 타입 설명
    // TODO: Codable encode 설명
    // TODO: Data 타입은 파일 형태로 저장 가능
    
    static func store<T: Encodable>(_ obj: T, to directory: Directory, as fileName: String) {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        print("---> save to here: \(url)")
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let data = try encoder.encode(obj)
            if FileManager.default.fileExists(atPath: url.path) {
                try FileManager.default.removeItem(at: url)
            }
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch let error {
            print("---> Failed to store msg: \(error.localizedDescription)")
        }
    }
    
    // TODO: 파일은 Data 타입형태로 읽을수 있음
    // TODO: Data 타입은 Codable decode 가능
    
    static func retrive<T: Decodable>(_ fileName: String, from directory: Directory, as type: T.Type) -> T? {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        
        let decoder = JSONDecoder()
        
        do {
            let model = try decoder.decode(type, from: data)
            return model
        } catch let error {
            print("---> Failed to decode msg: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func remove(_ fileName: String, from directory: Directory) {
        let url = directory.url.appendingPathComponent(fileName, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else { return }
        
        do {
            try FileManager.default.removeItem(at: url)
        } catch let error {
            print("---> Failed to remove msg: \(error.localizedDescription)")
        }
    }
    
    static func clear(_ directory: Directory) {
        let url = directory.url
        do {
            let contents = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: [])
            for content in contents {
                try FileManager.default.removeItem(at: content)
            }
        } catch {
            print("---> Failed to clear directory ms: \(error.localizedDescription)")
        }
    }
}
