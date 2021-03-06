//
//  MyBookViewController.swift
//  FeatherweightRouter-iOS
//
//  Created by GEORGE QUENTIN on 06/09/2017.
//  Copyright © 2017 Featherweight Labs. All rights reserved.
//

import UIKit

public class MyBookViewController: BaseViewController {

    var viewModel: NavigationModel?
    
    @IBOutlet weak var titleLabel : UILabel!
    
    private var readingData : StudentReadingData?
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(_ viewModel: NavigationModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        initialSetup()
    }
    
    public override func initialSetup() {
        super.initialSetup()
        
        if let model = viewModel, let data = model.student.readingData.first {
            view.backgroundColor = model.backgroundColor
            title = model.title
            titleLabel?.text = data.book.title
            readingData = data
        }
    }

    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

    
}
