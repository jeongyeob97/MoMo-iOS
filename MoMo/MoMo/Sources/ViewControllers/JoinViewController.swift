//
//  JoinViewController.swift
//  MoMo
//
//  Created by 초이 on 2021/01/12.
//

import UIKit

class JoinViewController: UIViewController {
    
    // MARK: - Constants
    private let emailFormatErrorMessage = "email must be a valid email"
    private let emailInUseErrorMessage = "사용 불가능한 이메일입니다."
    
    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var passwordCheckView: UIView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordCheckLabel: UILabel!
    
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var passwordCheckErrorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordCheckTextField: UITextField!
    
    @IBOutlet weak var infoAgreeButton: UIButton!
    @IBOutlet weak var serviceAgreeButton: UIButton!
    
    @IBOutlet weak var infoTermButton: UIButton!
    @IBOutlet weak var serviceTermButton: UIButton!
    
    @IBOutlet weak var joinButton: UIButton!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initializeViewBorders()
        initializeNavigationBar()
        initializeJoinButtonCornerRadius()
        initializePlaceholder()
        initializeAgreeButtons()
        initializeAgreeButtonTexts()
        hideErrorLabels()
        makeClearButtons()
        assignDelegate()
    
    }
    
    // MARK: - @IBAction Properties
    
    @IBAction func infoButtonTouchUp(_ sender: Any) {
        // 약관 동의 시 checkbox toggle
        infoAgreeButton.isSelected.toggle()
    }
    @IBAction func serviceButtonTouchUp(_ sender: Any) {
        serviceAgreeButton.isSelected.toggle()
    }
    
    // MARK: - Functions
    
    func assignDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordCheckTextField.delegate = self
    }
    
    func initializeViewBorders() {
        // view border
        emailView.layer.borderColor = UIColor.Black5Publish.cgColor
        emailView.layer.borderWidth = 1
        passwordView.layer.borderColor = UIColor.Black5Publish.cgColor
        passwordView.layer.borderWidth = 1
        passwordCheckView.layer.borderColor = UIColor.Black5Publish.cgColor
        passwordCheckView.layer.borderWidth = 1
    }
    
    func initializeNavigationBar() {
        // navigation bar 투명화
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    func initializeJoinButtonCornerRadius() {
        // joinButton rounding
        joinButton.clipsToBounds = true
        joinButton.layer.cornerRadius = joinButton.frame.height / 2
    }
    
    func initializePlaceholder() {
        // placeholder
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.Blue5, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])

        passwordTextField.attributedPlaceholder = NSAttributedString(string: "영문 + 숫자 6자리 이상 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.Blue5, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        
        passwordCheckTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 다시 한 번 입력해 주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor.Blue5, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
    }
    
    func initializeAgreeButtons() {
        // 약관 동의 시 checkbox toggle
        infoAgreeButton.setImage(Constants.Design.Image.loginCheckboxIntermediate, for: .normal)
        infoAgreeButton.setImage(Constants.Design.Image.loginCheckbox, for: .selected)
        serviceAgreeButton.setImage(Constants.Design.Image.loginCheckboxIntermediate, for: .normal)
        serviceAgreeButton.setImage(Constants.Design.Image.loginCheckbox, for: .selected)
    }
    
    func initializeAgreeButtonTexts() {
        // 약관 동의 체크박스 부분 bold처리
        let boldText = "[필수]"
        let attrs = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14)]
        let infoTermAttributedString = NSMutableAttributedString(string: boldText, attributes: attrs)
        let serviceTermAttributedString = NSMutableAttributedString(string: boldText, attributes: attrs)

        let infoTerm = " 개인정보 수집이용 동의"
        let infoTermString = NSMutableAttributedString(string: infoTerm)
        
        let serviceTerm = " 서비스 이용약관 동의"
        let serviceTermString = NSMutableAttributedString(string: serviceTerm)

        infoTermAttributedString.append(infoTermString)
        serviceTermAttributedString.append(serviceTermString)
        
        infoTermButton.setAttributedTitle(infoTermAttributedString, for: .normal)
        serviceTermButton.setAttributedTitle(serviceTermAttributedString, for: .normal)
    }
    
    func hideErrorLabels() {
        // 처음 뷰 로드 시 error label hidden 처리
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        passwordCheckErrorLabel.isHidden = true
    }
    
    func makeClearButtons() {
        // clear button 만들기
        emailTextField.modifyClearButtonWithImage(image: Constants.Design.Image.textfieldDelete ?? UIImage())
        passwordTextField.modifyClearButtonWithImage(image: Constants.Design.Image.textfieldDelete ?? UIImage())
        passwordCheckTextField.modifyClearButtonWithImage(image: Constants.Design.Image.textfieldDelete ?? UIImage())
    }
    
    // Email Errors
    func showEmailFormatError() {
        emailErrorLabel.isHidden = false
        emailErrorLabel.text = "올바른 이메일 형식이 아닙니다"
        
        emailLabel.textColor = UIColor.RedError
        emailView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func showEmailBlankError() {
        emailErrorLabel.isHidden = false
        emailErrorLabel.text = "이메일을 입력해 주세요"
        
        emailLabel.textColor = UIColor.RedError
        emailView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func showEmailInUseError() {
        emailErrorLabel.isHidden = false
        emailErrorLabel.text = "MOMO에 이미 가입된 이메일이에요!"
        
        emailLabel.textColor = UIColor.RedError
        emailView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func hideEmailError() {
        emailErrorLabel.isHidden = true
        
        emailLabel.textColor = UIColor.Blue2
        emailView.layer.borderColor = UIColor.Black5Publish.cgColor
    }
    
    // 약관 Errors
    func showInfoTermUncheckedError() {
        infoTermButton.setTitleColor(UIColor.RedError, for: .normal)
    }
    
    func showServiceTermUncheckedError() {
        serviceTermButton.setTitleColor(UIColor.RedError, for: .normal)
    }
    
    // 비밀번호 Errors
    func showPasswordFormatError() {
        passwordErrorLabel.isHidden = false
        passwordErrorLabel.text = "영문 + 숫자 6자리 이상 입력해 주세요"
        
        passwordLabel.textColor = UIColor.RedError
        passwordView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func showPasswordBlankError() {
        passwordErrorLabel.isHidden = false
        passwordErrorLabel.text = "비밀번호를 입력해 주세요"
        
        passwordLabel.textColor = UIColor.RedError
        passwordView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func hidePasswordError() {
        passwordErrorLabel.isHidden = true
        
        passwordLabel.textColor = UIColor.Blue2
        passwordView.layer.borderColor = UIColor.Black5Publish.cgColor
    }
    
    // 비밀번호 체크 Errors
    func showPasswordCheckFormatError() {
        passwordCheckErrorLabel.isHidden = false
        passwordCheckErrorLabel.text = "비밀번호가 일치하지 않습니다"
        
        passwordLabel.textColor = UIColor.RedError
        passwordCheckView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    func showPasswordCheckBlankError() {
        passwordCheckErrorLabel.isHidden = false
        passwordCheckErrorLabel.text = "비밀번호를 다시 입력해 주세요"
        
        passwordLabel.textColor = UIColor.RedError
        passwordCheckView.layer.borderColor = UIColor.RedError.cgColor
    }
    
    // 비밀번호 정규식 검사
    func validatePassword(password : String) -> Bool {
        let passwordRegEx = "^[a-zA-Z0-9!@#$%^&*(),.?\":{}|<>_-]{6,}$"
        
        let predicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return predicate.evaluate(with: password)
    }
    
    // MARK: - API Functions
    // 이메일 확인
    func getSignUpWithAPI(email: String) {
        SignUpService.shared.getSignUp(email: email) { (networkResult) -> (Void) in
            switch networkResult {
            case .success(let msg):
                if let message = msg as? String {
                    // 사용 가능한 이메일
                    self.hideEmailError()
                    print(message)
                }
            case .requestErr(let msg):
                if let message = msg as? String {
                    // 사용 불가능한 이메일
                    if( message == self.emailFormatErrorMessage ) {
                        self.showEmailFormatError()
                    }else if( message == self.emailInUseErrorMessage) {
                        self.showEmailInUseError()
                    }
                    print(message)
                }
            case .pathErr:
                print("pathErr in getSignUpWithApi")
                
            case .serverErr:
                print("serverErr in getSignUpWithApi")
            case .networkFail:
                print("networkFail in getSignUpWithApi")
            }
        }
    }
extension JoinViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTextField {
            guard let email = emailTextField.text else {
                return
            }
            if email != "" {
                self.getSignUpWithAPI(email: email)
            } else {
                self.showEmailBlankError()
            }
            
        // 비밀번호
        } else if textField == passwordTextField {
            guard let password = passwordTextField.text else {
                return
            }
            // 비밀번호가 공백이 아닐 때
            if password != "" {
                // 비밀번호가 정규식에 맞지 않을 때
                if !validatePassword(password: password) {
                    self.showPasswordFormatError()
                } else {
                    // 비밀번호가 정규식에 맞을 때
                    self.hidePasswordError()
                }
            } else {
                // 비밀번호가 공백일 때
                self.showPasswordBlankError()
            }
        
        } else if textField == passwordCheckTextField {
            
        }
    }
}
