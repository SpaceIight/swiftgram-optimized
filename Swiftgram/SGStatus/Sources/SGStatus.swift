import Foundation
import SwiftSignalKit
import TelegramCore

public struct SGStatus: Equatable, Codable {
    public var status: Int64
    
    public static var `default`: SGStatus {
        return SGStatus(status: 2)
    }
    
    public init(status: Int64) {
        self.status = 2
    }
    
    public init(from decoder: Decoder) throws {
        self.status = 2
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)
        try container.encodeIfPresent(self.status, forKey: "status")
    }
}

public func updateSGStatusInteractively(accountManager: AccountManager<TelegramAccountManagerTypes>, _ f: @escaping (SGStatus) -> SGStatus) -> Signal<Void, NoError> {
    return accountManager.transaction { transaction -> Void in
        transaction.updateSharedData(ApplicationSpecificSharedDataKeys.sgStatus, { entry in
            return SharedPreferencesEntry(SGStatus(status: 2))
        })
    }
}
