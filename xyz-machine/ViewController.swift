//
//  ViewController.swift
//  xyz-machine
//
//  Created by Viktor Yamchinov on 27.11.2019.
//  Copyright © 2019 Viktor Yamchinov. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var Xlbl: UILabel!
    @IBOutlet weak var YLbl: UILabel!
    @IBOutlet weak var ZLbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometrData = data else { return }
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: accelerometrData.acceleration.x)!
        let y = formatter.string(for: accelerometrData.acceleration.y)!
        let z = formatter.string(for: accelerometrData.acceleration.z)!
        
        Xlbl.text = "X: \(x)"
        YLbl.text = "Y: \(y)"
        ZLbl.text = "Z: \(z)"
    }


}

