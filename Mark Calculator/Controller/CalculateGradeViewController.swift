//
//  CalculateGradeViewController.swift
//  Mark Calculator
//
//  Created by Areeb Mustafa on 2020-04-06.
//  Copyright © 2020 Areeb Mustafa. All rights reserved.
//

import UIKit

class CalculateGradeViewController: UIViewController {
    
    var array: [Mark] = []
    var helper: HelperMethods = HelperMethods()
    var course: Course!
    var map: [String: Course]!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var currentMarkLabel: UILabel!
    @IBOutlet weak var courseCompletedLabel: UILabel!
    @IBOutlet weak var finalExamWorthLabel: UILabel!
    @IBOutlet weak var toGet50Label: UILabel!
    @IBOutlet weak var toGet60Label: UILabel!
    @IBOutlet weak var toget70Label: UILabel!
    @IBOutlet weak var toGet80Label: UILabel!
    @IBOutlet weak var toGet90Label: UILabel!
    @IBOutlet weak var toGet100Label: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseNameLabel.text = course.getCourseName()
        
        let currentMark = String(format: "%.1f%%",helper.getCurrentMark(marks: array))
        
        currentMarkLabel.text = currentMark
        courseCompletedLabel.text = ""
        let completed = String(format: "%.1f %%",helper.getTotalWorth(marks: array))
        courseCompletedLabel.text = completed
        
        let finalExam = String(format: "%.1f %%",helper.getFinalExamWorth(marks: array))
        finalExamWorthLabel.text = finalExam
        
        if helper.getFinalExamWorth(marks: array) == 0{
            toGet50Label.text = "0.0 %"
            toGet60Label.text = "0.0 %"
            toget70Label.text = "0.0 %"
            toGet80Label.text = "0.0 %"
            toGet90Label.text = "0.0 %"
            toGet100Label.text = "0.0 %"
        }
        else{
            let toGet50 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 50, array: array))
            //toGet50Label.frame = CGRect
            toGet50Label.text = toGet50
            
            let toGet60 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 60, array: array))
            toGet60Label.text = toGet60
            
            let toGet70 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 70, array: array))
            toget70Label.text = toGet70
            
            let toGet80 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 80, array: array))
            toGet80Label.text = toGet80
            
            let toGet90 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 90, array: array))
            toGet90Label.text = toGet90
            
            let toGet100 = String(format: "%.1f %%",helper.calculateToGetNMark(n: 100, array: array))
            toGet100Label.text = toGet100
        }
    }
    @IBAction func backButtonCalcPressed(_ sender: UIButton) {
        array.removeAll()
        self.dismiss(animated: true, completion: nil)
    }
}
