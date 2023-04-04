//
//  FinalViewController.swift
//  Add Users intf
//
//  Created by user238064 on 4/3/23.
//

import UIKit

class FinalViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var education: UITextField!
    @IBOutlet weak var dateAndTime: UITextField!
    @IBOutlet weak var dob: UITextField!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var squareOne: UIButton!
    @IBOutlet weak var squareTwo: UIButton!
    @IBOutlet weak var squareThree: UIButton!
    @IBOutlet weak var squareFour: UIButton!
    
    @IBOutlet var allStars: [UIButton]!
    @IBOutlet weak var submitSelected: UIButton!
    
    
    @IBAction func dobcal(_ sender: UIButton) {
        let pickdate : UIDatePicker = UIDatePicker()
        pickdate.datePickerMode = .date
        pickdate.addTarget(self, action: #selector(dueDateChanged(picker:)), for: UIControl.Event.valueChanged)
        pickdate.frame.size = CGSize(width: 0, height: 50)
        self.view.addSubview(pickdate)

        dob.inputView = pickdate
        dob.text = formateDate(date: pickdate.date)
        
    }
    @objc func dueDateChanged(picker: UIDatePicker){
        dob.text = formateDate(date: picker.date)
        
    }
    func formateDate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
        
    }
    
    @IBAction func dateAndTimeBut(_ sender: UIButton) {
        let pickdat : UIDatePicker = UIDatePicker()
        pickdat.datePickerMode = .dateAndTime
        pickdat.addTarget(self, action: #selector(dueDateChanged2(pickdat:)), for: UIControl.Event.valueChanged)
        pickdat.frame.size = CGSize(width: 0, height: 50)
        self.view.addSubview(pickdat)
        dateAndTime.inputView = pickdat
        dateAndTime.text = formateDate2(date: pickdat.date)
        
        
    }
    @objc func dueDateChanged2(pickdat: UIDatePicker){
        dateAndTime.text = formateDate2(date: pickdat.date)
        
    }
    func formateDate2(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy | hh:mm"
        return formatter.string(from: date)
        
    }
    var flag1 = false
    var flag2 = false
    var flag3 = false
    var flag4 = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self
        education.delegate = self
          // Do any additional setup after loading the view.
    }
    

    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    func displayAlertMessage(messagetoDisplay: String){
        let alertController = UIAlertController(title: "Alert", message: messagetoDisplay, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    
                    // Code in this block will trigger when OK button tapped.
                    print("Ok button tapped");
                    
                }
                
                alertController.addAction(OKAction)
                
                self.present(alertController, animated: true, completion:nil)    }
    
    @IBAction func square1(_ sender: UIButton){
            sender.setImage((UIImage(named: "Component 41 – 8")), for: UIControl.State.normal)
            squareTwo.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
        squareThree.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
        squareFour.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    }
    

    @IBAction func square2(_ sender: UIButton) {
        sender.setImage((UIImage(named: "Component 41 – 8")), for: UIControl.State.normal)
        squareOne.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareThree.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareFour.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
           }
    
    @IBAction func square3(_ sender: UIButton) {
        sender.setImage((UIImage(named: "Component 41 – 8")), for: UIControl.State.normal)
        squareTwo.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareOne.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareFour.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)             }
    
    @IBAction func square4(_ sender: UIButton) {
        sender.setImage((UIImage(named: "Component 41 – 8")), for: UIControl.State.normal)
        squareTwo.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareThree.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)
    squareOne.setImage((UIImage(named: "Rectangle 3754")), for: UIControl.State.normal)           }
    
    @IBAction func starButton(_ sender: UIButton) {
        for button in allStars{
            if button.tag <= sender.tag{
                button.setImage(UIImage(named: "star-symbol-icon-1"), for: .normal)
            }
            else{
                button.setImage(UIImage(named: "star-half-yellow-icon"), for: .normal)
            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        @IBAction func submitSelected(_ sender: UIButton) {
            guard let providedEmailAddress = email.text else { return  }
            let isEmailAddressValid = isValidEmailAddress(emailAddressString: providedEmailAddress)
            if isEmailAddressValid{
                print("Email address is valid")
            }
            else{
                print("Email adress is not valid")
                displayAlertMessage(messagetoDisplay: "Email adress is not valid ")
            }
            self.dismiss(animated: true)
            
        }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        slider.value = roundf(slider.value )   }
    
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
