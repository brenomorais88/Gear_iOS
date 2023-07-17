//
//  Brand.swift
//  Gear
//
//  Created by Breno Morais on 05/06/23.
//

import Foundation
import UIKit

class Brand: FilterProtocol {
    func getFilterTitle() -> String {
        return "Marca"
    }
    
    func getFilterView() -> UIViewController {
        let viewModel = FilterListOptionsViewModel(filter: self)
        let vc = FilterListOptionsViewController(viewModel: viewModel)
        return vc
    }
    
    func getFilterOptions() -> [String] {
        return ["Fiat","Agrale","Alfa Romeo","AM Gen","Asia Motors","ASTON MARTIN","Audi","Baby","BMW","BRM","Bugre","BYD","CAB Motors","Cadillac","Caoa Chery","CBT Jipe","CHANA","CHANGAN","Chrysler","Citroën","Cross Lander","D2D ","Daewoo","Daihatsu","Dodge","EFFA","Engesa","Envemo","Ferrari","Fibravan","Ford","FOTON","Fyber","GEELY","GM - Chevrolet","GREAT WALL","Gurgel","GWM","HAFEI","HITECH ELECTRIC","Honda","Hyundai","Isuzu","IVECO","JAC","Jaguar","Jeep","JINBEI","JPX","Kia Motors","Lada","LAMBORGHINI","Land Rover","Lexus","LIFAN","LOBINI","Lotus","Mahindra","Maserati","Matra","Mazda","Mclaren","Mercedes-Benz","Mercury","MG","MINI","Mitsubishi","Miura","Nissan","Peugeot","Plymouth","Pontiac","Porsche","RAM","RELY","Renault","Rolls-Royce","Rover","Saab","Saturn","Seat","SHINERAY","smart","SSANGYONG","Subaru","Suzuki","TAC","Toyota","Troller","Volvo","VW - VolksWagen","Wake","Walk"
        ]
    }
    
    func setSelectedFilter(value: String) {}
    func getSelectedFilter() -> String { return  "BMW" }
    func getIcon() -> String { return "icon_location" }
}
