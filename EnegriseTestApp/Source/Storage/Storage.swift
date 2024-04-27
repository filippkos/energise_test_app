//
//  Storage.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import Foundation

class Storage {
    
    var fileManager = FileManager()
    
    func saveProfile(_ file: IPLocationModel) {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(file)
            if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDirectory.appendingPathComponent("IPLocationModel.json")
                try data.write(to: fileURL)
                print("Model saved successfully.")
            }
        } catch {
            print("Error saving model: \(error)")
        }
    }

    func loadProfile() -> IPLocationModel? {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDirectory.appendingPathComponent("IPLocationModel.json")
            do {
                let data = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                let profile = try decoder.decode(IPLocationModel.self, from: data)
                print("Model loaded successfully.")
                return profile
            } catch {
                print("Error loading model: \(error)")
            }
        }
        return nil
    }
}
