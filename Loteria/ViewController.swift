//
//  ViewController.swift
//  Loteria
//
//  Created by School Picture Dev on 12/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    
    while result.count < total {
        let ramdonNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if (!result.contains(ramdonNumber)) {
            result.append(ramdonNumber)
        }
    }
    
    return result.sorted()
}

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var lbGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton]!

    // MARK: - Funcion
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumber(for: .megasena)
    }
    
    func showNumber(for type: GameType) {
        lbGameType.text = type.rawValue;
        var game: [Int] = []
        
        switch type {
        case .megasena:
           game = 6>-<60
           balls.last!.isHidden = false;
        case .quina:
            game = 5>-<80
            balls.last!.isHidden = true;
        }
        
        for (index, game) in game.enumerated() {
            balls[index].setTitle("\(game)", for: .normal)
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - IBActions
    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumber(for: .megasena)
        default:
            showNumber(for: .quina)
        }
        
    }
    
    
    
}

