//
//  MoviesViewDelegate.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 08-04-20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
protocol MoviesViewDelegate: NSObjectProtocol {
    func showMovies(moviesList:[Movie])
    func showError()
}
