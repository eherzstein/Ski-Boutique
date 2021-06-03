//
//  FirebaseReference.swift
//  eBoutique
//
//  Created by Erin Herzstein on 2021-05-21.
//  Copyright © 2021 Erin Herzstein. All rights reserved.
//

import Foundation
import FirebaseFirestore
enum FCollectionReference: String{
   case User
   case Menu
   case Order
   case Basket
}
// accès à chaque élément dans Firestore
func FirebaseReference(_ collectionReference: FCollectionReference) ->
CollectionReference{
    return Firestore.firestore().collection(collectionReference.rawValue)
}

