//
//  T21MaterialTextField.swift
//  T21MaterialTextField
//
//  Created by Eloi Guzmán Cerón on 04/11/16.
//  Copyright © 2016 Worldline. All rights reserved.
//

import UIKit
import Material

@objc public enum ActiveStatus : Int {
    case Enabled = 0
    case Disabled
    case Active
}

@objc public enum FeedbackStatus : Int {
    case None = 0
    case Error
}

@objc open class T21MaterialTextField: Material.TextField {
    
    private var m_colorDividerNormal: UIColor = Color.darkText.dividers
    private var m_colorDividerActive: UIColor = Color.blue.base
    
    @objc
    @IBInspectable
    open var errorHintText: String? {
        didSet {
            refreshDetailLabelText()
        }
    }
    
    @objc
    @IBInspectable
    open var hintText: String? {
        didSet {
            refreshDetailLabelText()
        }
    }
    
    private func refreshDetailLabelText() {
        if activeStatus == .Active {
            self.detail = hintText
        } else {
            if feedbackStatus == .Error {
                self.detail = errorHintText
            } else {
                self.detail = hintText
            }
        }
    }
    
    private func refreshDetailLabelColor() {
        if activeStatus == .Active {
            detailColor = hintTextActiveColor
        } else {
            if feedbackStatus == .Error {
                detailColor = hintTextErrorColor
            } else {
                detailColor = hintTextNormalColor
            }
        }
    }
    
    private func refreshDividerColor() {
        if activeStatus == .Active {
            dividerColor = m_colorDividerActive
        } else {
            if feedbackStatus == .Error {
                dividerColor = dividerErrorColor
            } else {
                dividerColor = dividerNormalColor
            }
        }
    }
    
    @objc
    open var activeStatus: ActiveStatus {
        get {
            if self.isEnabled {
                if self.isEditing {
                    return ActiveStatus.Active
                } else {
                    return ActiveStatus.Enabled
                }
            } else {
                return ActiveStatus.Disabled
            }
        }
        set(value) {
            switch value {
            case .Active:
                self.isEnabled = true
                _ = self.becomeFirstResponder()
            case .Enabled:
                self.isEnabled = true
            case .Disabled:
                self.isEnabled = false;
            }
            refreshDetailLabelColor()
            refreshDividerColor()
        }
    }
    
    @objc
    open var feedbackStatus = FeedbackStatus.None {
        didSet {
            refreshDetailLabelText()
            refreshDetailLabelColor()
            refreshDividerColor()
        }
    }
    
    @objc
    @IBInspectable
    open var hintTextNormalColor = Color.darkText.others {
        didSet {
            refreshDetailLabelColor()
        }
    }
    
    @objc
    @IBInspectable
    open var hintTextErrorColor = Color.red.base {
        didSet {
            refreshDetailLabelColor()
        }
    }
    
    @objc
    @IBInspectable
    open var hintTextActiveColor = Color.blue.base {
        didSet {
            refreshDetailLabelColor()
        }
    }
    
    @objc
    @IBInspectable
    open override var dividerNormalColor : UIColor {
        get {
            return m_colorDividerNormal
        }
        set {
            m_colorDividerNormal = newValue
            refreshDividerColor()
        }
    }
    
    @objc
    @IBInspectable
    open override var dividerActiveColor : UIColor {
        get {
            return m_colorDividerActive
        }
        set {
            m_colorDividerActive = newValue
            refreshDividerColor()
        }
    }
    
    @objc
    @IBInspectable
    open var dividerErrorColor = Color.red.base {
        didSet {
            refreshDividerColor()
        }
    }
    
    @objc
    open override func prepare() {
        super.prepare();
        addTarget(self, action: #selector(executeEditingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(executeEditingDidEnd), for: .editingDidEnd)
    }
    
    @objc
    open func executeEditingDidBegin() {
        DispatchQueue.main.async {
            self.refreshDividerColor()
            self.refreshDetailLabelColor()
            self.refreshDetailLabelText()
        }
    }
    
    @objc
    open func executeEditingDidEnd() {
        DispatchQueue.main.async {
            self.refreshDividerColor()
            self.refreshDetailLabelColor()
            self.refreshDetailLabelText()
        }
    }
}
