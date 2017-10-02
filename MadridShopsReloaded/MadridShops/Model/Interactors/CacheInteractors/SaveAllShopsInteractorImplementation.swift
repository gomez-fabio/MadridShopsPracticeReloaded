//
//  SaveAllShopsInteractorImplementation.swift
//  MadridShops
//
//  Created by Fabio Gomez on 26/9/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import CoreData

class SaveAllShopsInteractorImplementation: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            
            let _ = mapShopIntoShopCD(context: context, shop: shop)
        }
        do{
            try context.save()
            onSuccess(shops)
        } catch{
        }
    }
}
