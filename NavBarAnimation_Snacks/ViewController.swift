//
//  ViewController.swift
//  NavBarAnimation_Snacks
//
//  Created by Yumi Machino on 2021/01/13.
//

import UIKit

class ViewController: UIViewController {
    
    // TableView Relation
    var cellId = "snackCell"
    var snacks: [String] = ["Oreos", "Pizza Pocket", "Pop Tarts", "Popsicle", "Ramen"]
    var selectedItems: [String] = []

    // Image Preparation
    let oreosImg = UIImageView(image: UIImage(named: "oreos"))
    let pizzaPocketImg = UIImageView(image: UIImage(named: "pizza_pockets"))
    let popTartsImg = UIImageView(image: UIImage(named: "pop_tarts"))
    let popsicleImg = UIImageView(image: UIImage(named: "popsicle"))
    let ramenImg = UIImageView(image: UIImage(named: "ramen"))
    lazy var SnackImages: [UIImageView] = [oreosImg, pizzaPocketImg,popTartsImg,popsicleImg,ramenImg]
    
    let navBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hexString: "#DDDDDD")
        return view
    }()
    
    let plusIcon: UIButton = {
        let btn = UIButton()
        btn.setTitle("＋", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let navBarTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "SNACKS"
        label.font = UIFont.systemFont(ofSize: 25)
        label.tintColor = .black
        label.textAlignment = .center
        return label
    }()
    
    var heightConstraint: NSLayoutConstraint?
    var imgHeightConstraint: NSLayoutConstraint?
    
    var isExtend: Bool = false

    var hStackView = UIStackView()
    var imageStackView = UIStackView()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // NavBar Setting
        view.addSubview(navBarView)
        navBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        navBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        heightConstraint = navBarView.heightAnchor.constraint(equalToConstant: 88)
                heightConstraint?.isActive = true
        
        // plusIcon Setting
        view.addSubview(plusIcon)
        plusIcon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        plusIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        
        plusIcon.addTarget(self, action:#selector(plusIconTapped), for: .touchUpInside)
        
        // create a stack view
        imageStackView = UIStackView(frame: CGRect(x: 0, y: 88, width: view.frame.width, height: 100))
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillEqually

        // add 5 imageViews to the stackView
        for i in 0..<SnackImages.count {
            SnackImages[i].isUserInteractionEnabled = true
            SnackImages[i].translatesAutoresizingMaskIntoConstraints = false
            // Tap Recognizer for each image
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
            SnackImages[i].addGestureRecognizer(tapGestureRecognizer)
            SnackImages[i].tag = i
            imageStackView.addArrangedSubview(SnackImages[i])
        }
        navBarView.addSubview(imageStackView)
        navBarView.addSubview(navBarTitle)
        navBarTitle.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor).isActive = true
        navBarTitle.trailingAnchor.constraint(equalTo: navBarView.trailingAnchor).isActive = true
        navBarTitle.centerXAnchor.constraint(equalTo: navBarView.centerXAnchor).isActive = true
        navBarTitle.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 10).isActive = true
        
        imageStackView.isHidden = true
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        // set constraints for StackView
        imageStackView.topAnchor.constraint(equalTo: navBarTitle.bottomAnchor, constant: 10).isActive = true
        imageStackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor).isActive = true
        imageStackView.widthAnchor.constraint(equalTo: navBarView.widthAnchor).isActive = true
        imageStackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        isExtend = false
        // table view
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.anchors(topAnchor: navBarView.bottomAnchor, leadingAnchor: view.leadingAnchor, trailingAnchor: view.trailingAnchor, bottomAnchor: view.bottomAnchor)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    @objc func imageTapped(_ sender : UITapGestureRecognizer) {
        if let tag = sender.view?.tag {
            switch tag {
            case 0:
                selectedItems.insert(snacks[0], at: 0)
                tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
            case 1:
                selectedItems.insert(snacks[1], at: 0)
                tableView.insertRows(at:  [IndexPath(row: 0, section: 0)], with: .automatic)
            case 2:
                selectedItems.insert(snacks[2], at: 0)
                tableView.insertRows(at:  [IndexPath(row: 0, section: 0)], with: .automatic)
            case 3:
                selectedItems.insert(snacks[3], at: 0)
                tableView.insertRows(at:  [IndexPath(row: 0, section: 0)], with: .automatic)
            case 4:
                selectedItems.insert(snacks[4], at: 0)
                tableView.insertRows(at:  [IndexPath(row: 0, section: 0)], with: .automatic)
            default:
                fatalError()
            }
        }
    }
  
    
    func extendView(_ viewToAnimate: UIView){
        isExtend = true
        heightConstraint?.constant = 200
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
            let rotateTransform = CGAffineTransform(rotationAngle: .pi/4)
            self.plusIcon.transform = rotateTransform
            // title label
            let translateform = CGAffineTransform(translationX: 1.0, y: self.navBarView.frame.size.height / 4)
            self.navBarTitle.transform = translateform
            self.navBarTitle.text = "Add a SNACK"
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .transitionFlipFromTop, animations: {
            self.imageStackView.isHidden = false
            let translateTransform = CGAffineTransform(translationX: 0, y: self.imageStackView.frame.size.height / 2)
            self.imageStackView.transform = translateTransform
        }, completion: nil)
    }
    
    func closeView(_ viewToAnimate: UIView) {
        isExtend = false
        imageStackView.isHidden = true
        heightConstraint?.constant = 88
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
            // title label
            self.navBarTitle.transform = .identity
            self.navBarTitle.text = "SNACKS"
        }, completion: nil)
            
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: {
            self.plusIcon.transform = .identity
        }, completion: nil)
    }
    
    @objc func plusIconTapped(_ sender: UIButton) {
        if isExtend == false {
            extendView(sender)
        } else {
            closeView(sender)
        }
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = selectedItems[indexPath.row]
      return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
