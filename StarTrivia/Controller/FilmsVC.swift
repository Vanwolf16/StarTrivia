//
//  FilmsVC.swift
//  StarTrivia
//
//  Created by David Murillo on 5/12/20.
//  Copyright © 2020 MuriTech. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crawlLbl: UITextView!
    
    //Outlet Btn
    @IBOutlet weak var previousBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    
    var person:Person!
    let api = FilmApi()
    var films = [String]()
    var currentFilms = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        films = person.filmUrls
        previousBtn.isEnabled = false
        nextBtn.isEnabled = films.count > 1
        guard let firstFilm = films.first else {return}
        getFilm(url: firstFilm)
    }
    
    func getFilm(url:String){
        api.getFilm(url: url) { (film) in
            if let film = film{
                self.setupView(film: film)
            }
        }
    }
    
    func setupView(film:Film){
        titleLbl.text = film.title
        episodeLbl.text = String(film.episode)
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        //optional Code replace String
        let stripped = film.crawl.replacingOccurrences(of: "\n", with: "")
        crawlLbl.text = stripped.replacingOccurrences(of: "\r", with: "")
    }
    
    @IBAction func previousClicked(_ sender: Any) {
         currentFilms -= 1
        setButtonState()
       
    }
    @IBAction func nextClicked(_ sender: Any) {
        currentFilms += 1
        setButtonState()
    }
    
    func setButtonState(){
        nextBtn.isEnabled = currentFilms == films.count - 1 ? false : true
        previousBtn.isEnabled = currentFilms == 0 ? false : true
        getFilm(url: films[currentFilms])
    }
    
}
