//
//  PageViewController.swift
//  PageImageVC
//
//  Created by Hudihka on 25/09/2020.
//  Copyright © 2020 Hudihka. All rights reserved.
//

import UIKit


class ZoomViewController: UIViewController {
	
	fileprivate var startIndex: IndexPath = IndexPath(row: 0, section: 0)
	
	@IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    fileprivate var image: UIImage?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = .black
		
		self.customNavigationBar()
		self.settingsCV()
		
		
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		self.collectionView.scrollToItem(at: startIndex,
										 at: [.centeredVertically, .centeredHorizontally],
										 animated: false)
	}
	
	
	/*функция применяется для безанмационного (как в телеграме/медиатеке) показа изображений*/
	
	static func presentPageVC(_ fromVC: UIViewController, image: UIImage){
		
		let storuboard = UIStoryboard(name: "PageStoryboard", bundle: nil)
		
		let VC = storuboard.instantiateViewController(withIdentifier: "ZoomViewController") as! ZoomViewController
        VC.image = image
		
		let NVC = UINavigationController(rootViewController: VC)
		
		NVC.providesPresentationContextTransitionStyle = true
		NVC.definesPresentationContext = true
		NVC.modalPresentationStyle = .overCurrentContext
		
		fromVC.present(NVC, animated: true, completion: nil)
		
	}
	
	private func customNavigationBar() {
		
		navigationController?.setNavigationBarHidden(false, animated: false)
		navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		 navigationController?.navigationBar.shadowImage = UIImage()
		navigationController?.navigationBar.isTranslucent = true
		 navigationController?.view.backgroundColor = UIColor(red: 1, green: 0.5, blue: 1, alpha: 1)
		 navigationController?.navigationBar.tintColor = UIColor(red: 1, green: 0.5, blue: 1, alpha: 1)
		
		
		let button = UIBarButtonItem(title: "Продолжить", style: .plain, target: self, action: #selector(exit))
		let colorBB = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
		button.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : colorBB], for: .normal)
		navigationItem.rightBarButtonItem = button
	}
	
	@objc private func exit() {
		self.navigationController?.dismiss(animated: true, completion: nil)
	}
	
	fileprivate func colorNB(_ alpha: CGFloat){
		
		guard let navigationController = navigationController else {return}
		
		let colorNB = UIColor(red: 1, green: 0.5, blue: 1, alpha: alpha)
		navigationController.navigationBar.tintColor = colorNB
		
		let colorFont = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
		let attributes = [NSAttributedString.Key.foregroundColor : colorFont] as [NSAttributedString.Key : Any]
		navigationController.navigationBar.titleTextAttributes = attributes as [NSAttributedString.Key : Any]
	
	}
	
}


extension ZoomViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	fileprivate func settingsCV() {
		self.collectionView.backgroundColor = .clear
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		
		self.collectionView.decelerationRate = .fast
		self.collectionView.contentInsetAdjustmentBehavior = .never
		
		self.collectionView.register(UINib(nibName: "ZoomCell", bundle: nil),
									 forCellWithReuseIdentifier: "ZoomCell")
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		1
	}
	

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ZoomCell", for: indexPath) as! ZoomCell
		
        cell.image = self.image
		
		cell.translationBlock = {[weak self] alpha in
			self?.colorNB(alpha)
		}

		cell.closeBlock = { [weak self] value in
			self?.navigationController?.dismiss(animated: true, completion: nil)
		}

        return cell
    }


    func collectionView(_ collectionView: UICollectionView,
						layout collectionViewLayout: UICollectionViewLayout,
						sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: wDdevice, height: hDdevice)
    }
	
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
	
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
	
}
