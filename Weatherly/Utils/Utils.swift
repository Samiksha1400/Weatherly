//
//  Utils.swift
//  Weatherly
//
//  Created by shivam dahale on 11/12/25.
//

import Foundation
class Utils{
    
    //MARK: - Class Functions
    class func encodeRequest<T: Encodable>(req: T) -> Data? {
        guard let encodedReq = try? JSONEncoder().encode(req) else {
            return nil
        }
        return encodedReq
    }
    
    class func decodeResponse<T: Decodable>(resType: T.Type, data: Data) -> T?{
        guard let decodedRes = try? JSONDecoder().decode(T.self, from: data) else {
            return nil
        }
        return decodedRes
    }
}
