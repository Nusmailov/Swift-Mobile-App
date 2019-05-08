
import UIKit

protocol AddContactDelegate {
    func didCreateContact(contact: Contact)
}

class AddContactViewController: UIViewController {
    var delegate: AddContactDelegate?
    var colors  = [TagColor.yellow, TagColor.blue, TagColor.orange, TagColor.green, TagColor.red, TagColor.gray]
    var colorTypes = [UIColor.yellow,UIColor.blue,UIColor.orange, UIColor.green, UIColor.red, UIColor.gray ]
    fileprivate let cellId = "colorCell"
    var cells = [ColorCollectionViewCell]()
    var tagPicker: UITextField!
    var firstnameField: UITextField!
    var phoneField: UITextField!
    var lastnameField: UITextField!
    
    var defaults = UserDefaults.standard
    var collectionView: UICollectionView!
     var index = -1
    var selectedColor: TagColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupFields()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Add", style: .done, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        guard firstnameField.text != "" else {
            let alert = UIAlertController.init(title: "Error", message: "Fill out your name", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            return
        }
        guard phoneField.text != "" else {
            let alert = UIAlertController.init(title: "Error", message: "Fill out your phone", preferredStyle: .alert)
            let okButton = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            return
        }
       
       
        var tag: TagColor
        if index == -1 {
           tag = TagColor.none
        }else{
            tag = colors[index]
        }
        let contact = Contact.init(name: firstnameField.text ?? "", lastname: lastnameField.text ?? "", phone: phoneField.text ?? "",tag: tag)
        delegate?.didCreateContact(contact: contact)
        self.navigationController?.popViewController(animated: true)
    }
    fileprivate func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 300, left: 30, bottom: 0, right:30)
        layout.itemSize = CGSize(width: 40, height: 40)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(collectionView)
    }
    fileprivate func setupFields(){
        let y = (self.navigationController?.navigationBar.frame.maxY)! + 30
        firstnameField = UITextField(frame: CGRect(x: 10, y: y + 10, width: view.frame.width - 20, height: 40))
        firstnameField.borderStyle = UITextField.BorderStyle.roundedRect
        firstnameField.placeholder = "First Name"
        view.addSubview(firstnameField)
        
        lastnameField = UITextField(frame: CGRect(x: 10, y: y + 60, width: view.frame.width - 20, height: 40))
        lastnameField.borderStyle = UITextField.BorderStyle.roundedRect
        lastnameField.placeholder = "Last Name"
        view.addSubview(lastnameField)
        
        phoneField = UITextField(frame: CGRect(x: 10, y: y + 110, width: view.frame.width - 20, height: 40))
        phoneField.borderStyle = UITextField.BorderStyle.roundedRect
        phoneField.placeholder = "Phone"
        phoneField.keyboardType = .namePhonePad
        view.addSubview(phoneField)
    }
}

extension AddContactViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ColorCollectionViewCell
        cell.backgroundColor = colorTypes[indexPath.item]
        cell.layer.cornerRadius = min(cell.frame.size.height, cell.frame.size.width) / 2.0
        cell.layer.masksToBounds = true
        if selectedColor == colors[indexPath.item] {
            cell.image.image = UIImage(named: "check")
            index = indexPath.item
        }else{
            cell.image.image = nil
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedColor == colors[indexPath.item]{
            selectedColor = nil
            index = -1
        } else {
            selectedColor = colors[indexPath.item]
        }
        collectionView.reloadData()
    }
}
