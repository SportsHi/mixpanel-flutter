 import Foundation
 import Mixpanel

 class MixpanelTypeHandler {

    static func mixpanelPanelTypeValue(_ object: Any) -> MixpanelType? {
        switch object {
        case let value as String:
            return value as MixpanelType

        case let value as Int:
            return value as MixpanelType

        case let value as UInt:
            return value as MixpanelType

        case let value as Double:
            return value as MixpanelType

        case let value as Float:
            return value as MixpanelType

        case let value as Bool:
            return value as MixpanelType
        
        case let value as Date:
            return value as MixpanelType

        case let value as MixpanelType:
            return value

        case let value as [MixpanelType]:
            return value

        case let value as [String: MixpanelType]:
            return value

        case let value as URL:
            return value

        case let value as NSNull:
            return value

        default:
            return nil
        }
    }

    static func mixpanelProperties(properties: Dictionary<String, Any>? = nil, mixpanelProperties: Dictionary<String, Any>? = nil) -> Dictionary<String, MixpanelType> {
        var properties = (properties != nil) ? properties : [:]
        
        if let mixpanelProperties = mixpanelProperties {
            properties?.merge(dict: mixpanelProperties)
        }
        
        var allProperties = Dictionary<String, MixpanelType>()
        
        for (key, value) in properties ?? [:] {
            allProperties[key] = mixpanelPanelTypeValue(value)
        }
        
        return allProperties
    }
 }

 extension Dictionary {
    mutating func merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
 }
