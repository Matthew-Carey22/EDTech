//
//  ViewController.swift
//  EDTech
//
//  Created by Matt on 12/17/20.
//
import SideMenu
import UIKit

class ViewController: UIViewController {

//    private let bck: UIImageView = {
//        let bck1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
//        bck1.backgroundColor = Colors.aMagenta
//        return bck1
//
//    }()
    
    private let sideMenu = SideMenuNavigationController(rootViewController: MenuController(with: ["Home", "Info", "Settings"]))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        bck.center = view.center
//        view.addSubview(bck)
        
        view.setTwoGradient(colorOne: Colors.aquaGreen, colorTwo: Colors.aMagenta)
        
        sideMenu.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        
        
        
        print("loaded")
    }
    
    @IBAction func didTapMenuButton() {
        present(sideMenu, animated: true)
    }

    
    class MenuController: UITableViewController {
        
        private let menuItems: [String]
        init(with menuItems: [String]) {
            self.menuItems = menuItems
            super.init(nibName: nil, bundle: nil)
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        //table
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = menuItems[indexPath.row]
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            //item selected, relay to delegate about menu item selection
        }
    }

}

