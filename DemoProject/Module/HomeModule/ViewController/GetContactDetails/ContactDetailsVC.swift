//
//  ContactDetailsVC.swift
//  DemoProject
//
//  Created by Rahul Chaurasia on 28/02/23.
//  Copyright © 2023 Nilesh Birhade. All rights reserved.
//

import UIKit
import Contacts


struct ContactModel :Identifiable, Encodable {
    var id = UUID().uuidString
    
    var Name: String //= "No firstName"
    var PhoneNumbers: [String] //= []
    var EmailAddresses: [String]// = []
    
    var OrganizationName: String
    
//    var StreetAddresses: [String]
//    var CityAddresses: [String]
//    var PostalAddresses: [String]
    
    var PostalAddress: [String]
    
    var Nickname: String
   // var Birthday: String
   // var Note: String
    

}

struct AddressModel : Encodable {
    
    var Street : String
    var City : String
    var PostalCode : String
}
                            
                            
class ContactDetailsVC: UIViewController {

    var contactData = [ContactModel]()
    var addressData = [AddressModel]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let store = CNContactStore()
            let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)

        
        // 2
            if authorizationStatus == .notDetermined {
              // 3
              store.requestAccess(for: .contacts) { [weak self] didAuthorize,
              error in
                if didAuthorize {
                   self?.retrieveContacts(from: store)
                }
              }
            } else if authorizationStatus == .authorized {
                
                let website = "CodeSpeedy"
                let last = String(website.suffix(6))
                print(last)
                retrieveContacts(from: store)
            }
    }
    

    func retrieveContacts1(from store: CNContactStore) {
        let containerId = store.defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        // 4
        let keysToFetch = [CNContactGivenNameKey as CNKeyDescriptor,
                          
                           CNContactPhoneNumbersKey as CNKeyDescriptor,
                           CNContactFamilyNameKey as CNKeyDescriptor,
                           CNContactImageDataAvailableKey as
                           CNKeyDescriptor,
                           CNContactImageDataKey as CNKeyDescriptor]

        let contacts = try! store.unifiedContacts(matching: predicate, keysToFetch: keysToFetch)

        // 5
        print(contacts)
      }
    
    func addAddress(a : String , b: String , c : String) -> String{
        
        return "\(a) \(b) \(c)"
        
        print("Address" + a + b + c)
    }
    
    func retrieveContacts(from store: CNContactStore) {
        
        let keys = [CNContactGivenNameKey,CNContactPhoneNumbersKey,CNContactFamilyNameKey,CNContactEmailAddressesKey,
            CNContactOrganizationNameKey,
            
            CNContactPostalAddressesKey,
            //CNContactBirthdayKey,
            //CNContactNoteKey,
            CNContactNicknameKey
            ]
        
        
        let request  = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        self.contactData = [ContactModel]()
       
        do{
            try   store.enumerateContacts(with: request, usingBlock:
                                            
                                            { contact, stop in
               

                
                var tempPhoneData  =  contact.phoneNumbers.filter{ $0.value.stringValue.count >= 10
                
                }.compactMap { $0.value.stringValue.digitOnly}
                   
                
                var PhoneDataArray = [String]()
                tempPhoneData.forEach { element in
                   
                    if(element.count >= 10){
                        
                        var c =   element.suffix(10)
                          
                        PhoneDataArray.append(String(c))
                          
                          
                    }
                  
                    
                }

                print("Filter Data :", PhoneDataArray)
                


                self.contactData.append(
                    ContactModel(
                        Name :"\(contact.givenName) \(contact.familyName)",
                        
                        
//                        PhoneNumbers: contact.phoneNumbers.compactMap { $0.value.stringValue.removeSpecialCharactersWithoutSpace},

                        PhoneNumbers: PhoneDataArray,
                        
        
                        
                        EmailAddresses: contact.emailAddresses.compactMap{$0.value as String },
                        OrganizationName:  contact.organizationName,
                       
                       
                        PostalAddress: contact.postalAddresses.compactMap{
                            
                           return  "\($0.value.street) \($0.value.city) \($0.value.postalCode) "
                            
                            
                        },
                    
                        Nickname: contact.nickname
                        
                        // Note: contact.note,
                        
                    ))
                
                                

            })
           
            

            let encodedData = try JSONEncoder().encode(contactData)
            let jsonString = String(data: encodedData,
                                    encoding: .utf8)

            if let data = jsonString {

               var listdata =  data.replacingOccurrences(of: "\\", with: "")
                print(listdata)
            }
            
            
             //print(self.contactData)
        }catch let err {
            print("print to fetch Contact" ,  err)
        }
        
        
        
    }
    

}
extension ContactDetailsVC {
    
    static func shareInstance() -> ContactDetailsVC
    {
        return ContactDetailsVC.initiateFromStoryboard(name: "HomeModule")
    }
}
