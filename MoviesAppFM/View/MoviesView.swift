//
//  ViewController.swift
//  MoviesAppFM
//
//  Created by Francisco Monasterios on 4/7/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit

class MoviesView: UIViewController, UITableViewDataSource, UITableViewDelegate, MoviesViewDelegate {
    private let moviesViewPresenter = MoviesPresenter(moviesInteractor: MoviesInteractor())

    @IBOutlet weak var moviesTableView: UITableView!
    private var moviesList: [Movie]? = []
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
            for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moviesViewPresenter.setViewDelegate(moviesViewDelegate: self)
        initMoviesTableView()
    }
    
    func initMoviesTableView(){
        moviesTableView.delegate = self;
        moviesTableView.dataSource = self;
        moviesViewPresenter.getMovies(restartCount:false)
        self.moviesTableView.addSubview(self.refreshControl)
    }
    
    func showMovies(moviesList:[Movie]) {
        self.moviesList=((self.moviesList ?? []) + moviesList)
        self.moviesTableView.reloadData()
        dismissRefresh()
    }
    
    func showError(){
        clearList()
        dismissRefresh()
    }
    
    func dismissRefresh(){
        if(refreshControl.isRefreshing){
           refreshControl.endRefreshing()
        }
    }
    
    func clearList(){
        self.moviesList=[]
        self.moviesTableView.reloadData()
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        clearList()
        moviesViewPresenter.getMovies(restartCount:true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.moviesList?.count ?? 0
       }

       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesCell", for: indexPath)
        if let title = self.moviesList?[indexPath.row].title {
            cell.textLabel?.text = title
        }
        return cell
       }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let moviesViewDetails = MoviesViewDetails()
        moviesViewDetails.movie = self.moviesList?[indexPath.row]
        self.performSegue(withIdentifier: "showmoviedetails", sender: self)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        moviesViewPresenter.handleInfiniteScroll(totalMovies: moviesList?.count, position: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showmoviedetails" {
            if let moviesViewDetails = segue.destination as? MoviesViewDetails {
                moviesViewDetails.movie = self.moviesList?[moviesTableView.indexPathForSelectedRow?.row ?? 0 ]
            }
        }
    }
    
}

