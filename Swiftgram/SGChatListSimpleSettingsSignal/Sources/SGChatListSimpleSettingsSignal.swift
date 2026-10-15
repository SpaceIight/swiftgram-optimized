import SGSimpleSettings
import Foundation
import SwiftSignalKit

public func sgSimpleSettingsBoolSignal(_ key: SGSimpleSettings.Keys, defaultValue: Bool) -> Signal<Bool, NoError> {
    return Signal<Bool, NoError>.single(UserDefaults.standard.object(forKey: key.rawValue) as? Bool ?? defaultValue)
}
