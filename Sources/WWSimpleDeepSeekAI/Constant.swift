//
//  Constant.swift
//  WWSimpleDeepSeek
//
//  Created by William.Weng on 2025/2/11.
//

import UIKit

// MARK: - enum
public extension WWSimpleDeepSeekAI {
    
    /// [API功能](https://api-docs.deepseek.com/)
    enum API {
        
        case list           // 模型列表
        case balance        // 查詢餘額
        case chat           // 對話補全
        
        /// 取得url
        /// - Returns: String
        func value() -> String {
            
            let path: String
            
            switch self {
            case .list: path = "models"
            case .balance: path = "user/balance"
            case .chat: path = "chat/completions"
            }
            
            return "\(WWSimpleDeepSeekAI.baseURL)/\(path)"
        }
    }
    
    /// [DeepSeek模型](https://api-docs.deepseek.com/quick_start/pricing)
    enum Model {
        
        case chat
        case reasoner
        case custom(_ model: String)
        
        /// 取得模型名稱
        /// - Returns: String
        func value() -> String {
            
            switch self {
            case .chat: return "deepseek-chat"
            case .reasoner: return "deepseek-reasoner"
            case .custom(let model): return model
            }
        }
    }
    
    /// DeepSeek角色類型
    enum Role {
        
        case system
        case user
        case custom(_ role: String)
        
        /// 取得角色名稱
        /// - Returns: String
        func value() -> String {
            
            switch self {
            case .system: return "system"
            case .user: return "user"
            case .custom(let role): return role
            }
        }
    }
    
    /// DeepSeek錯誤
    enum DeepSeekError: Error {
        case error(_ error: [String: Any])
    }
}
