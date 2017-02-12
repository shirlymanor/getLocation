# How to add a location to your app
First, Add a swift file to your app and call it getLocation.swift <br>
```javascript
//  GetLocation.swift

import Foundation
import MapKit

struct Typealiases {
    typealias JSONDict = [String:Any]
}

class GetLocation {

    let locManager = CLLocationManager()
    var currentLocation: CLLocation!

    func getAdress(completion: @escaping (Typealiases.JSONDict) -> ()) {

        locManager.requestWhenInUseAuthorization()
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locManager.location

            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(currentLocation) { (placemarks, error) -> Void in

                if error != nil {
                    print("Error getting location: \(error)")
                } else {
                    let placeArray = placemarks as [CLPlacemark]!
                    var placeMark: CLPlacemark!
                    placeMark = placeArray?[0]
                    completion(placeMark.addressDictionary as! Typealiases.JSONDict)
                }
            }
        }
    }
}
```
<br>
Now add global parameter to your class: <br>
let loc = GetLocation()
<br>
Now try to run it <br>
The error said to add parameters to your info.plist
Add NSLocationWhenInUseUsageDescription and add text inside <br>
Add inside viewDidLoad function this code :<br>
```javascript
loc.getAdress { result in
            
            if let city = result["City"] as? String {
                print(city)
            }
        }
 ```
 ##### challenge <br>
 Only on the second time it will print the city. Why? and how can you fix that.


