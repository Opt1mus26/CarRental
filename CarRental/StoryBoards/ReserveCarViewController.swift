//
//  ReserveCarViewController.swift
//  CarRental
//
//  Created by Павел Цыганов on 15.11.2021.
//

import UIKit



class ReserveCarViewController: UIViewController {
    
    @IBOutlet var carImage: UIImageView!
    @IBOutlet var carModel: UILabel!
    @IBOutlet var lastNameTF: UITextField!
    @IBOutlet var nameTF: UITextField!
    @IBOutlet var reserveDateFrom: UITextField!
    @IBOutlet var reserveDateBefore: UITextField!
    @IBOutlet var bottomConstraint: NSLayoutConstraint!
    
    let datePicker = UIDatePicker()
    private var login = Login(name: "", lastName: "", dateFrom: "", dateBefore: "")
    //    var car: Car!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        carImage.image = UIimage(car.image)
        //        carImage.text = String(car.model)
        nameTF.text = String(login.name)
        lastNameTF.text = String(login.lastName)
        reserveDateFrom.text = String(login.dateFrom)
        reserveDateBefore.text = String(login.dateBefore)
        nameTF.delegate = self
        lastNameTF.delegate = self
        reserveDateFrom.delegate = self
        reserveDateBefore.delegate = self
        
        lastNameTF.returnKeyType = .next
        nameTF.returnKeyType = .done
        nameTF.isEnabled = true
        nameTF.enablesReturnKeyAutomatically = true
        
        reserveDateFrom.inputView = datePicker
        reserveDateBefore.inputView = datePicker
        datePicker.preferredDatePickerStyle = .inline
        datePicker.backgroundColor = .white
        datePicker.datePickerMode = .date
        datePicker.locale = Locale.current
        datePicker.locale = Locale(identifier: "ru_RU")
        
        //        let toolbar = UIToolbar()
        //        toolbar.sizeToFit()
        //        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        //        toolbar.setItems([doneButton], animated: true)
        //        reserveDate.inputAccessoryView = toolbar
        
        datePicker.addTarget(self, action: #selector(dataChanger), for: .valueChanged)
        
        let taoGensture = UITapGestureRecognizer(target: self, action: #selector(tapGenstureDone))
        taoGensture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(taoGensture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            UIView.animate(withDuration: 0.5, animations: {
                self.bottomConstraint.constant = height + 20
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        if let frame = notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let height = frame.cgRectValue.height
            UIView.animate(withDuration: 0.5, animations: {
                self.bottomConstraint.constant = height - 240
                self.view.layoutIfNeeded()
                
            })
        }
    }
    //    @objc func doneAction() {
    //        getDateFromPicker()
    //        view.endEditing(true)
    //    }
    
    @objc func tapGenstureDone() {
        self.view.endEditing(true)
    }
    
    @objc func dataChanger() {
        getDateFromPicker()
        view.endEditing(true)
    }
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        
        if reserveDateFrom.isFirstResponder {
            reserveDateFrom.text = formatter.string(from: datePicker.date)
        } else if reserveDateBefore.isFirstResponder {
            reserveDateBefore.text = formatter.string(from: datePicker.date)
        }
    }
    
    @IBAction func reserveCar() {
        
        view.endEditing(true)
        
        nameTF.resignFirstResponder()
        lastNameTF.resignFirstResponder()
        
        guard let lastName = lastNameTF.text, !lastName.isEmpty,
              let name = nameTF.text, !name.isEmpty else {
                  showAlert(
                    title: "Вы не заполнили ФИО",
                    message: "Пожалуйста, введите Фамилию, Имя и Отчетство",
                    textField: lastNameTF)
                  return
              }
        
        if let _ = Int(lastName) {
            showAlert(
                title: "Неверный формат",
                message: "Пожалуйста, введите Фамилию, Имя и Отчетство буквами",
                textField: lastNameTF)
            nameTF.text = nil
        } else if let _ = Int(name) {
            showAlert(
                title: "Неверный формат",
                message: "Пожалуйста, введите Фамилию, Имя и Отчетство буквами",
                textField: lastNameTF)
            nameTF.text = nil
        }
        return
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let gratitudeVC = segue.destination as? GratitudeViewController else { return }
        gratitudeVC.login = login
    }
    @IBAction func unwind(for segue: UIStoryboardSegue) {
    }
    
    //    //MARK: - ScrollKeyboard
    //    deinit {
    //        removeKeyboardNotifications()
    //    }
    //
    //    func registerForKeyboardNotifications() {
    //        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    //        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    //    }
    //    func removeKeyboardNotifications() {
    //        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    //        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    //    }
    //
    //    @objc func kbWillShow(_ notification: Notification) {
    //        let userInfo = notification.userInfo
    //        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
    //        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize?.height ?? 200)
    //    }
    //    @objc func kbWillHide(_ notification: Notification) {
    //        scrollView.contentOffset = CGPoint.zero
    //    }
}

extension ReserveCarViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension ReserveCarViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == lastNameTF {
            nameTF.becomeFirstResponder()
        } else {
            reserveCar()
            performSegue(withIdentifier: "showGratitudeVC", sender: nil)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        
        if textField == nameTF {
            login.name = newValue
        } else if textField == lastNameTF {
            login.lastName = newValue
        } else if textField == reserveDateFrom {
            login.dateFrom = newValue
        } else {
            login.dateBefore = newValue
        }
    }
}


