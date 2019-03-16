//
//  FirebaseAPIHelper.swift
//  
//
//  Created by Will Oakley on 10/24/18.
//

import Foundation
import FirebaseStorage
import FirebaseDatabase

class FirebaseAPIClient {
    
    static func getSnaps(completion: @escaping ([SnapImage]) -> ()) {
        /* PART 2A START */
        var allSnaps = [SnapImage]()
        let ref = Database.database().reference().child("snapImages")
        let imageLoc = Storage.storage().reference().child("images")

        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            let snapImages = snapshot.value as? NSDictionary
            let group = DispatchGroup()
            
            for snap in snapImages! {
                group.enter()
                let image = snapImages?["imageURL"] as? String ?? ""
                let sender = snapImages?["sendBy"] as? String ?? ""
                let receiver = snapImages?["sendTo"] as? String ?? ""
                let httpsReference = Storage.storage().reference(forURL: image)
                
                httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if let error = error {
                        // Uh-oh, an error occurred!
                    } else {
                        // Data for "images/island.jpg" is returned
                        let imageUI = UIImage(data: data!)
                    }
                    let currSnap = SnapImage(imageDict: [sender : receiver], image: imageUI)
                }
                allSnaps.append(currSnap)
            }
        
        /* PART 2A FINISH */
    })
   }
}
