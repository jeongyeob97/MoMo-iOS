//
//  StatisticsViewController.swift
//  MoMo
//
//  Created by 이정엽 on 2021/01/29.
//

import UIKit

class StatisticsViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var depthButton: UIButton!
    @IBOutlet weak var moodButton: UIButton!
    @IBOutlet weak var statContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavigationItem()
        print(self.statContainerView.frame)
        print(self.statContainerView.bounds)
    }

    // MARK: - Private Function
    private func initializeNavigationItem() {
        let backButton = UIBarButtonItem(image: Constants.Design.Image.btnBackBlack, style: .plain, target: self, action: #selector(touchBackButton))
        backButton.tintColor = .black
        
        self.navigationItem.leftBarButtonItem = backButton
        self.navigationItem.title = "이 달의 통계"
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.Black1]
        
    }
    
    // MARK: - Selector Function
    @objc func touchBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBActions
    
    @IBAction func touchMoodButton(_ sender: Any) {
        guard let moodStatViewController = storyboard?.instantiateViewController(identifier: Constants.Identifier.moodStatViewController) as? MoodStatViewController else {
            return
        }
        addChild(moodStatViewController)
        moodStatViewController.view.frame = statContainerView.bounds
        statContainerView.addSubview(moodStatViewController.view)
        
    }
 
    @IBAction func touchDepthButton(_ sender: Any) {
        
    }
    
}
