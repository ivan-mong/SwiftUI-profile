//
//  Constant.swift
//  MyResumeApp
//
//  Created by Jane Chao on 22/04/20.
//

import Foundation

typealias Experience = (title: String, company: String, start: String, end: String)

struct Resume {
    static let shared = Resume()
    let name = "Ivan Chan"
    let title = "Frontend Developer"
    let location = "Room 1004, Hang Chun House, Cheung Hang Estate, Tsing Yi"
    let skills = ["flutter", "vue", "html", "javascript"]
    let experiences: [Experience] = [("Frontend Developer",
                                      "Boxs",
                                      "09/2023",
                                      "10/2023"),
                                     ("Software Engineer",
                                      "PriSec",
                                      "10/2021",
                                      "06/2023"),
                                     ("Junior Programmer",
                                      "180C",
                                      "4/2019",
                                      "7/2019")]
    let phoneUrl = "tel://54955996"
    let socialMedia: [(name: String, url: String)] = [("LinkedIn", "https://www.linkedin.com/in/ivan-chan-2476bb21a"),
                                                      ("Line", "https://line.me/ti/p/Tc-S393PR2"),
                                                      ("Whatsapp", "https://api.whatsapp.com/send/?phone=54955996&text&type=phone_number&app_absent=0")]
}
