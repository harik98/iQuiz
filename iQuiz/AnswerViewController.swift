//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Hari Kaushik on 2/20/19.
//  Copyright © 2019 Hari Kaushik. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
  var jsonData: [Quiz]? = nil
  var categoryIndex: Int = -1
  var questionAnswered = 0
  var currQ: Int = -1
  var lastSelected: Int = -1
  var qCorrect = 0

  @IBOutlet weak var lblQuestion: UILabel!
  @IBOutlet weak var lblUserAnswer: UILabel!
  @IBOutlet weak var lblCorrectAnswer: UILabel!
  @IBOutlet weak var lblResult: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    questionAnswered += 1
    lblUserAnswer.text = jsonData?[categoryIndex].questions[currQ].answers[lastSelected]
    lblQuestion.text = jsonData?[categoryIndex].questions[currQ].text
  
    let correctAnswerIndex = Int((jsonData?[categoryIndex].questions[currQ].answer)!)! - 1; //adjusted to zero based
  
    lblCorrectAnswer.text = jsonData?[categoryIndex].questions[currQ].answers[correctAnswerIndex]
  
    if(correctAnswerIndex == lastSelected){
      qCorrect += 1
      lblResult.text = "Correct! Current Score: \(qCorrect) / \(questionAnswered)"
    }else{
      lblResult.text = "Wrong, Current Score: \(qCorrect) / \(questionAnswered)"
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func nextView(_ sender: Any) {
    if(currQ == (jsonData?[categoryIndex].questions.count)! - 1){
      performSegue(withIdentifier: "toFinish", sender: self)
    } else{
      currQ += 1
      performSegue(withIdentifier: "toNextQuestion", sender: self)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
    if(segue.identifier == "toFinish"){
      
      let dest = segue.destination as! FinishedViewController
      dest.numCorrect = qCorrect
      dest.numQs = (jsonData?[categoryIndex].questions.count)!
      
    } else if (segue.identifier == "toNextQuestion"){
      
      let dest = segue.destination as! QuestionViewController
      dest.jsonData = jsonData
      dest.currQ = currQ
      dest.questionAnswered = questionAnswered
      dest.qCorrect = qCorrect
      dest.categoryIndex = categoryIndex
      
    }
  }

}
