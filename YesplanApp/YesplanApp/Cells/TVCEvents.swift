//
//  TVCEvents.swift
//  YesplanApp
//
//  Created by Tom Slegers on 9/12/17.
//  Copyright © 2017 TomPlan. All rights reserved.
//

import UIKit

class TVCEvents: UITableViewCell {

//    @IBOutlet weak var ViewBorder: UIView!
//    @IBOutlet weak var LblEventsDefaultschedulestarttime: UILabel!
//    @IBOutlet weak var LblEventLocation: UILabel!
//    @IBOutlet weak var LblEventName: UILabel!
//    @IBOutlet weak var LblEventGroupName: UILabel!
    
    var LblEventName = UILabel()
    var LblEventsDefaultschedulestarttime = UILabel()
    var LblEventLocation = UILabel()
    var LblEventGroupName = UILabel()
    
        override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
    
            self.initializeInterfaceElements()
            self.autolayoutInterfaceElements()
        }
    
    
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            self.initializeInterfaceElements()
            self.autolayoutInterfaceElements()
            //fatalError("init(coder:) has not been implemented")
        }
    
//
        func initializeInterfaceElements() {
            self.layer.masksToBounds = true
            self.layer.cornerRadius = 5
            self.layer.borderWidth = 4
            self.layer.shadowOffset = CGSize(width: -2, height: 2)
            self.layer.borderColor = UIColor.black.cgColor
            self.backgroundColor = UIColor.yellow
    
    
            self.LblEventName.translatesAutoresizingMaskIntoConstraints = false
            self.LblEventName.numberOfLines = 0
            self.LblEventName.font = UIFont.systemFont(ofSize: 15.0)
            self.LblEventName.textColor = UIColor.red
            self.contentView.addSubview(self.LblEventName)
            
            self.LblEventsDefaultschedulestarttime.translatesAutoresizingMaskIntoConstraints = false
            self.LblEventsDefaultschedulestarttime.numberOfLines = 0
            self.LblEventsDefaultschedulestarttime.font = UIFont.systemFont(ofSize: 12.0)
            self.LblEventsDefaultschedulestarttime.textColor = UIColor.gray
            self.contentView.addSubview(self.LblEventsDefaultschedulestarttime)
    
            self.LblEventLocation.translatesAutoresizingMaskIntoConstraints = false
            self.LblEventLocation.numberOfLines = 0
            self.LblEventLocation.font = UIFont.systemFont(ofSize: 12.0)
            self.LblEventLocation.textColor = UIColor.lightGray
            self.contentView.addSubview(self.LblEventLocation)
    
            self.LblEventGroupName.translatesAutoresizingMaskIntoConstraints = false
            self.LblEventGroupName.numberOfLines = 0
            self.LblEventGroupName.font = UIFont.systemFont(ofSize: 12.0)
            self.LblEventGroupName.textColor = UIColor.lightGray
            self.contentView.addSubview(self.LblEventGroupName)
        }
//
//    
        func autolayoutInterfaceElements() {
    
            self.LblEventName.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 3.0).isActive = true
            self.LblEventName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
            self.LblEventName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
            self.LblEventName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true

            self.LblEventsDefaultschedulestarttime.topAnchor.constraint(equalTo: self.LblEventName.bottomAnchor, constant: 0.0).isActive = true
            self.LblEventsDefaultschedulestarttime.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
            self.LblEventsDefaultschedulestarttime.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
            self.LblEventsDefaultschedulestarttime.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true

            self.LblEventLocation.topAnchor.constraint(equalTo: self.LblEventsDefaultschedulestarttime.bottomAnchor, constant: 0.0).isActive = true
            self.LblEventLocation.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
            self.LblEventLocation.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
            self.LblEventLocation.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true

            self.LblEventGroupName.topAnchor.constraint(equalTo: self.LblEventLocation.bottomAnchor, constant: 0.0).isActive = true
            self.LblEventGroupName.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15.0).isActive = true
            self.LblEventGroupName.trailingAnchor.constraint(lessThanOrEqualTo: self.contentView.trailingAnchor, constant: -15.0).isActive = true
            self.LblEventGroupName.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -5.0).isActive = true

        }
//
//    
        override func prepareForReuse() {
            self.LblEventsDefaultschedulestarttime.text = ""
            self.LblEventLocation.text = ""
            self.LblEventName.text = ""
            self.LblEventGroupName.text = ""
    
        }

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
