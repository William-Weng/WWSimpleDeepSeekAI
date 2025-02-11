//
//  WWSimpleDeepSeek.swift
//  WWSimpleDeepSeek
//
//  Created by William.Weng on 2025/2/11.
//

import WWNetworking
import Foundation

// MARK: - [簡單的DeepSeek功能使用](https://api-docs.deepseek.com/)
open class WWSimpleDeepSeekAI {
    
    public static let shared = WWSimpleDeepSeekAI()
    
    static let baseURL = "https://api.deepseek.com"
    
    static var apiKey = "<Key>"
    static var model: WWSimpleDeepSeekAI.Model = .chat
    
    private init() {}
}

// MARK: - 初始值設定 (static function)
public extension WWSimpleDeepSeekAI {
    
    /// [參數設定](https://api-docs.deepseek.com/)
    /// - Parameters:
    ///   - apiKey: String
    ///   - version: String
    ///   - model: Gemini模型
    static func configure(apiKey: String, model: WWSimpleDeepSeekAI.Model = .chat) {
        self.apiKey = apiKey
        self.model = model
    }
}

// MARK: - 公開函式
public extension WWSimpleDeepSeekAI {
    
    /// [支援模型列表](https://api-docs.deepseek.com/zh-cn/api/list-models)
    /// - Returns: Result<String?, Error>
    func list() async -> Result<Data?, Error> {
        
        let api = WWSimpleDeepSeekAI.API.list
        let header = authorizationHeaders()
        let result = await WWNetworking.shared.request(httpMethod: .GET, urlString: api.value(), headers: header)
        
        switch result {
        case .failure(let error): return .failure(error)
        case .success(let info): return .success(info.data)
        }
    }
    
    /// [帳號餘額查詢](https://api-docs.deepseek.com/zh-cn/api/get-user-balance)
    /// - Returns: Result<Data?, Error>
    func balance() async -> Result<Data?, Error> {
        
        let api = WWSimpleDeepSeekAI.API.balance
        let header = authorizationHeaders()
        let result = await WWNetworking.shared.request(httpMethod: .GET, urlString: api.value(), headers: header)
        
        switch result {
        case .failure(let error): return .failure(error)
        case .success(let info): return .success(info.data)
        }
    }
    
    /// [執行聊天功能](https://api-docs.deepseek.com/zh-cn/api/create-chat-completion)
    /// - Parameters:
    ///   - content: 句子文字
    ///   - role: 執行角色
    /// - Returns: Result<String?, Error>
    func chat(content: String, forRole role: Role = .user) async -> Result<Data?, Error> {
        
        let api = WWSimpleDeepSeekAI.API.chat
        let header = authorizationHeaders()
        let json = """
        {
          "messages": [{"content": "\(content)", "role": "\(role.value())"}],
          "model": "\(WWSimpleDeepSeekAI.model.value())"
        }
        """
        
        let result = await WWNetworking.shared.request(httpMethod: .POST, urlString: api.value(), headers: header, httpBodyType: .string(json))
        
        switch result {
        case .failure(let error): return .failure(error)
        case .success(let info): return .success(info.data)
        }
    }
}

// MARK: - 小工具
private extension WWSimpleDeepSeekAI {
    
    /// [安全認證Header](https://platform.deepseek.com/api_keys)
    /// - Returns: [String: String?]
    func authorizationHeaders() -> [String: String?] {
        let headers: [String: String?] = ["Authorization": "Bearer \(WWSimpleDeepSeekAI.apiKey)"]
        return headers
    }
}
