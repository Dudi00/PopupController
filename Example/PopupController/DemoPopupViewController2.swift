//
//  DemoPopupViewController2.swift
//  PopupController
//
//  Created by 佐藤 大輔 on 2/4/16.
//  Copyright © 2016 Daisuke Sato. All rights reserved.
//

import UIKit

class DemoPopupViewController2: UIViewController, PopupContentViewController, UITableViewDataSource {
    
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var timer:NSTimer?
    var fruits = [
        ("Apple", UIColor.redColor()),
        ("Banana", UIColor.yellowColor()),
        ("Grape", UIColor.purpleColor()),
        ("Orange", UIColor.orangeColor()),
        ("Apple", UIColor.redColor()),
        ("Banana", UIColor.yellowColor()),
        ("Grape", UIColor.purpleColor()),
        ("Orange", UIColor.orangeColor()),
        ("Apple", UIColor.redColor()),
        ("Banana", UIColor.yellowColor()),
        ("Grape", UIColor.purpleColor()),
        ("Orange", UIColor.orangeColor()),
        ("Apple", UIColor.redColor()),
        ("Banana", UIColor.yellowColor()),
        ("Grape", UIColor.purpleColor()),
        ("Orange", UIColor.orangeColor())
    ]
    var fruitsCount:Int = 16
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: #selector(handleTimer), userInfo: nil, repeats: true)
    }
    
    func handleTimer() {
        fruitsCount = Int(arc4random_uniform(15)+1)
        tableView.reloadData()
        print("reload, new count \(fruitsCount)")
        print("parent \(self.parentViewController)")
        self.parentViewController?.viewDidLayoutSubviews()
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.view.layer.cornerRadius = 4
    }
    
    class func instance() -> DemoPopupViewController2 {
        let storyboard = UIStoryboard(name: "DemoPopupViewController2", bundle: nil)
        return storyboard.instantiateInitialViewController() as! DemoPopupViewController2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sizeForPopup(popupController: PopupController, size: CGSize, showingKeyboard: Bool) -> CGSize {
        var newSize = CGSizeMake(300, 0)
        newSize.height = CGFloat((fruitsCount * 70)) + CGFloat(titleView.frame.height)
        print(newSize)
        return newSize
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsCount
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! DemoPopup2Cell
        let (text, color) = fruits[indexPath.row]
        cell.colorView.backgroundColor = color
        cell.titleLabel.text = text
        
        return cell
    }
    
}

class DemoPopup2Cell: UITableViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
}
