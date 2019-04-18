//
//  TeaViewController.swift
//  Tea Master
//
//  Created by Luis Flores on 4/17/19.
//  Copyright © 2019 Tec. All rights reserved.
//

import UIKit

class TeaViewController: UIViewController {
    var tea: Tea?
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var rating: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.tintColor = UIColor(hex: 0x74B24B)
//        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        if let tea = tea {
            brand.text = tea.brand
            name.text = tea.name
            type.text = tea.type.rawValue
            rating.rating = tea.rating
        }
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
