//
//  Network+FetchImage.swift
//  SimpleMVC
//
//  Created by 𝙷𝚘𝚜𝚎𝚒𝚗 𝙹𝚊𝚗𝚊𝚝𝚒  on 12/27/21.
//

import Foundation
import AlamofireImage

public class FetchImage {
    public static var sheared = FetchImage()
    
    public func fetchImageFromURL(UIImageView : UIImageView , stringURL : String) {
        let urlFetch = URL(string: stringURL)
        UIImageView.af.setImage(withURL: urlFetch!)
    }
}
