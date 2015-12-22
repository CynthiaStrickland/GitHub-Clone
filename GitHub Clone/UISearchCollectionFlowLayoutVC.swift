//
//  UISearchCollectionFlowLayoutVC.swift
//  GitHubClone
//
//  Created by Cynthia Whitlatch on 11/13/15.
//  Copyright © 2015 Cynthia Whitlatch. All rights reserved.
//

import UIKit
import Foundation

class UISearchCollectionFlowLayoutVC: UICollectionViewFlowLayout {

    init(columns: CGFloat) {
        super.init()
        
        let frame = UIScreen.mainScreen().bounds
        let width = CGRectGetWidth(frame)
        let cellWidth = (width / columns) - 1.0
        let size = CGSizeMake( cellWidth, cellWidth)
        
        self.itemSize = size
        self.minimumInteritemSpacing = 2.0
        self.minimumLineSpacing = 2.0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}