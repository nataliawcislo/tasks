import Dispatch
import Foundation


/// extension Date 

 extension Date {
    var birthdaycounter: Int { Calendar.current.dateComponents([.year], from: self, to: Date()).year! }
    
    func toDate(format: String = "dd/MM/yyyy")-> Date?{
        do{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .short
            dateFormatter.timeStyle = .none
            dateFormatter.locale = Locale(identifier: "de_DE") //
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let date = dateFormatter.date(from: format)
            return date
        }
        catch{
            return nil
       }
    }
    var age: Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!
    } 
 }


/// Person class

class Person: NSObject{
    
    var name: String
    var height: Double
    var birthday: String

    /// Initializer for the class Person
    init(name: String, height: Double, birthday: String) {
        self.name = name     
        self.height = height
        self.birthday = birthday
    }
    
    /// Task 2 - Some new functions - Function #1
    init(copyFrom: Person) {
        self.name = "Batman"  
        self.height = copyFrom.height
        self.birthday = copyFrom.birthday
    }
    
    /// Task 2 - Some new functions - Function #1
    func makeBatmanCopy() -> Person{ 
        let res : Person = Person(copyFrom: self)
        return res
    }
    
    /// Support pritn func 
    override var description : String {
        get {
            return "\nPerson : name : \(name.self) - height : `\(height.self) - birthday : \(birthday.self)"
        }
    }
    
    ///  Method to sort an array of Person
    func sortPeople(perosnsList: [Person] ) -> [Person] {
        let sortedPerson = perosnsList.sorted {
            return ($0.name, $0.height) < ($1.name, $1.height)
        }
        return sortedPerson
    }
    
    func calculateAge(person: Person) -> Int {
        var date = Date()
        let birthday = date.toDate(format: person.birthday)!
        if type(of: birthday) == Date.Type.self {
            return Calendar.current.dateComponents([.year], from: birthday, to: Date()).day!
        } 
        else{return 0} 
    } 
    /*
    func countBirthday(person: Person) -> Int{
        var age = DateComponents(calendar: .current, year: 1998,
                                  month: 8, day: 30).date!
        return age.birthdaycounter
    }*/
} 


/// Grandparent class

class Grandparent: Person {
    
    var childrenList: [Parent] = []
    var grandchildrenList: [Child]  = []
    
    /// Initializer for the class Person
    override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
    }

    /// Task 2 - Some new functions - Function #1*/
    init(copyFrom: Grandparent) {
        super.init(copyFrom: copyFrom)
    }
    
    /// Task 2 - Some new functions - Function #1
    override func makeBatmanCopy() -> Grandparent{ 
        let res : Grandparent = Grandparent(copyFrom: self)
        return res
    }
    
    /// Support pritn func 
    override var description : String {
        get {
            return "Grandparent : name : \(name.self) - height : `\(height.self) - birthday : \(birthday.self)\n"
        }
    }
    
    /// The child list printing function
    func printChildenList(){
        print(childrenList)  
    }

    /// The grandchild list printing function
    func printGrandchildrenList(){
        for i in grandchildrenList {
          print(i)
        }
    }
    
    /// The function that gives a child to the list
    func addChild(child: Parent){
        childrenList.append(child)
    }

    /// The function that gives a grandchild to the list
    func addGrandchild(grandchild: Child){
        grandchildrenList.append(grandchild)
    }
    
    ///Function #2 - Total descendants count
    static func descendantscount(person: Grandparent) -> (String, Int){
        var name: String = person.name
        var sum: Int = 0
        sum = person.childrenList.count + person.grandchildrenList.count
        var result = (name, sum)
        return result
    }

    
    // Function #3 - Link grandparents to children - TO DO
    /*I must chech  grand children list in object Grandparent (in my codegrandchildrenList) check Granparent has elemen from List of child, and if children is in child list i must print he length (codegrandchildrenList) of the list of this object  -> I have a bug
    static func LinkGrandparents(gArray: [Grandparent],cArray: [Child] ) {
        var result: [Parent : Int] 
        for i in gArray{
            for j in cArray{
                if  gArray[i].grandchildrenList == cArray[j]{
                //if gArray[i].grandchildrenListcontains(cArray[j]){
                        result[gArray[i]] = gArray[i].grandchildrenList[k].count
                }
            }
       }
    }*/
}    


/// Parent class

class Parent: Person {
    
    /// Initializer for the class Parent
    override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
     }
    
    /// Task 2 - Some new functions - Function #1*/
    init(copyFrom: Parent) {
       super.init(copyFrom: copyFrom)
    }
    
    /// Task 2 - Some new functions - Function #1*/
    override func makeBatmanCopy() -> Parent{ 
       let res : Parent = Parent(copyFrom: self)
       return res
    }
    
    /// Task 2 - Some new functions - Function #1*/
    override var description : String {
        get {
           return "Parent : name : \(name.self) - height : `\(height.self) - birthday : \(birthday.self)\n"
       }
    }
}

/// Child class

class Child: Person {
    
    var grandparentsList: [Grandparent] = []
    var parentsList: [Parent]  = []
    
    /// Initializer for the class Person
     override init(name: String, height: Double, birthday: String) {
        super.init(name: name, height: height, birthday: birthday)
     }
    
    /// Task 2 - Some new functions - Function #1*/
    init(copyFrom: Child) {
        super.init(copyFrom: copyFrom)
     }
     
    /// Task 2 - Some new functions - Function #1*/
    override func makeBatmanCopy() -> Child{ 
        let res : Child = Child(copyFrom: self)
        return res
    }
    
