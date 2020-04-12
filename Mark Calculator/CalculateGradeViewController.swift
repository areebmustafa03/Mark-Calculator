//
//  CalculateGradeViewController.swift
//  Mark Calculator
//
//  Created by Areeb Mustafa on 2020-04-06.
//  Copyright © 2020 Areeb Mustafa. All rights reserved.
//

import UIKit

class CalculateGradeViewController: UIViewController {
    
    var viewController: ViewController = ViewController()
    var array: [Mark] = []
    var helper: HelperMethods = HelperMethods()
    var course: Course!
    
    @IBOutlet weak var courseNameLabel: UILabel!
    
    @IBOutlet weak var currentMarkLabel: UILabel!
    
  
    @IBOutlet weak var courseCompletedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseNameLabel.text = course.getCourseName()
        
        let currentMark = String(format: "%.1f%%",getCurrentMark(marks: array))
        
        currentMarkLabel.text = currentMark
        courseCompletedLabel.text = ""
        let completed = String(format: "%.1f%%",helper.getTotalWorth(marks: array))
        courseCompletedLabel.text = completed
        
    }
    
    
    @IBAction func backButtonCalcPressed(_ sender: UIButton) {
        array.removeAll()
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addCoursePressed(_ sender: UIButton) {
        
        // backend clear screen add to hashmap
        print("Course was added")
        self.dismiss(animated: true, completion: nil)
    }
    func getFinalExamWorth(marks:[Mark]) -> Float {
        var total: Float = 0
        total = 100 - helper.getTotalWorth(marks: marks)
        return total
    }
    func getCurrentMark(marks: [Mark]) ->Float{
        var totalMark:  Float = 0
        let check = helper.getTotalWorth(marks: array)
        if check == 0{
            return 0.0
        }
        totalMark = helper.getTotalPercentOfCourse(marks: marks) / helper.getTotalWorth(marks: marks)
        //print("total Mark is \ (totalMark)" )
        totalMark = totalMark  * 100
        return totalMark
    }
}
