//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by Hari Kaushik on 2/20/19.
//  Copyright © 2019 Hari Kaushik. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    
  //these would be passed in from main view controller
  @IBOutlet weak var lblQuestion: UILabel!
  
  @IBOutlet weak var btnAnswer3: UIButton!
  @IBOutlet weak var btnAnswer2: UIButton!
  @IBOutlet weak var btnAnswer1: UIButton!
  @IBOutlet weak var btnAnswer4: UIButton!
  
  var jsonData: [Quiz]? = nil
  var categoryIndex: Int = -1
  var currQ = 0;
  var lastSelected: Int = -1
  var questionAnswered = 0;
  var qCorrect = 0;
  
  @IBAction func answerOneSelected(_ sender: UIButton) {
    lastSelected = 0
    sender.backgroundColor = UIColor.lightGray
    btnAnswer2.backgroundColor = UIColor.white
    btnAnswer3.backgroundColor = UIColor.white
    btnAnswer4.backgroundColor = UIColor.white
  }
  
  @IBAction func answerTwoSelected(_ sender: UIButton) {
    lastSelected = 1
    sender.backgroundColor = UIColor.lightGray
    btnAnswer1.backgroundColor = UIColor.white
    btnAnswer3.backgroundColor = UIColor.white
    btnAnswer4.backgroundColor = UIColor.white
  }
  
  @IBAction func answerThreeSelected(_ sender: UIButton) {
    lastSelected = 2
    sender.backgroundColor = UIColor.lightGray
    btnAnswer1.backgroundColor = UIColor.white
    btnAnswer2.backgroundColor = UIColor.white
    btnAnswer4.backgroundColor = UIColor.white
  }
  
  @IBAction func answerFourSelected(_ sender: UIButton) {
    lastSelected = 3
    sender.backgroundColor = UIColor.lightGray
    btnAnswer1.backgroundColor = UIColor.white
    btnAnswer2.backgroundColor = UIColor.white
    btnAnswer3.backgroundColor = UIColor.white
  }
  override func viewDidLoad() {
    super.viewDidLoad()
  
    lblQuestion.text = jsonData?[categoryIndex].questions[currQ].text
    btnAnswer1.setTitle(jsonData?[categoryIndex].questions[currQ].answers[0], for: .normal)
    btnAnswer2.setTitle(jsonData?[categoryIndex].questions[currQ].answers[1], for: .normal)
    btnAnswer3.setTitle(jsonData?[categoryIndex].questions[currQ].answers[2], for: .normal)
    btnAnswer4.setTitle(jsonData?[categoryIndex].questions[currQ].answers[3], for: .normal)
  
    // Do any additional setup after loading the view.
  }

  
  @IBAction func submitPressed(_ sender: Any) {
    if(lastSelected == -1){
      let alert = UIAlertController(title: "No Selection", message: "Please select an answer to continue.", preferredStyle: UIAlertController.Style.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
    
      self.present(alert, animated: true, completion: nil)
    } else {
      performSegue(withIdentifier: "toReveal", sender: self)
    }
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "toReveal") {
      let dest = segue.destination as! AnswerViewController
      dest.lastSelected = lastSelected
      dest.categoryIndex = categoryIndex
      dest.jsonData = jsonData
      dest.currQ = currQ
      dest.questionAnswered = questionAnswered
      dest.qCorrect = qCorrect
    }
  }
  
  
}
