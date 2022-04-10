//
//  UserModel.swift
//  Photos App
//
//  Created by Микаэл Мартиросян on 08.04.2022.
//

import Foundation

class UserModel {
    
    static let shared = UserModel()
    
    private init() {}
    
    let standart = UserDefaults.standard
    
    enum UsersKeys: String {
        case user, users
    }
    
    let userKey = UsersKeys.user.rawValue
    let listOfUsersKey = UsersKeys.users.rawValue
    
    var usesIsAuthorized: Bool {
        return currentUser != nil
    }
    
    var listOfUsers: [UserStruct] {
        get {
            if let data = standart.data(forKey: listOfUsersKey) {
                var users = [UserStruct]()
                do {
                    users = try PropertyListDecoder().decode([UserStruct].self, from: data)
                } catch {
                    print(error)
                }
                
                return users
            } else {
                return [UserStruct]()
            }
        }
        
        set {
            var data = Data()
            
            do {
                data = try PropertyListEncoder().encode(newValue)
            } catch {
                print(error)
            }
            standart.set(data, forKey: listOfUsersKey)
            
        }
    }
    
    func saveToUserList(name: String, secondName: String, nickName: String, email: String, password: String) {
        
        let user = UserStruct(name: name, secondName: secondName, id: nickName, email: email, password: password)
        
        listOfUsers.insert(user, at: 0)
    }
    
    var currentUser: UserStruct? {
        get {
            if let data = standart.data(forKey: userKey) {
                var getUser: UserStruct?
                do {
                    getUser = try PropertyListDecoder().decode(UserStruct.self, from: data)
                } catch {
                    print(error)
                }
                return getUser
            } else {
                return nil
            }
        }
        
        set {
            var data: Data?
            
            do {
                data = try PropertyListEncoder().encode(newValue)
            } catch {
                print(error)
            }
            standart.set(data, forKey: userKey)
        }
    }
    
    func saveCurrentUser(user: UserStruct) {
        currentUser = user
    }
}
