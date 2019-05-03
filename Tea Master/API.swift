//  This file was automatically generated and should not be edited.

import Apollo

public final class GetUserTeasQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetUserTeas {\n  userTeas {\n    __typename\n    brand\n    name\n    type\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("userTeas", type: .nonNull(.list(.nonNull(.object(UserTea.selections))))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(userTeas: [UserTea]) {
      self.init(unsafeResultMap: ["__typename": "Query", "userTeas": userTeas.map { (value: UserTea) -> ResultMap in value.resultMap }])
    }

    public var userTeas: [UserTea] {
      get {
        return (resultMap["userTeas"] as! [ResultMap]).map { (value: ResultMap) -> UserTea in UserTea(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UserTea) -> ResultMap in value.resultMap }, forKey: "userTeas")
      }
    }

    public struct UserTea: GraphQLSelectionSet {
      public static let possibleTypes = ["Tea"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("brand", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(brand: String, name: String, type: String) {
        self.init(unsafeResultMap: ["__typename": "Tea", "brand": brand, "name": name, "type": type])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var brand: String {
        get {
          return resultMap["brand"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "brand")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var type: String {
        get {
          return resultMap["type"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation Login($user: String!, $password: String!) {\n  login(id: $user, password: $password)\n}"

  public var user: String
  public var password: String

  public init(user: String, password: String) {
    self.user = user
    self.password = password
  }

  public var variables: GraphQLMap? {
    return ["user": user, "password": password]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("login", arguments: ["id": GraphQLVariable("user"), "password": GraphQLVariable("password")], type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login])
    }

    public var login: String? {
      get {
        return resultMap["login"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "login")
      }
    }
  }
}