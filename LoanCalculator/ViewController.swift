//
//  ViewController.swift
//  LoanCalculator
//
//  Created by James Cowart on 11/3/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // keyboard type is decimal pad
    @IBOutlet weak var loanNum: UITextField!
    // keyboard type is number pad
    @IBOutlet weak var totalNum: UITextField!
    // keyboard type is decimal pad
    @IBOutlet weak var interestNum: UITextField!
    
    @IBOutlet weak var resultNum: UITextField!
    
    // action to close keyboards when clicking anywhere else
    @IBAction func onTapGetsureRecognized(_ sender: Any) {
        loanNum.resignFirstResponder()
        totalNum.resignFirstResponder()
        interestNum.resignFirstResponder()
    }
    
    @IBAction func onButtonPress(_ sender: UIButton) {

        // guard functions help prevent things from going wrong if values are nil
        guard let loanText = self.loanNum.text, let loan = Float(loanText) else { return }
        guard let totalPayText = self.totalNum.text, let totalPay = Int(totalPayText) else { return }
        guard let interestText = self.interestNum.text, let interest = Float(interestText) else { return }
        
        let interestRate = interest / 100
        let payPeriod: Float = pow((1 + Float(interestRate)), Float(totalPay))
        let result: Float
        result = (Float(loan) * (interestRate * (payPeriod)) / (payPeriod - 1))
        
        resultNum.text = "\(result)"
    }
    
}

