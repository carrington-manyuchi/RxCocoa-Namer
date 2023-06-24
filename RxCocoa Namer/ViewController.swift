//
//  ViewController.swift
//  RxCocoa Namer
//
//  Created by DA MAC M1 157 on 2023/06/24.
//

import UIKit

import RxSwift
import RxCocoa




class ViewController: UIViewController {
    
    @IBOutlet weak var helloLbl: UILabel!
    @IBOutlet weak var nameEntryTextField: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var namesLbl: UILabel!
    
    let disposeBag = DisposeBag()
    
 
    
    //var namesArray = Variable([])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        nameEntryTextField.rx.text.debounce(.milliseconds(500), scheduler: MainScheduler.instance)
                    .map {
                        if $0 == "" {
                            return "Type your name below"
                        } else {
                           return
                            "Hello, \($0!)."
                        }
        
                    }
                    .bind(to: helloLbl.rx.text)
                    .disposed(by: disposeBag)
            }
    


}

