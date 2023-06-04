class Person {
    var name: String
    var height: Double
    var birthday: String

    init(name: String, height: Double, birthday: String) {
        self.name = name     
        self.height = height
        self.birthday = birthday
    }
}

class Grandparent: Person {
    var childrenList: [Parent] = []
    var grandchildrenList: [Child]  = []
    
    init() {
        self.childrenList = childrenList     
        self.grandchildrenList = grandchildrenList
        super.init(name: name, height: height, birthday: birthday)
        }
    
    func printGrandchildenList(){
        print(childrenList)  
    }

   func printGrandchildrenList(){
        print(grandchildrenList)  
   }
    
}

class Parent: Grandparent {
    override init() {
         super.init
     }
}


class Child: Parent {
    var grandparentList = [Grandparent]()
    var parentList = [Parent]()
   
    override init() {
        self.grandparentList = grandparentList     
        self.parentList = parentList
        super.init(name: name, height: height, birthday: birthday)
     }
       
    func printGrandparentList(){
        print(grandparentList)     

    }

     func printParentList(){
         print(parentList)     
   }
}

Person(name: "Nat", height: 160.9, birthday: "30-08-1998")
Person(name: "Nati", height: 160.9, birthday: "30-08-1998")
Person(name: "Nati", height: 160.9, birthday: "30-08-1998")
