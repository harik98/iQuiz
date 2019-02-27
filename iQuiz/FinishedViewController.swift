//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Hari Kaushik on 2/20/19.
//  Copyright © 2019 Hari Kaushik. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  var numQs: Int = 1
  var numCorrect : Int = 0
  

  @IBOutlet weak var lblScore: UILabel!
  @IBOutlet weak var endMsg: UILabel!
  override func viewDidLoad() {
    super.viewDidLoad()
  
    if(numQs < 1){
      lblScore.text = "Invalid Score"
      endMsg.text = ""
    }else{
      var score: Double = (Double(numCorrect) / Double(numQs))
      score = round(score * 10)/10;
      var message = ""
      if(score == 1){
        message = "Perfect score! You are awesome!"
      } else if(score > 0.6 && score < 1){
        message = "Well Done"
      } else if(score < 0.6){
        message = "Do better next time..."
      }
      lblScore.text = "\(numCorrect)/\(numQs)"
      endMsg.text = message
    }
    // Do any additional setup after loading the view.
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
