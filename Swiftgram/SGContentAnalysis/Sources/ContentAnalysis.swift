import Foundation
import SwiftSignalKit

public enum ContentAnalysisError: Error {
    case generic(_ message: String)
}

public enum ContentAnalysisMediaType {
    case image
    case video
}

public func canAnalyzeMedia() -> Bool {
    return false
}

public func analyzeMediaSignal(_ url: URL, mediaType: ContentAnalysisMediaType = .image) -> Signal<Bool, Error> {
    return .single(false)
}
