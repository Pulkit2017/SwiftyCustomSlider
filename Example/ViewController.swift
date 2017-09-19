//
//  ViewController.swift
//  Example
//
//  Created by Crystal on 03/08/16.
//  Copyright © 2016 Crystal. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ViewController: UIViewController , UIGestureRecognizerDelegate{
    
    var viewBackground = UIView()
    
    var uiViewMaxImage = UIImageView()
    var viewMin = UIView()
    var viewMax = UIView()
    
    var uiViewMinImage = UIImageView()
    
    var amountMax = Float()
    
    var amountMin = Float()
    
    var minAmountLabel = UILabel()
    
    var maxAmountLabel = UILabel()
    
    var selectedSlide = UIImageView()
    
    
    
    var backgroundSliderImage = UIImageView()
    
    var gestureRecognize = UIPanGestureRecognizer()
    
    var gestureRecognize1 = UIPanGestureRecognizer()
    
    var gestureRecognize2 = UIPanGestureRecognizer()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        viewGenerate()
        
        viewPropertiesSet()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** FRAMES ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** **///
    func viewGenerate()
    {
        
        minAmountLabel.frame = CGRect(x: 50, y: 50, width: 100, height: 30)
        
        maxAmountLabel.frame = CGRect(x: 200, y: 50, width: 100, height: 30)
        viewMin.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
     
        
        viewMax.frame = CGRect(x: 170, y: 0, width: 30, height: 30)
        
        uiViewMaxImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           uiViewMinImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        
        viewBackground.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
    
        selectedSlide.frame = CGRect(x: 0, y: 5, width: 0, height: 20)
        backgroundSliderImage.frame = CGRect(x: 0, y: 5, width: 200, height: 20)
        
        gestureRecognize = UIPanGestureRecognizer.init(target: self, action: #selector(ViewController.panGestureAction(_:)))
        
        gestureRecognize1 = UIPanGestureRecognizer.init(target: self, action: #selector(ViewController.panGestureAction(_:)))
        
        gestureRecognize2 = UIPanGestureRecognizer.init(target: self, action: "panGestureAction2:")
        
        viewBackground.addSubview(backgroundSliderImage)
        
        
        self.view.addSubview(viewBackground)
          viewBackground.addSubview(selectedSlide)
        
        viewBackground.addSubview(viewMax)
        
        viewMax.addSubview(uiViewMaxImage)
        
        viewMin.addSubview(uiViewMinImage)
        
        viewBackground.addSubview(viewMin)
        
        self.view.addSubview(minAmountLabel)
        
        self.view.addSubview(maxAmountLabel)
        
        
        
        
        
        
        
    }
        // ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** VIEW PROPERTIES ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** **///
    

    
    func viewPropertiesSet()
    {
        //  viewBackground.backgroundColor  = UIColor.init(red: 255/255.0, green: 23/255.0, blue: 68/255.0, alpha: 1.0)
        
        uiViewMaxImage.image = UIImage(named: "max_icon")
        
        uiViewMinImage.image = UIImage(named: "start_icon")
        
        backgroundSliderImage.image = UIImage(named: "slider")
        
        selectedSlide.image = UIImage(named: "selectedSlide")
        
        backgroundSliderImage.layer.cornerRadius = 5
        
        backgroundSliderImage.layer.masksToBounds  = true
        
        // viewBackground.addGestureRecognizer(gestureRecognize)
        
        minAmountLabel.text = "593.35"
        maxAmountLabel.text = "2753.35"
        
        
        viewMin.addGestureRecognizer(gestureRecognize)
        
        viewMax.addGestureRecognizer(gestureRecognize1)
        
    }
    

       // ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** Gesture action ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** **///
    
    
    func panGestureAction(_ recognizer: UIPanGestureRecognizer)
    {
        let temp : UIPanGestureRecognizer =  recognizer
        let cgpoint = CGPoint(x: (recognizer.view?.frame.origin.x)!,y: (recognizer.view?.frame.origin.y)!)
        
        //check min and max
        if(cgpoint.x >= 0 && cgpoint.x <= 171)
        {
            
            if(gestureRecognize == recognizer)
            {
                if((recognizer.view?.frame.origin.x)! + 50 < viewMax.frame.origin.x)
                {
                    
                    print(cgpoint)
                    let translation: CGPoint = recognizer.translation(in: self.viewBackground)
                    
                    var translation1: CGPoint = recognizer.translation(in: self.view)
                    
                    print("recognizer \(recognizer.view!.center.x)")
                    
                    print("traslation \(translation.x)")
                    
                    recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x,y: 15)
                    
                    recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.viewBackground)
                    
                    
                }
                else
                {
                    
                    
                    recognizer.view?.frame = CGRect(x: viewMax.frame.origin.x - 51,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                    
                }
                
                print(recognizer.view?.frame.origin.x)
                if(recognizer.view?.frame.origin.x < 0)
                {
                    recognizer.view?.frame = CGRect(x: 0,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                    
                    
                    
                }
                else if(recognizer.view?.frame.origin.x > 170)
                {
                    recognizer.view?.frame = CGRect(x: 170,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                    
                }
                
                
            }
            else if(gestureRecognize1 == recognizer)
            {
                if( viewMax.frame.origin.x > viewMin.frame.origin.x + 50)
                {
                    print(cgpoint)
                    let translation: CGPoint = recognizer.translation(in: self.viewBackground)
                    
                    var translation1: CGPoint = recognizer.translation(in: self.view)
                    
                    print("recognizer \(recognizer.view!.center.x)")
                    
                    print("traslation \(translation.x)")
                    
                    temp.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x,y: 15)
                    
                    temp.setTranslation(CGPoint(x: 0, y: 0), in: self.viewBackground)
                    print(recognizer.view?.frame.origin.x)
                  
                }
                else{
                  
                         temp.view?.frame = CGRect(x: self.viewMin.frame.origin.x + 51,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                 
                    
                    
                }
                if(temp.view?.frame.origin.x < 0)
                {
                    recognizer.view?.frame = CGRect(x: 0,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                    
                    
                    
                }
                else if(temp.view?.frame.origin.x > 170)
                {
                    recognizer.view?.frame = CGRect(x: 170,y: (recognizer.view?.frame.origin.y)!,width: 30,height: 30)
                    
                }
                else
                {
                    let translation: CGPoint = recognizer.translation(in: self.viewBackground)
                    
                
                    
                    
                    recognizer.view!.center = CGPoint(x: recognizer.view!.center.x + translation.x,y: 15)
                    
                    recognizer.setTranslation(CGPoint(x: 0, y: 0), in: self.viewBackground)
                    
                }
                
            }
            
            
            
            calculate(recognizer)
            
            
            
        }
        if(recognizer.state == UIGestureRecognizerState.ended)
        {
            if(recognizer == gestureRecognize)
            {
              
                uiViewMinImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            }
            else if(recognizer == gestureRecognize1)
            {
                uiViewMaxImage.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
           
                
            }
            
        }
        else if(recognizer.state == UIGestureRecognizerState.began)
        {
            if(recognizer == gestureRecognize)
            {
             
                uiViewMinImage.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
                
            }
            else if(recognizer == gestureRecognize1)
            {
                uiViewMaxImage.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
           
                
            }
            
        }
        
             selectedSlide.frame = CGRect(x: viewMin.frame.maxX-5,y: 5,width: viewMax.frame.minX - viewMin.frame.maxX+10, height: selectedSlide.frame.size.height)
        
        //        if recognizer.state == .Ended {
        //            var velocity: CGPoint = recognizer.velocityInView(self.viewBackground)
        //            var magnitude: CGFloat = CGFloat(sqrtf((Float(velocity.x) * Float(velocity.x)) + (Float(velocity.y) * Float(velocity.y))))
        //            var slideMult: CGFloat = magnitude / 200
        //            print("magnitude: \(magnitude), slideMult: \(slideMult)")
        //            var slideFactor: CGFloat = 0.1 * slideMult
        //            // Increase for more of a slide
        //            var finalPoint: CGPoint = CGPointMake(recognizer.view!.center.x + (velocity.x * slideFactor), recognizer.view!.center.y + (velocity.y * slideFactor))
        //            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
        //        }
        /*
         var cgpoint = panGestureAction.locationInView(viewBackground)
         
         var view = panGestureAction.view
         
         
         
         if(view == uiViewMinImage)
         {
         print("Min view ")
         
         }
         else if (view == uiViewMaxImage)
         {
         print("Min view")
         
         }
         
         
         if(panGestureAction == gestureRecognize1)
         {
         print("Min view \(cgpoint)")
         
         }
         else if(panGestureAction == gestureRecognize2)
         {
         print("Max view \(cgpoint)")
         
         }
         else if(panGestureAction == gestureRecognize)
         {
         print("view \(cgpoint)")
         }
         */
        
        
        
        
        
        
        
    }
    func calculate(_ recognizer:UIPanGestureRecognizer)
    {
        
        if(recognizer == gestureRecognize1)
        {
            let ratio = (2753.35 - 593.35)/170
            
            let string  = (String(format:"%.2f",(593.35 + (ratio * Double((recognizer.view?.frame.origin.x)!)))))
            
            let floatTotal : Float = Float(string)!
            maxAmountLabel.text = "\(floatTotal)"
            
        }
        else if(recognizer == gestureRecognize)
        {
            let ratio = (2753.35 - 593.35)/170
            
            let string  = (String(format:"%.2f",(593.35 + (ratio * Double((recognizer.view?.frame.origin.x)!)))))
            
            let floatTotal : Float = Float(string)!
            minAmountLabel.text = "\(floatTotal)"
            
        }
        

        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

