//
//  Article.swift
//  eBoutique
//
//  Created by Erin Herzstein on 2021-05-21.
//  Copyright © 2021 Erin Herzstein. All rights reserved.
//

import Foundation
import SwiftUI
// Catégories
enum Category: String,CaseIterable,Codable,Hashable
{
    case boots
    case goggles
    case helmet
    case poles
    case ski
}
// caractéristiques de chaque article
struct Article: Identifiable,Hashable
{
    var id: String
    var name: String
    var imageName: String
    var category: Category
    var description: String
    var price: Double
}

//convertir les donnes sous forme de clé-valeur
func articleDictionnaryFrom(article: Article) -> [String : Any] {
    return NSDictionary(objects: [article.id,
                               article.name,
                               article.imageName,
                               article.category.rawValue,
                               article.description,
                               article.price
                                ], forKeys: [kID as NSCopying,
                                             kNAME as NSCopying,
                                             kIMAGENAME as NSCopying,
                                             kCATEGORY as NSCopying,
                                             kDESCRIPTION as NSCopying,
                                             kPRICE as NSCopying
    ]) as! [String : Any]
}
//Fonction pour parcourir le tableau et transférer les données dans Firebase
func createMenu(){
    for article in articleData{
        FirebaseReference( .Menu).addDocument(data: articleDictionnaryFrom(article: article))
    }
}


// données qui permettre à placer les données dans Firebase
let articleData = [
    //BOOTS
    Article(id: UUID().uuidString, name: "Boots 1", imageName: "boots-1", category: Category.boots, description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc consectetur bibendum turpis et sagittis. Suspendisse potenti. Vestibulum vitae pellentesque est, at consequat dui.", price: 139.50),
    
    Article(id: UUID().uuidString, name: "Boots 2", imageName: "boots-2", category: Category.boots, description: "Donec sit amet tellus pretium ante interdum facilisis. Maecenas at tortor egestas, suscipit ex pharetra, ullamcorper velit. Quisque vel leo sit amet dui suscipit consectetur. Aliquam pulvinar sem a arcu porttitor, sed imperdiet sem bibendum..", price: 120.00),
    
    Article(id: UUID().uuidString, name: "Boots 3", imageName: "boots-3", category: Category.boots, description: "Nullam ac cursus augue. Donec malesuada massa a libero feugiat, id rhoncus nunc posuere. Suspendisse nec luctus ipsum. Nullam et aliquet enim. Etiam vel ante blandit, volutpat sapien vitae, placerat turpis.", price: 140.50),
    
    Article(id: UUID().uuidString, name: "Boots 4", imageName: "boots-4", category: Category.boots, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 90.50),
    
    Article(id: UUID().uuidString, name: "Boots 5", imageName: "boots-5", category: Category.boots, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 138.50),
    Article(id: UUID().uuidString, name: "Boots 6", imageName: "boots-6", category: Category.boots, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 100.50),
    Article(id: UUID().uuidString, name: "Boots 7", imageName: "boots-7", category: Category.boots, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 200.50),
    Article(id: UUID().uuidString, name: "Boots 8", imageName: "boots-8", category: Category.boots, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 180.50),
        
    //SKIS
    Article(id: UUID().uuidString, name: "Ski 1", imageName: "ski-1", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 450.00),
    
    Article(id: UUID().uuidString, name: "Ski 2", imageName: "ski-2", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus bland", price: 620.00),

    Article(id: UUID().uuidString, name: "Ski 3", imageName: "ski-3", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 520.50),

    Article(id: UUID().uuidString, name: "Ski 4", imageName: "ski-4", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 300.00),
    Article(id: UUID().uuidString, name: "Ski 5", imageName: "ski-5", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 275.00),
    Article(id: UUID().uuidString, name: "Ski 6", imageName: "ski-6", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 455.00),
    Article(id: UUID().uuidString, name: "Ski 7", imageName: "ski-7", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 400.00),
    Article(id: UUID().uuidString, name: "Ski 8", imageName: "ski-8", category: Category.ski, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 300.00),
    
    //Helmets
    Article(id: UUID().uuidString, name: "Helmet 1", imageName: "helmet-1", category: Category.helmet, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 940.00),
    
    Article(id: UUID().uuidString, name: "Helmet 2", imageName: "helmet-2", category: Category.helmet, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 903.00),
    
    Article(id: UUID().uuidString, name: "Helmet 3", imageName: "helmet-3", category: Category.helmet, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 800.00),
    
    Article(id: UUID().uuidString, name: "Helmet 4", imageName: "helmet-4", category: Category.helmet, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 892.00),
    
    Article(id: UUID().uuidString, name: "Helmet 5", imageName: "helmet-5", category: Category.helmet, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 860.50),
    Article(id: UUID().uuidString, name: "Helmet 6", imageName: "helmet-6", category: Category.helmet, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    Article(id: UUID().uuidString, name: "Helmet 7", imageName: "helmet-7", category: Category.helmet, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    
    //Poles
    Article(id: UUID().uuidString, name: "Poles 1", imageName: "poles-1", category: Category.poles, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 940.00),
    
    Article(id: UUID().uuidString, name: "Poles 2", imageName: "poles-2", category: Category.poles, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 903.00),
    
    Article(id: UUID().uuidString, name: "Poles 3", imageName: "poles-3", category: Category.poles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 800.00),
    
    Article(id: UUID().uuidString, name: "Poles 4", imageName: "poles-4", category: Category.poles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 892.00),
    
    Article(id: UUID().uuidString, name: "Poles 5", imageName: "poles-5", category: Category.poles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 860.50),

    //Goggles
    Article(id: UUID().uuidString, name: "Goggles 1", imageName: "goggles-1", category: Category.goggles, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 940.00),
    
    Article(id: UUID().uuidString, name: "Goggles 2", imageName: "goggles-2", category: Category.goggles, description: "Nam sit amet sapien in mi iaculis aliquam sed eu sapien. Etiam sit amet ex in neque commodo pulvinar id vel elit. Phasellus vel fringilla urna, vel commodo nibh. Morbi eget sodales felis. Donec ut ante id lectus blandit pellentesque eget at nibh.", price: 903.00),
    
    Article(id: UUID().uuidString, name: "Goggles 3", imageName: "goggles-3", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 800.00),
    
    Article(id: UUID().uuidString, name: "Goggles 4", imageName: "goggles-4", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 892.00),
    
    Article(id: UUID().uuidString, name: "Goggles 5", imageName: "goggles-5", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 860.50),
    Article(id: UUID().uuidString, name: "Goggles 6", imageName: "goggles-6", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    Article(id: UUID().uuidString, name: "Goggles 7", imageName: "goggles-7", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    Article(id: UUID().uuidString, name: "Goggles 8", imageName: "goggles-8", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    Article(id: UUID().uuidString, name: "Goggles 9", imageName: "goggles-9", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),
    Article(id: UUID().uuidString, name: "Goggles 10", imageName: "goggles-10", category: Category.goggles, description: "Etiam interdum eros enim, vitae ornare erat lacinia quis. Proin rhoncus elit at dolor consequat pharetra. Aliquam maximus purus enim, malesuada pretium est mollis non. Nunc sed commodo dolor, hendrerit blandit mi. Maecenas congue justo dapibus justo venenatis tempus id nec dui.", price: 980.50),

]



