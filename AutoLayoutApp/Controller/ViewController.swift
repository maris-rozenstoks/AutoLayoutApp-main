//
//  ViewController.swift
//  AutoLayoutApp
//
//  Created by Arkadijs Makarenko on 20/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var styleOutletsCollection: [UIButton]!
    
    
    @IBOutlet weak var pictureButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    var darkTheme = false
    var mainText = "Dark Theme Off"
    
    @IBOutlet weak var buttonColor: UIButton!
    var darkButton = true //change "Button Color" to any other color.
    
    @IBOutlet weak var textButton: UIButton!
    var changeText = true
    
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var dinamitePicture: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        darkThemeIsOn(ison: darkTheme)
        
        styleOutletsCollection.forEach { button in
            button.layer.cornerRadius = 15
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.black.cgColor
        }
    }
#warning("Button A,B should be on the bottom of the screen, CDE, on the top")
#warning("add button style: icon, title, color")
#warning("when press on button I'm hiding some buttons, or changing the view color, image")
    
    
    @IBAction func changePictureButtonTapped(_ sender: Any){
        if dinamitePicture.image == UIImage(named: "leopard") {
            dinamitePicture.image = UIImage(named: "dinamite")
        } else {
            dinamitePicture.image = UIImage(named: "leopard")
        }
    }
    
    @IBAction func changeBackgroundButtonTapped(_ sender: Any) {
        
        print("darkButtonTapped")
        darkThemeIsOn(ison: darkTheme)
        
    }
    
    func darkThemeIsOn(ison: Bool) {
        mainText = ison ? "Dark Theme Off" : "Dark Theme On"
        backgroundButton.setTitle(mainText, for: .normal)
        backgroundButton.setTitleColor(ison ? UIColor.black : UIColor.white, for: .normal)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: !ison ? UIColor.black : UIColor.white]
        backgroundButton.backgroundColor = !ison ? .black : .white
        view.backgroundColor = ison ? UIColor.black : UIColor.white
        
        darkTheme.toggle()
    }
   
    
    @IBAction func changeButtonColorWhenTapped(_ sender: Any) {
        if darkButton {
              
               buttonColor.backgroundColor = UIColor.systemBrown
           } else {
              
               buttonColor.backgroundColor = UIColor.orange 
           }
           darkButton.toggle()
    }
    
    
    @IBAction func changeText(_ sender: Any){
        if changeText {
                   textButton.setTitle("Text me", for: .normal)
               } else {
                   textButton.setTitle("Comon", for: .normal)
               }
               changeText.toggle()
           }
    
    @IBAction func returnToInitialLook(_ sender: Any) {
        darkTheme = false
            mainText = "Dark Theme Off"
            darkThemeIsOn(ison: darkTheme)
            
            darkButton = true
            changeText(self)
            
            changeText = true
            textButton.setTitle("Text me", for: .normal)

            dinamitePicture.image = UIImage(named: "leopard")
        }
}
