//
//  ProdutoViewController.swift
//  ShoppingApp
//
//  Created by Ilana Concilio on 17/04/20.
//  Copyright © 2020 Ilana Concilio. All rights reserved.
//

import UIKit

class ProdutoViewController: UIViewController {
    
    var nomeBanda: String?

    @IBOutlet weak var nomeBandaLabel: UILabel!
    @IBOutlet weak var quantDesejaLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nomeBandaLabel.text = nomeBanda
        quantDesejaLabel.text = "1"

       
    }
    
    @IBAction func voltar(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func mudouStepper(_ sender: UIStepper) {
        quantDesejaLabel.text = String(format: "%.0f",stepper.value)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
