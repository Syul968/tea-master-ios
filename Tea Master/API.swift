//  This file was automatically generated and should not be edited.

import Apollo

public final class GetUserTeasQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetUserTeas {\n  userTeas {\n    __typename\n    brand\n    name\n    type\n    rating\n    isPublic\n  }\n}"

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
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("isPublic", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(brand: String, name: String, type: String, rating: Double, isPublic: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Tea", "brand": brand, "name": name, "type": type, "rating": rating, "isPublic": isPublic])
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

      public var rating: Double {
        get {
          return resultMap["rating"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "rating")
        }
      }

      public var isPublic: Bool? {
        get {
          return resultMap["isPublic"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isPublic")
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

public final class PostTeaMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation PostTea($brand: String!, $name: String!, $type: String!, $isPublic: Boolean!) {\n  postTea(brand: $brand, name: $name, type: $type, isPublic: $isPublic) {\n    __typename\n    brand\n    name\n    type\n    rating\n    isPublic\n  }\n}"

  public var brand: String
  public var name: String
  public var type: String
  public var isPublic: Bool

  public init(brand: String, name: String, type: String, isPublic: Bool) {
    self.brand = brand
    self.name = name
    self.type = type
    self.isPublic = isPublic
  }

  public var variables: GraphQLMap? {
    return ["brand": brand, "name": name, "type": type, "isPublic": isPublic]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("postTea", arguments: ["brand": GraphQLVariable("brand"), "name": GraphQLVariable("name"), "type": GraphQLVariable("type"), "isPublic": GraphQLVariable("isPublic")], type: .nonNull(.object(PostTea.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(postTea: PostTea) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "postTea": postTea.resultMap])
    }

    public var postTea: PostTea {
      get {
        return PostTea(unsafeResultMap: resultMap["postTea"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "postTea")
      }
    }

    public struct PostTea: GraphQLSelectionSet {
      public static let possibleTypes = ["Tea"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("brand", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("type", type: .nonNull(.scalar(String.self))),
        GraphQLField("rating", type: .nonNull(.scalar(Double.self))),
        GraphQLField("isPublic", type: .scalar(Bool.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(brand: String, name: String, type: String, rating: Double, isPublic: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "Tea", "brand": brand, "name": name, "type": type, "rating": rating, "isPublic": isPublic])
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

      public var rating: Double {
        get {
          return resultMap["rating"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "rating")
        }
      }

      public var isPublic: Bool? {
        get {
          return resultMap["isPublic"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isPublic")
        }
      }
    }
  }
}