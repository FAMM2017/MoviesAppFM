//
//  MoviesViewDetailsDelegate.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 09-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

protocol MoviesDetailsDelegate: NSObjectProtocol {
    func showMovieImagen(moviesImagen:UIImage)
    func showError()
}
