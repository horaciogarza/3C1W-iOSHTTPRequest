//
//  JSONViewController.swift
//  httpRequestSample
//
//  Created by Horacio Garza on 08/05/16.
//  Copyright © 2016 Horacio Garza. All rights reserved.
//

import UIKit

class JSONViewController: UIViewController {

    @IBOutlet weak var jsonText: UITextField!
    
    var completeLink:String? = ""
    
    override func viewDidLoad() {
        asincrono()
        super.viewDidLoad()
        jsonText.text = jsonText.text

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    func asincrono(){
        
        print("A buscar: \(completeLink!) \n")
        let url:NSURL = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:\(completeLink!)")!
        let urlSession:NSURLSession = NSURLSession.sharedSession()
        
        
        let bloque = { (datos : NSData?, resp: NSURLResponse?,error:NSError?)-> Void in let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            
            
            if error?.code>=400 && error?.code<500 {
                
                self.jsonText.text = "Error, bad connection"
                
            }else if error?.code == nil{
               
                /*let index1 = (texto! as String).startIndex.advancedBy(2)
                let substring1 = (texto! as String).substringToIndex(index1)
                print(substring1)*/
                dispatch_sync(dispatch_get_main_queue(), {
                    self.jsonText.text = texto! as String
                })
                
                print("Datos obtenidos: \n\n\(self.jsonText.text!)")
                
                
            }
            
            print(texto!)
        }
        
        let dt = urlSession.dataTaskWithURL(url, completionHandler: bloque)
        
        
        
        dt.resume()
    }
    /*
    func makeHTTPRequest(){
        
        let requestURL: NSURL = NSURL(string: "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" + completeLink!)!
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: requestURL)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                print("Everyone is fine, file downloaded successfully.")
            }
        }
        task.resume()
        
    }*/

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
