//: Playground - noun: a place where people can play


import UIKit


let fm = NSFileManager.defaultManager()

let filePath = NSBundle.mainBundle().pathForResource("sites", ofType: "txt")

if filePath != nil {
    
    var result: Bool
    
    result = fm.fileExistsAtPath(filePath!)
    
    // get the contentData
    let contentData = NSFileManager.defaultManager().contentsAtPath(filePath!)
    
    // get the string
    let content = NSString(data: contentData!, encoding: NSUTF8StringEncoding) as? String
    
    // print
    print("filepath: \(filePath!)")
    
    if let c = content {
        print("content: \n\(c)")
    }
} else {
    print("File not found.")
}
func arrayFromContentsOfFileWithName(fileName: String) -> [String]? {
    guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "txt") else {
        return nil
    }
    
    do {
        let content = try String(contentsOfFile:path, encoding: NSUTF8StringEncoding)
        return content.componentsSeparatedByString("\n")
    } catch _ as NSError {
        return nil
    }
}

let result:Array? = arrayFromContentsOfFileWithName("sites")


let final = Array<Array<String>>()

for (index, element) in result!.enumerate() {
    let r2:Array? = result![index].componentsSeparatedByString("\t")
    
    print("\(index): Title \(r2?[1])")
    print("\(index): SubTitle \(r2?[2])")
    print("\(index): Latitude \(r2?[4])")
    print("\(index): Longitude \(r2?[5])")
    
    

}


//print(result!.count)

//for i in 1 to result!.count
//result?[4].componentsSeparatedByString("\t"))
