//
//  AppDelegate.swift
//  BitwiseMasking
//
//  Created by Pilipenko Dima on 11/2/15.
//  Copyright © 2015 dimpiax. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var _model: Model!
    
    private var _field: UITextView!

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.backgroundColor = .whiteColor()
        window!.makeKeyAndVisible()
        
        _model = Model()
        
        let vc = UIViewController()
        window!.rootViewController = vc
        
        let stackView = UIStackView()
        stackView.axis = .Vertical
        stackView.distribution = .FillEqually
        vc.view.addSubview(stackView)
        
        Genre.allValues.forEach {
            let switcher = GenreUISwitch(responsibleGengre: $0)
            switcher.addTarget(self, action: "genreSwitchDidChanged:", forControlEvents: .ValueChanged)
            stackView.addArrangedSubview(switcher)
        }
        
        stackView.frame.size = CGSize(width: stackView.arrangedSubviews.last!.bounds.width, height: 200)
        stackView.frame.origin = CGPoint(x: 50, y: 60)
        
        _field = UITextView()
        _field.frame.origin = CGPoint(x: 50, y: stackView.frame.maxY)
        vc.view.addSubview(_field)
        
        return true
    }
    
    func genreSwitchDidChanged(sender: GenreUISwitch) {
        _model.defineSelectedGenres(sender.responsibleGengre, selected: sender.on)
        
        _field.text = ""
        defer {
            _field.sizeToFit()
            _field.frame.size = CGSize(width: window!.bounds.width-100, height: _field.bounds.height)
        }
        
        guard let filteredMusic = _model.filteredMusic else { return }
        
        _field.text = filteredMusic.reduce("List:\n\n") {
            let sep = $1 == filteredMusic.first! ? "" : ", "
            return "\($0)\(sep)\($1)"
        }
    }
}