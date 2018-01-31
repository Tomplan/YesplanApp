//
//  Address.swift
//  YesplanApp
//
//  Created by Tom Slegers on 11/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import Foundation


struct Address: Codable {
    let addresstype: String
    let isdefault: Bool
    let street: [String]
    let zipcode: String
    let city: String
    let country: String?
    let countrycode: String?
    
    enum CodingKeys: String, CodingKey {
        case addresstype = "addresstype"
        case isdefault = "isdefault"
        case street = "street"
        case zipcode = "zipcode"
        case city = "city"
        case country = "country"
        case countrycode = "countrycode"
    }
    
    func printAddress() {
        print("\t\t addresstype: \(self.addresstype)")
        print("\t\t isdefault: \(self.isdefault)")
        for street in self.street {
            print("\t\t streets: ")
            print("\t\t street: \(street)") }
        print("\t\t zipcode: \(self.zipcode)")
        print("\t\t city: \(self.city)")
        if let country = self.country { print("\t\t country: \(country)") }
        if let countrycode = self.countrycode { print("\t\t countrycode: \(countrycode)") }
    }
}

extension Address {
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Address.self, from: data) else { return nil }
        self = me
    }
    
    init?(_ json: String, using encoding: String.Encoding = .utf8) {
        guard let data = json.data(using: encoding) else { return nil }
        self.init(data: data)
    }
    
    init?(url: String) {
        guard let url = URL(string: url) else { return nil }
        guard let data = try? Data(contentsOf: url) else { return nil }
        self.init(data: data)
    }
    
    var jsonData: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var json: String? {
        guard let data = self.jsonData else { return nil }
        return String(data: data, encoding: .utf8)
    }
}
