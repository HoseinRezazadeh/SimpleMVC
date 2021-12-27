//
//  HomeTableViewCell.swift
//  SimpleMVC
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 12/27/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblTypeMovie: UILabel!
    
    
    public func configuration( NameMovie : String , imdbMovie : String , yearMovie : String , imageURL : String) {
        lblName.text = NameMovie
        lblTypeMovie.text = imdbMovie
        lblYear.text = yearMovie
    
        FetchAndCashImage.fetchImageFromURL(UIImageView: imgMovie, stringURL: imageURL)
    }

}
