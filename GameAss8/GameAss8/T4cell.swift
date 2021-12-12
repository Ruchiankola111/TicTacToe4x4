//
//  T4cell.swift
//  Assignment8
//
//  Created by DCS on 07/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//
import UIKit

class T4cell: UICollectionViewCell {
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupCell(with status:Int){
        
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.layer.borderWidth = 2
        contentView.addSubview(myImageView)
        
        myImageView.frame = CGRect(x:0, y:0, width:75, height:75)
        let name = (status == 0) ? ("o") : (status == 1 ? "x" : "")
        myImageView.image = UIImage(named: name)
    }
}
