//
//  Utils.swift
//  Pizza List
//
//  Created by Marcello Catelli
//  Copyright © Swift srl. All rights reserved.
//

import SwiftUI

// metodi utili
func cartellaDocuments() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    debugPrint(paths[0])
    return paths[0]
}

func loc(_ localizedKey:String) -> String {
    return NSLocalizedString(localizedKey, comment: "")
}

func delay(_ delay:Double, closure:  @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}


func bindBool() -> Binding<Bool> {
    var boolVariable : Bool = true
    let boolVariableBinding : Binding<Bool> = Binding(get: { boolVariable }, set: { boolVariable = $0 })
    return boolVariableBinding
}
