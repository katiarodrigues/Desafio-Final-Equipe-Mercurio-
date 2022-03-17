//
//  Model.swift
//  DesafioFinal
//
//  Created by Katia Cristina Rodrigues on 14/03/22.
//


import UIKit

import Foundation

struct CriptoData: Codable{

  let asset_id: String
  let name: String?
  let price_usd: Float?
  let id_icon: String?

}

struct Icon: Codable{
  let asset_id: String
  let url: String

}
