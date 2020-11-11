//
//  ColorPicker.swift
//  SupportDocsSwiftUI
//
//  Created by Zheng on 10/31/20.
//

import UIKit

class ColorPickerControllerWithNil: UIViewController {
    
    var isNil = false
    var setColor: ((UIColor?) -> Void)?
    var colorPickerView: ColorPickerView?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UIView()
        
        let nilLabel = UILabel()
        nilLabel.text = "Nil"
        
        let switchControl = UISwitch()
        switchControl.isOn = isNil
        switchControl.addTarget(self, action: #selector(switchValueDidChange(_:)), for: .valueChanged)
        
        colorPickerView = ColorPickerView()
        colorPickerView!.onColorDidChange = setColor
        view.addSubview(colorPickerView!)
        
        colorPickerView!.alpha = isNil ? 0.5 : 1
        colorPickerView!.isUserInteractionEnabled = isNil ? false : true
        
        view.addSubview(nilLabel)
        view.addSubview(switchControl)
        
        nilLabel.translatesAutoresizingMaskIntoConstraints = false
        switchControl.translatesAutoresizingMaskIntoConstraints = false
        colorPickerView!.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            nilLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            nilLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            nilLabel.bottomAnchor.constraint(equalTo: colorPickerView!.topAnchor, constant: -12),

            switchControl.centerYAnchor.constraint(equalTo: nilLabel.centerYAnchor),
            switchControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            colorPickerView!.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            colorPickerView!.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            colorPickerView!.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
        ]

        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func switchValueDidChange(_ sender: UISwitch) {
        if sender.isOn {
            isNil = true
            setColor?(nil)
        } else {
            isNil = false
            setColor?(UIColor.blue)
        }
        colorPickerView!.alpha = isNil ? 0.5 : 1
        colorPickerView!.isUserInteractionEnabled = isNil ? false : true
    }
}

class ColorPickerController: UIViewController {
    
    var setColor: ((UIColor) -> Void)?

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let colorPickerView = ColorPickerView()
        colorPickerView.onColorDidChange = setColor
        view = colorPickerView
    }
}

/// from https://stackoverflow.com/a/47342263/14351818
class ColorPickerView : UIView {
    
    var onColorDidChange: ((_ color: UIColor) -> ())?
    
    let saturationExponentTop: Float = 2.0
    let saturationExponentBottom: Float = 1.3
    
    let grayPaletteHeightFactor: CGFloat = 0.1
    var rect_grayPalette = CGRect.zero
    var rect_mainPalette = CGRect.zero
    
    // adjustable
    var elementSize: CGFloat = 24 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.clipsToBounds = true
        let touchGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.touchedColor(gestureRecognizer:)))
        touchGesture.minimumPressDuration = 0
        touchGesture.allowableMovement = CGFloat.greatestFiniteMagnitude
        self.addGestureRecognizer(touchGesture)
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        rect_grayPalette = CGRect(x: 0, y: 0, width: rect.width, height: rect.height * grayPaletteHeightFactor)
        rect_mainPalette = CGRect(x: 0, y: rect_grayPalette.maxY,
                                  width: rect.width, height: rect.height - rect_grayPalette.height)
        
        // gray palette
        for y in stride(from: CGFloat(0), to: rect_grayPalette.height, by: elementSize) {
            
            for x in stride(from: (0 as CGFloat), to: rect_grayPalette.width, by: elementSize) {
                let hue = x / rect_grayPalette.width
                
                let color = UIColor(white: hue, alpha: 1.0)
                
                context!.setFillColor(color.cgColor)
                context!.fill(CGRect(x:x, y:y, width:elementSize, height:elementSize))
            }
        }
        
        // main palette
        for y in stride(from: CGFloat(0), to: rect_mainPalette.height, by: elementSize) {
            
            var saturation = y < rect_mainPalette.height / 2.0 ? CGFloat(2 * y) / rect_mainPalette.height : 2.0 * CGFloat(rect_mainPalette.height - y) / rect_mainPalette.height
            saturation = CGFloat(powf(Float(saturation), y < rect_mainPalette.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
            let brightness = y < rect_mainPalette.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect_mainPalette.height - y) / rect_mainPalette.height
            
            for x in stride(from: (0 as CGFloat), to: rect_mainPalette.width, by: elementSize) {
                let hue = x / rect_mainPalette.width
                
                let color = UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
                
                context!.setFillColor(color.cgColor)
                context!.fill(CGRect(x:x, y: y + rect_mainPalette.origin.y,
                                     width: elementSize, height: elementSize))
            }
        }
    }
    
    func getColorAtPoint(point: CGPoint) -> UIColor {
        var roundedPoint = CGPoint(x:elementSize * CGFloat(Int(point.x / elementSize)),
                                   y:elementSize * CGFloat(Int(point.y / elementSize)))
        
        let hue = roundedPoint.x / self.bounds.width
        
        
        // main palette
        if rect_mainPalette.contains(point) {
            // offset point, because rect_mainPalette.origin.y is not 0
            roundedPoint.y -= rect_mainPalette.origin.y
            
            var saturation = roundedPoint.y < rect_mainPalette.height / 2.0 ? CGFloat(2 * roundedPoint.y) / rect_mainPalette.height
                : 2.0 * CGFloat(rect_mainPalette.height - roundedPoint.y) / rect_mainPalette.height
            
            saturation = CGFloat(powf(Float(saturation), roundedPoint.y < rect_mainPalette.height / 2.0 ? saturationExponentTop : saturationExponentBottom))
            let brightness = roundedPoint.y < rect_mainPalette.height / 2.0 ? CGFloat(1.0) : 2.0 * CGFloat(rect_mainPalette.height - roundedPoint.y) / rect_mainPalette.height
            
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        }
        // gray palette
        else {
            
            return UIColor(white: hue, alpha: 1.0)
        }
    }
    
    @objc func touchedColor(gestureRecognizer: UILongPressGestureRecognizer){
        let point = gestureRecognizer.location(in: self)
        let color = getColorAtPoint(point: point)
        
        self.onColorDidChange?(color)
    }
}
