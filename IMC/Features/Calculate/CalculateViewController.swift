//
//  ViewController.swift
//  IMC
//
//  Created by Pedro Henrique on 10/07/21.
//

import UIKit

 class ViewController: UIViewController {
    
    // MARK: Properties
    private var viewModel: CalculateViewModel = CalculateViewModel()
    
    
    // MARK: Outlets
    @IBOutlet weak var WeightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var labelIMC: UILabel!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageResult: UIImageView!
    
    
    // MARK: Initialization
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        bindEvents()
    }
    
    // MARK: Actions
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(WeightTextField.text!),
           let height = Double(heightTextField.text!) {
        
         viewModel.makeImc(height: height, weight: weight)
        } else {
            let alert = UIAlertController(
                         title: "Ops.. Algo de errado",
                         message: "Tente preencher todos os campos corretamente ou substituir a `,` por `.`", preferredStyle: .alert)
                 alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                 self.present(alert, animated: true, completion: nil)
             }
         }
    
    // MARK: Methods
    private func bindEvents() {
        viewModel.shouldUpdateImage = { [weak self] imageSelected in
                   self?.imageResult.image = UIImage(named: imageSelected)
               }
        
        viewModel.shouldUpdateResult = { [weak self] finalResult in
                    self?.labelResult.text = finalResult
               }
        
        viewModel.shouldUpdateImc = { [weak self] finalIMC in
                    self?.labelIMC.text = "Seu IMC é \(String(format: "%.2f", finalIMC))"
               }
        }
}

