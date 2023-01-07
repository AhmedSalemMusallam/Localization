//
//  ViewController.swift
//  Localization
//
//  Created by Ahmed Salem on 07/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var changeLangBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // setting values from our dictionary
        introLabel.text = NSLocalizedString("introLabel", comment: "the intro text")
        changeLangBtn.setTitle(NSLocalizedString("changeLangBtn", comment: "the change button language"), for: .normal)
    }


    @IBAction func changeLangAction(_ sender: UIButton) {
        
        showChangeLangActionSheet()
        
    }
    
    // Mark:- private functions
    private func showChangeLangActionSheet()
    {
        let alert = UIAlertController(title: NSLocalizedString("ChangeLangActionSheetTitle", comment: "action title"), message: NSLocalizedString("ChangeLangActionSheetMessage", comment: "action message"), preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("ChangeLangActionYes", comment: "action yes"), style: .default , handler:{ (UIAlertAction)in
            guard let currentLang = Locale.current.language.languageCode?.identifier as? String else { return }
            
            print("current Lang : \(currentLang)")
            
            let newLanguage = currentLang == "en" ? "ar" : "en"
            
            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
            exit(0)
        }))
        
        
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("ChangeLangActionNo", comment: "action no"), style: .destructive , handler:{ (UIAlertAction)in
            print("Do no thing.")
        }))
        
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}


