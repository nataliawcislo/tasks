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
    
    init(childrenList:[Parent], grandchildrenList: [Child] ) {
        super.init(name: name, height: height, birthday: birthday)
        self.childrenList = childrenList    
        self.grandchildrenList = grandchildrenList    
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

class Parent: Grandparent {
     init() {
          super.init(childrenList: childrenList, grandchildrenList: grandchildrenList)
     }
}


class Child: Parent {
    var grandparentsList = [Grandparent]()
    var parentsList = [Parent]()
   
    init(grandparentsList:[Grandparent], parentsList: [Parent]) {
        super.init()
        self.grandparentsList = grandparentsList
        self.parentsList = parentsList
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
