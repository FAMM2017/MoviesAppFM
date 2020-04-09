//
//  MoviesViewDetails.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 09-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class MoviesViewDetails: UIViewController, MoviesDetailsDelegate {
    private let moviesDetailsPresenter = MoviesDetailsPresenter(moviesDetailsInteractor: MoviesDetailsInteractor())
    var movie:Movie?
    @IBOutlet weak var movieImagen: UIImageView!
    @IBOutlet weak var tvOverview: UILabel!
    @IBOutlet weak var tvTitleMovie: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesDetailsPresenter.setViewDelegate(moviesDetailsDelegate: self)
        initView()
    }
    
    func initView(){
        moviesDetailsPresenter.getImagen(url: movie?.posterPath ?? "")
        self.tvTitleMovie?.text=movie?.title ?? ""
        self.tvOverview?.text=movie?.overview ?? ""
        setRoundCornersOnMovieImagen()
    }
    
    func setRoundCornersOnMovieImagen(){
        self.movieImagen?.layer.cornerRadius = (self.movieImagen?.frame.size.width ?? 0.0) / 2
        self.movieImagen?.clipsToBounds = true
        self.movieImagen?.layer.borderWidth = 3.0
        self.movieImagen?.layer.borderColor = UIColor.black.cgColor
    }
    
    func showMovieImagen(moviesImagen:UIImage) {
        self.movieImagen?.image=moviesImagen
    }
    
    func showError() {
        self.tvTitleMovie?.text="Error getting info, try later."
        self.tvOverview?.text=""
    }
}
