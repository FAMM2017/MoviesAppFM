//
//  MoviesPresenter.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation

class MoviesPresenter {
    private var pageNumber:Int = 1
    private var isWaitingResponse=false
    private let moviesInteractor:MoviesInteractor
    weak private var moviesViewDelegate : MoviesViewDelegate?
    
    init(moviesInteractor:MoviesInteractor){
        self.moviesInteractor = moviesInteractor
    }
    
    func setViewDelegate(moviesViewDelegate:MoviesViewDelegate?){
        self.moviesViewDelegate = moviesViewDelegate
    }
    
    func getMovies(restartCount:Bool){
        if(!isWaitingResponse) {
            isWaitingResponse=true
            if(restartCount){
                pageNumber=1
            }
           moviesInteractor.getMovies(pageNumber: pageNumber){ [weak self] moviesCallback in
            self?.isWaitingResponse=false
               if !moviesCallback.onError {
                   self?.pageNumber=(self?.pageNumber ?? 1) + 1
                   self?.moviesViewDelegate?.showMovies(moviesList:moviesCallback.onSuccess)
               }else{
                   self?.moviesViewDelegate?.showError()
               }
           }
        }
    }
    
    func handleInfiniteScroll(totalMovies:Int?,position:Int){
        if ((totalMovies ?? 0) - position) == 5 {
            //if is 5 items of bottom, so load more data
            print("bottom")
            self.getMovies(restartCount:false)
        }
    }
    
}
