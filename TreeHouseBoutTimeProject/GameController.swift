//
//  GameController.swift
//  TreeHouseBoutTimeProject
//
//  Created by Joey Devlin on 7/30/18.
//  Copyright © 2018 Joey. All rights reserved.
//

import UIKit

class GameController: UIViewController {
    
    var button1: event?
    var button2: event?
    var button3: event?
    var button4: event?
    var seconds: Int = 60
    let correctOrder: [Int] = []
    var timer = Timer()
    var round = 1
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        shakeLabel.isHidden = true
        playAgainButton.isHidden = true
        clock.text = "60"
        newGame()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Game Logic
    
    
    // THIS FUNCTION GRABS 4 UNIQUE EVENTS CALLED AT THE START OF THE GAME
    
    func grabEvent() {
        let event = Events.getEvent()
        let event2 = Events.getEvent()
        let event3 = Events.getEvent()
        let event4 = Events.getEvent()
        button1 = event
        button2 = event2
        button3 = event3
        button4 = event4
        
        if (event.event == event2.event || event.event == event3.event || event.event == event4.event) || (event2.event == event3.event || event2.event == event4.event) || event3.event == event4.event {
            grabEvent()
        }else{
            setallbuttons()
        }
    }
    
    
    // THESE FUNCTIONS SORT AND CHECK THE BUTTON ORDER
    
    
    func correctEventOrder() -> String {
        let currentOrder = [button1!.date, button2!.date, button3!.date, button4!.date]
        let correctOrder = getOrder()
        if currentOrder == correctOrder {
            return "CORRECT"
        }else{
            return "WRONG"
        }
    }
    
    func getOrder() -> [Int] {
        var events = [button1!.date, button2!.date, button3!.date, button4!.date]
        events.sort { $0 < $1 }
        return events
    }
    
    
    // MARK: - Timer Logic
    
    
    // THIS FUNCTION CALLS THE TIMER TO START RUNNING
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(GameController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    
    //THIS FUNCTION UPDATES THE TIMER ON SCREEN
    @objc func updateTimer(){
        if seconds < 1 {
            timer.invalidate()
            roundOver()
            loadNextRound(delay: 2)
        }else {
            seconds -= 1
            clock.text = "\(seconds)"
        }
        
    }
    
    //MARK: - Buttons and Labels
    
    // Buttons -
        // Text Moving Buttons
    @IBAction func topFullDown(_ sender: Any) {
        let b1 = button1
        let b2 = button2
        
        button1 = b2
        button2 = b1
        
        setButton1()
        setbutton2()
    }
    @IBAction func upMidUp(_ sender: Any) {
        let b1 = button1
        let b2 = button2
        
        button1 = b2
        button2 = b1
        setButton1()
        setbutton2()
    }
    @IBAction func upMidDown(_ sender: Any) {
        let b2 = button2
        let b3 = button3
        
        button2 = b3
        button3 = b2
        
        setbutton3()
        setbutton2()
    }
    @IBAction func lowerMidUp(_ sender: Any) {
        let b2 = button2
        let b3 = button3
        
        button2 = b3
        button3 = b2
        
        setbutton3()
        setbutton2()
    }
    @IBAction func lowerMidDown(_ sender: Any) {
        let b3 = button3
        let b4 = button4
        
        button4 = b3
        button3 = b4
        
        setbutton4()
        setbutton3()
    }
    @IBAction func bottomFullUp(_ sender: Any) {
        let b3 = button3
        let b4 = button4
        
        button4 = b3
        button3 = b4
        
        setbutton4()
        setbutton3()
    }
    
    // Play Again Button
    
    @IBAction func playAgain(_ sender: Any) {
        newGame()
    }
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    // Button Setting Functions
    
    func setButton1() {
        event1Label.text = button1?.event
    }
    func setbutton2() {
        event2Label.text = button2?.event
    }
    func setbutton3() {
        event3Label.text = button3?.event
    }
    func setbutton4() {
        event4Label.text = button4?.event
    }
    
    func setallbuttons() {
        setButton1()
        setbutton2()
        setbutton3()
        setbutton4()
    }
    
    //Labels -
    @IBOutlet weak var clock: UILabel!
    @IBOutlet weak var event1Label: UILabel!
    @IBOutlet weak var event2Label: UILabel!
    @IBOutlet weak var event3Label: UILabel!
    @IBOutlet weak var event4Label: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    //Shake Dector
    
    @IBOutlet weak var shakeLabel: UILabel!
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            timer.invalidate()
            roundOver()
            loadNextRound(delay: 2)
        }
    }
    
    // Round Logic
    
    func newGame() {
        playAgainButton.isHidden = true
        scoreLabel.isHidden = false
        roundLabel.isHidden = false
        seconds = 60
        score = 0
        round = 1
        startRound()
    }
    
    func startRound() {
        scoreLabel.text = "Score: \(score)"
        roundLabel.text = "Round: \(round)"
        round += 1
        grabEvent()
        runTimer()
        
    }
    
    func nextRound() {
        if round <= 6 {
            seconds = 60
            startRound()
        }else {
            gameOver()
        }
    }
    
    func roundOver() {
        let winLoose = correctEventOrder()
        if winLoose == "CORRECT"{
            clock.text = "CORRECT"
            score += 1
        }
        if winLoose == "WRONG" {
            clock.text = "WRONG"
        }
    }
    
    func loadNextRound(delay seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
        
    }
    // Game Over Logic
    
    func gameOver() {
        playAgainButton.isHidden = false
        scoreLabel.isHidden = true
        roundLabel.isHidden = true
        clock.text = "Congrats you scored \(score)"
        event1Label.text = "Thank You"
        event2Label.text = "For"
        event3Label.text = "Playing"
        event4Label.text = "You're Awesome!!"
    }
    
    
}
