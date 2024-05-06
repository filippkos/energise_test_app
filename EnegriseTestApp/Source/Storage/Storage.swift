//
//  Storage.swift
//  EnegriseTestApp
//
//  Created by Filipp Kosenko on 27.04.2024.
//

import Foundation

class Storage {
    
    private let fileManager = FileManager.default
    private let locationModelURL: URL
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        let document = self.fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        self.locationModelURL = document.appendingPathComponent("IPLocationModel.json")
    }
    
    func saveProfile(_ file: LocationModel) {
        do {
           let data = try encoder.encode(file)
           try data.write(to: self.locationModelURL)
        } catch {
            print("Error saving model: \(error)")
        }
    }

    func loadProfile() -> LocationModel? {
        do {
            let data = try Data(contentsOf: self.locationModelURL)
            return try decoder.decode(LocationModel.self, from: data)
        } catch {
            print("Error loading model: \(error)")
        }
    
        return nil
    }
}
