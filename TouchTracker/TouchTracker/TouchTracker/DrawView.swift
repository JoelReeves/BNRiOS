//
//  DrawView.swift
//  TouchTracker
//
//  Created by Joel Reeves on 4/4/16.
//  Copyright © 2016 Bromance Labs. All rights reserved.
//

import UIKit

class DrawView: UIView, UIGestureRecognizerDelegate {
    
    var currentLines = [NSValue: Line]()
    var finishedLines = [Line]()
    var moveRecognizer: UIPanGestureRecognizer!
    var selectedLineIndex: Int? {
        didSet {
            if selectedLineIndex == nil {
                let menu = UIMenuController.sharedMenuController()
                menu.setMenuVisible(false, animated: true)
            }
        }
    }
    
    @IBInspectable var finishedLineColor: UIColor = UIColor.blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 10 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let doubleTapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.doubleTap))
        doubleTapRecognizer.numberOfTapsRequired = 2
        doubleTapRecognizer.delaysTouchesBegan = true
        addGestureRecognizer(doubleTapRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(DrawView.tap))
        tapRecognizer.delaysTouchesBegan = true
        tapRecognizer.requireGestureRecognizerToFail(doubleTapRecognizer)
        addGestureRecognizer(tapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(DrawView.longPress))
        addGestureRecognizer(longPressRecognizer)
        
        moveRecognizer = UIPanGestureRecognizer(target: self, action: #selector(DrawView.moveLine))
        moveRecognizer.delegate = self
        moveRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(moveRecognizer)
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    func moveLine(gestureRecognizer: UIPanGestureRecognizer) {
        print("recognized a pan")
    }
    
    func longPress(gestureRecognizer: UIGestureRecognizer) {
        print("recognized a long press")
        
        if gestureRecognizer.state == .Began {
            let point = gestureRecognizer.locationInView(self)
            selectedLineIndex = indexOfLineAtPoint(point)
            
            if selectedLineIndex != nil {
                currentLines.removeAll(keepCapacity: false)
            }
        } else if gestureRecognizer.state == .Ended {
            selectedLineIndex = nil
        }
        
        setNeedsDisplay()
    }
    
    func doubleTap(gestureRecognizer: UIGestureRecognizer) {
        print("recognized a double tap")
        
        currentLines.removeAll(keepCapacity: false)
        finishedLines.removeAll(keepCapacity: false)
        setNeedsDisplay()
    }
    
    func tap(gestureRecognizer: UIGestureRecognizer) {
        print("recognized a tap")
        
        let point = gestureRecognizer.locationInView(self)
        selectedLineIndex = indexOfLineAtPoint(point)
        
        // grab the menu controller
        let menu = UIMenuController.sharedMenuController()
        
        if selectedLineIndex != nil {
            // make DrawView the target of menu item action messages
            becomeFirstResponder()
            
            // create a new "Delete" UIMenuItem
            let deleteItem = UIMenuItem(title: "Delete", action: #selector(DrawView.deleteLine))
            menu.menuItems = [deleteItem]
            
            // tell the menu where it should come from and show it
            menu.setTargetRect(CGRect(x: point.x, y: point.y, width: 2, height: 2), inView: self)
            menu.setMenuVisible(true, animated: true)
            
        } else {
            // hide the menu if no line is selected
            menu.setMenuVisible(false, animated: true)
        }
        
        setNeedsDisplay()
    }
    
    func deleteLine(sender: AnyObject) {
        // remove the selected line from the list of finishedLines
        if let index = selectedLineIndex {
            finishedLines.removeAtIndex(index)
            selectedLineIndex = nil
            
            // redraw everything
            setNeedsDisplay()
        }
    }
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.Round
        
        path.moveToPoint(line.begin)
        path.addLineToPoint(line.end)
        path.stroke()
    }
    
    override func drawRect(rect: CGRect) {
        finishedLineColor.setStroke()
        
        for line in finishedLines {
            strokeLine(line)
        }
        
        currentLineColor.setStroke()
        
        for (_, Line) in currentLines {
            strokeLine(Line)
        }
        
        if let index = selectedLineIndex {
            UIColor.greenColor().setStroke()
            let selectedLine = finishedLines[index]
            strokeLine(selectedLine)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // log statement to see the order of events
        print(#function)
        
        for touch in touches {
            let location = touch.locationInView(self)
            
            let newLine = Line(begin: location, end: location)
            
            let key = NSValue(nonretainedObject: touch)
            currentLines[key] = newLine
        }
        
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // log statement to see the order of events
        print(#function)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            currentLines[key]?.end = touch.locationInView(self)
        }
        
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // log statement to see the order of events
        print(#function)
        
        for touch in touches {
            let key = NSValue(nonretainedObject: touch)
            if var line = currentLines[key] {
                line.end = touch.locationInView(self)
                finishedLines.append(line)
                currentLines.removeValueForKey(key)
            }
        }
        
        setNeedsDisplay()
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        // log statement to see the order of events
        print(#function)
        
        currentLines.removeAll()
        
        setNeedsDisplay()
    }
    
    func indexOfLineAtPoint(point: CGPoint) -> Int? {
        // find a line close to point
        for (index, line) in finishedLines.enumerate() {
            let begin = line.begin
            let end = line.end
            
            // check a few points on the line
            for t in CGFloat(0).stride(to: 1.0, by: 0.05) {
                let x = begin.x + ((end.x - begin.x) * t)
                let y = begin.y + ((end.y - begin.y) * t)
                
                // if the tapped point is within 20 points, return the line
                if hypot(x - point.x, y - point.y) < 20.0 {
                    return index
                }
            }
        }
        
        // if nothing is close enough to the tapped point, we didn't select a line
        return nil
    }
}
