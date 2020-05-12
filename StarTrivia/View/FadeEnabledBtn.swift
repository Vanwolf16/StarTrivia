//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class FadeEnabledBtn:UIButton{
    override var isEnabled: Bool{
        didSet{
            if isEnabled{
                UIView.animate(withDuration: 0.2) {
                     self.alpha = 1.0
                }
               
            }else{
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
