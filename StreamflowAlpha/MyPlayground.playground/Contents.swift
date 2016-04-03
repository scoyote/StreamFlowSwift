//: Playground - noun: a place where people can play


import UIKit
import XCPlayground

let x: Double = 34.0989346425338
let y = Double(round(1000000*x)/1000000)

/*



XCPSetExecutionShouldContinueIndefinitely()


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



for (index, element) in result!.enumerate() {
    let r2:Array? = result![index].componentsSeparatedByString("\t")
    
    print("\(index): Title \(r2?[1])")
    print("\(index): SubTitle \(r2?[2])")
    print("\(index): Latitude \(r2?[4])")
    print("\(index): Longitude \(r2?[5])")


}
let homeLat = 34.098904
let homeLon = -84.460004
let latDelta = 0.25
let lonDelta = 0.25

let latN = homeLat + latDelta
let latS = homeLat - latDelta
let lonW = homeLon - lonDelta
let lonE = homeLon + lonDelta

let url = NSURL(string: "http://waterservices.usgs.gov/nwis/site/?format=rdb&bBox=\(lonW),\(latS),\(lonE),\(latN)")

let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
    (data, response, error) in
    let rx = String(data: data!, encoding: NSUTF8StringEncoding)
    
    let rz:Array? = rx?.componentsSeparatedByString("\n")
    for (index,element) in rz!.enumerate(){
      
        //print("\(index) : \(element)")
        let rz1:Array? = rz![index].componentsSeparatedByString("\t")
        if rz1![0] == "USGS"{
            print(rz1)
            print("\(rz1?[1]) \(rz1?[2]) \(rz1?[3]) \(rz1?[4])")
        }
    }
}

task.resume()

//print(result!.count)

//for i in 1 to result!.count
//result?[4].componentsSeparatedByString("\t"))

 */