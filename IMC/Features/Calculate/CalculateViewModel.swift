//
//  CalculateViewModel.swift
//  IMC
//
//  Created by Pedro Henrique on 13/07/21.
//

import Foundation


final class CalculateViewModel{
    
    // MARK: Properties
    private var imc: Double = 0
    var shouldUpdateImc: ((Double) -> Void)?
    var shouldUpdateImage: ((String) -> Void)?
    var shouldUpdateResult: ((String) -> Void)?
    
    
    // MARK: Methods
    func makeImc (height: Double, weight: Double){
        imc = weight / pow(height, 2)
        showResult()
    }
    
    func showResult(){
        var result: String = ""
        var image: String = ""
        
        switch imc {
        case 0..<15.99:
                result="Magreza"
                image="magreza"
        case 16.00..<18.49:
                result="Abaixo do Peso"
                image="abaixo"
            case 18.50..<24.99:
                result="Peso Ideal"
                image="ideal"
        case 25.00..<29.99:
                result="Sobrepeso"
                image="sobrepeso"
        case 30.00..<34.99:
                result="Obesidade 1"
                image="obesidade"
        case 35.00..<39.99:
                result="Obesidade 2"
                image="obesidade"
            default:
                result="Obesidade 3"
                image="obesidade"
        }
        updateContent(result: result, image: image)
    }
    
    func updateContent(result: String, image:String){
        shouldUpdateImage?(image)
        shouldUpdateResult?(result)
        shouldUpdateImc?(imc)
    }
}
