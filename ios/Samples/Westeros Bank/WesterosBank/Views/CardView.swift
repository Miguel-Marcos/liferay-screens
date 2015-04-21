//
//  CardViewController.swift
//  WesterosBank
//
//  Created by jmWork on 21/04/15.
//  Copyright (c) 2015 Liferay. All rights reserved.
//

import UIKit


func CGRectMake(x: CGFloat, y: CGFloat, size: CGSize) -> CGRect {
	return CGRectMake(x, y, size.width, size.height)
}


class CardView: UIView {

	enum ShowState {
		case Hidden
		case Minimized
		case Normal
		case Maximized
	}


	@IBInspectable var minimizedHeight: CGFloat = 50
	@IBInspectable var normalHeight: CGFloat = 200
	@IBInspectable var maximizedMargin: CGFloat = 20
	@IBInspectable var title: String = "CARD"

	var controller: UIViewController? {
		didSet {
			if let controllerValue = controller {
				self.addSubview(controllerValue.view)
			}
		}
	}

	var currentState: ShowState = .Hidden
	var nextState: ShowState = .Normal


	func changeToNextState() {
		let nextPosition: CGFloat

		switch nextState {
		case .Hidden:
			nextPosition = 0
		case .Minimized:
			nextPosition = self.superview!.frame.size.height - minimizedHeight
		case .Normal:
			nextPosition = self.superview!.frame.size.height - normalHeight
		case .Maximized:
			nextPosition = maximizedMargin
		}

		UIView.animateWithDuration(0.7,
				delay: 0.0,
				usingSpringWithDamping: 1.0,
				initialSpringVelocity: 0.0,
				options: .BeginFromCurrentState | .CurveEaseIn,
				animations: {
					self.frame = CGRectMake(0, nextPosition, self.frame.size)
				}, completion: { Bool -> Void in
					self.currentState = self.nextState
				})
	}

}