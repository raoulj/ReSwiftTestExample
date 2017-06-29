//
//  ViewController.swift
//  TestReSwift
//
//  Created by Raoul Rodriguez on 6/28/17.
//  Copyright © 2017 Raoul Rodriguez. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
    func newState(state: AppState) {
        textInput.text = state.textInputState.text
        textLabel.text = state.textInputState.text
    }
    
    typealias StoreSubscriberStateType = AppState
    
    
    //MARK: - UI Element Variables
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        textInput.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        clearButton.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainStore.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainStore.unsubscribe(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UI Event Listeners
    @objc func textFieldDidChange(textField: UITextField) {
        mainStore.dispatch(TextInputAction.update(str: textField.text!))
    }
    
    @objc func pressButton(button : UIButton) {
        mainStore.dispatch(TextInputAction.clear)
    }
}