    /// Support print func 
    override var description : String {
        get {
            return "Child : name : \(name.self) - height : `\(height.self) - birthday : \(birthday.self)\n"
       }
    }
    
    /// The grandparent list printing function
    func printGrandparentsList(){
        print(grandparentsList)     
    }
    
    /// The parent list printing function
    func printParentsList(){
         print(parentsList)     
    }
    
    /// The function that gives a parent to the list
    func addParent(parent: Parent){
         parentsList.append(parent)
    }
    
    /// The function that gives a grandparent to the list
    func addGrandparent(grandparent: Grandparent){
         grandparentsList.append(grandparent)
    }
}


/// TEST - TASK 1 & 2
var perosnsList: [Person] = []

var c1 = Child(name: "A", height: 100.9, birthday: "30/08/1998")
var c2 = Child(name: "B", height: 160.9, birthday: "30-08-1998")
var c3 = Child(name: "C", height: 90, birthday: "30-08-1998")
var p1 = Parent(name: "C", height: 90, birthday: "30-08-1998")
var p2 = Parent(name: "D", height: 80.9, birthday: "30-08-1998")
var p3 = Person(name: "D", height: 160.9, birthday: "30/08/1998")
var g1 = Grandparent(name: "D", height: 60.9, birthday: "2017-05-20")
var g2 = Grandparent(name: "G", height: 160.9, birthday: "2017-05-25")
var g3 = Grandparent(name: "K", height: 160.9, birthday: "2017-05-25")
var g4 = Grandparent(name: "A", height: 200, birthday: "2017-05-25")
var g5 = Grandparent(name: "A", height: 20, birthday: "2017/22/25")


    
perosnsList.append(c1) 
perosnsList.append(c2) 
perosnsList.append(c3) 
perosnsList.append(c3) 
perosnsList.append(p1) 
perosnsList.append(p2) 
perosnsList.append(p3) 
perosnsList.append(g1) 
perosnsList.append(g2) 
perosnsList.append(g3) 
perosnsList.append(g4) 
perosnsList.append(g5) 
print(perosnsList)

g1.printChildenList()
g1.printGrandchildrenList()

g1.addGrandchild(grandchild: c1)
g1.addGrandchild(grandchild: c2)
g1.printChildenList()
g1.addChild(child: p1)
g1.printChildenList()
g1.printGrandchildrenList()

Grandparent.descendantscount(person: g1)


var date = Date()
var person = Person(name: "Ania", height: 20, birthday: "02/02/1998")
let t1 = date.toDate(format: person.birthday)
print(type(of: t1))

print(person.calculateAge(person: person))


//sort
g1.sortPeople(perosnsList: perosnsList)

g1.addGrandchild(grandchild: c1)
g1.addGrandchild(grandchild: c2)
g1.addGrandchild(grandchild: c3)
c1.addParent(parent: p1)
c1.addParent(parent: p2)
c1.addParent(parent: p2)
c1.addGrandparent(grandparent: g1)
c1.addGrandparent(grandparent: g2)
g1.printGrandchildrenList()
g2.printGrandchildrenList()
g3.printGrandchildrenList()
g1.printGrandchildrenList()
c1.printParentsList()
c1.printGrandparentsList()
c2.printParentsList()


let copyc1 = c1.makeBatmanCopy() as! Child
let copyg1 = c1.makeBatmanCopy() as! Child
print(" Copy: \(copyc1)")
print(" Copy: \(copyg1)")
print(" Copy: \(c1)")
print(" Copy: \(c1)")


var ChildrenList:  [Child] = []
var GrandparentsList: [Grandparent] = []

ChildrenList.append(c1) 
ChildrenList.append(c2) 
ChildrenList.append(c3) 
ChildrenList.append(c3) 
GrandparentsList.append(g1) 
GrandparentsList.append(g2) 
GrandparentsList.append(g3) 
GrandparentsList.append(g4) 
GrandparentsList.append(g5) 
print(ChildrenList)
print(GrandparentsList)

//g1.LinkGrandparents(gArray: ChildrenList,cArray: GrandparentsList) 


/// TASK 3 - Concurrent operations

var listComplete = [Int]()

let list1 = [0, 1, 2, 3, 4]
let list2 = [0, 2, 3, 5]
let list3 = [5, 1, 2, 3, 4, 0, 1, 2]

func getNumber(atIndex index: Int, fromArray array: [Int]) -> Int {
    Thread.sleep(forTimeInterval:1)
    return array[index]
}

listComplete.append(contentsOf: repeatElement(0, count: list1.count + list2.count + list3.count))

let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

let dispatchGroup = DispatchGroup()

concurrentQueue.async(group: dispatchGroup) {
    for index in 0..<list1.count {
        let number = getNumber(atIndex: index, fromArray: list1)
        concurrentQueue.async {
            listComplete[index] = number
        }
    }
}

concurrentQueue.async(group: dispatchGroup) {
    for index in 0..<list2.count {
        let number = getNumber(atIndex: index, fromArray: list2)
        concurrentQueue.async {
            listComplete[list1.count + index] = number
        }
    }
}

concurrentQueue.async(group: dispatchGroup) {
    for index in 0..<list3.count {
        let number = getNumber(atIndex: index, fromArray: list3)
        concurrentQueue.async {
            listComplete[list1.count + list2.count + index] = number
        }
    }
}

dispatchGroup.wait()

print(listComplete)

