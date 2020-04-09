//
//  MoviesDetailsPresenter.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 09-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
class MoviesDetailsPresenter{
    private let moviesDetailsInteractor:MoviesDetailsInteractor
    weak private var moviesDetailsDelegate : MoviesDetailsDelegate?
    
    init(moviesDetailsInteractor:MoviesDetailsInteractor){
        self.moviesDetailsInteractor = moviesDetailsInteractor
    }
    
    func setViewDelegate(moviesDetailsDelegate:MoviesDetailsDelegate?){
        self.moviesDetailsDelegate = moviesDetailsDelegate
    }
    
    func getImagen(url:String){
        self.moviesDetailsInteractor.getImagen(url: url) { [weak self] moviesDetailsCallback  in
            if !moviesDetailsCallback.onError {
                self?.moviesDetailsDelegate?.showMovieImagen(moviesImagen: moviesDetailsCallback.onSuccessImagen)
            }else{
                self?.moviesDetailsDelegate?.showError()
            }
        }
    }
}
