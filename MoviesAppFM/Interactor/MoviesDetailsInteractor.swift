//
//  MoviesDetailsInteractor.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 09-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class MoviesDetailsInteractor{
    
    func getImagen(url:String, callBack:@escaping (MoviesDetailsCallback) -> Void) {
        let imagenUrl="https://image.tmdb.org/t/p/w500\(url)"
        Alamofire.request(imagenUrl).responseImage { response in
                   if case .success(let image) = response.result {
                       print("image downloaded: \(image)")
                       callBack(MoviesDetailsCallback(onSuccessImagen: image, onError: false))
                   }else{
                    callBack(MoviesDetailsCallback(onSuccessImagen: UIImage(), onError: true))
                    }
            
        }
    }
    
}
