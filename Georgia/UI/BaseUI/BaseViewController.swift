//
//  BaseViewController.swift
//  English
//
//  Created by Константин Ирошников on 06.07.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        desingUI()
        
        layoutUI()
        
        lissenVM()
    }
    
    func desingUI() {}
    
    func layoutUI() {}
    
    func lissenVM() {}
}
