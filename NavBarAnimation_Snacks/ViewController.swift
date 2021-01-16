//
//  ViewController.swift
//  NavBarAnimation_Snacks
//
//  Created by Yumi Machino on 2021/01/13.
//

import UIKit

class ViewController: UIViewController {
    var cellId = "snackCell"
    
    var snacks: [String] = ["Oreos", "Pizza Pocket", "Pop Tarts", "Popsicle", "Ramen"]
    
    var selectedItems: [String] = []
    
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
    
    var heightConstraint: NSLayoutConstraint?
    var imgHeightConstraint: NSLayoutConstraint?
    
    var isExtend: Bool = false
    
    lazy var oreosImg : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "oreos")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.tag = 0
        return imageView
    }()
    
    lazy var pizzaPocketImg : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza_pockets")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.tag = 1
        return imageView
    }()
    
    lazy var popTartsImg : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "pop_tarts")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.tag = 2
        return imageView
    }()
    
    
    lazy var popsicleImg : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "popsicle")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.tag = 3
        return imageView
    }()
    
    lazy var ramenImg : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "ramen")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        imageView.tag = 4
        return imageView
    }()
    
    var hStackView = UIStackView()
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(navBarView)

        navBarView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        navBarView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        navBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        heightConstraint = navBarView.heightAnchor.constraint(equalToConstant: 44)
        heightConstraint?.isActive = true

        view.addSubview(plusIcon)
        plusIcon.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12).isActive = true
        plusIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true

        plusIcon.addTarget(self, action:#selector(plusIconTapped), for: .touchUpInside)

        isExtend = false

        hStackView = UIStackView(arrangedSubviews: [oreosImg, pizzaPocketImg,popTartsImg,popsicleImg,ramenImg])
        hStackView.axis = .horizontal
        hStackView.alignment = .fill
        hStackView.distribution = .fillEqually
        hStackView.spacing = 0
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        navBarView.addSubview(hStackView)
        
        hStackView.leadingAnchor.constraint(equalTo: navBarView.leadingAnchor, constant: 8).isActive = true
        hStackView.trailingAnchor.constraint(equalTo: plusIcon.trailingAnchor, constant: -30).isActive = true
        hStackView.topAnchor.constraint(equalTo: navBarView.topAnchor, constant: 20).isActive = true
        imgHeightConstraint = hStackView.heightAnchor.constraint(equalToConstant: 110)
        imgHeightConstraint?.isActive = true
        hStackView.isHidden = true


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
        }, completion: nil)
        
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .transitionFlipFromTop, animations: {
            self.hStackView.isHidden = false
            let translateTransform = CGAffineTransform(translationX: 0, y: self.hStackView.frame.size.height / 2)
            self.hStackView.transform = translateTransform
        }, completion: nil)
    }
    
    func closeView(_ viewToAnimate: UIView) {
        isExtend = false
        hStackView.isHidden = true
        heightConstraint?.constant = 88
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: {
            self.view.layoutIfNeeded()
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
