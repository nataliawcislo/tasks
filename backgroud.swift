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
    
    override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
     }
    
    func printGrandchildenList(){
        print(childrenList)  
    }

    func printGrandchildrenList(){
        print(grandchildrenList)  
    }
    
    func addChild(child: Parent){
        childrenList.append(child)
    }

    func addGrandchild(grandchild: Child){
        grandchildrenList.append(grandchild)
    }
}

class Parent: Person {
    override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
     }
}


class Child: Person {
    var grandparentsList = [Grandparent]()
    var parentsList = [Parent]()
   
     override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
     }

    func printGrandparentsList(){
        print(grandparentsList)     
    }
    
    func printParentsList(){
         print(parentsList)     
   }
    
    func addParent(parent: Parent){
         parentsList.append(parent)
     }

    func addGrandparent(grandparent: Grandparent){
         grandparentsList.append(grandparent)
     }
}

var c1 = Child(name: "N", height: 160.9, birthday: "30-08-1998")
var c2 = Child(name: "B", height: 160.9, birthday: "30-08-1998")
var c3 = Child(name: "C", height: 160.9, birthday: "30-08-1998")
var p1 = Parent(name: "G", height: 160.9, birthday: "30-08-1998")
var p2 = Parent(name: "7", height: 160.9, birthday: "30-08-1998")
var g1 = Grandparent(name: "Nati", height: 160.9, birthday: "30-08-1998")
print("\(c1.name), \(c1.height)")
print("\(c2.name), \(c2.height)")
print("\(c3.name), \(c3.height)")
//Grandparent.addGrandchild(c1)
//Grandparent.addGrandchild(c2)
//Grandparent.addGrandchild(c3)
