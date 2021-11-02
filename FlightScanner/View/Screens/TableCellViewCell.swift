//
//  TableCellViewCell.swift
//  FlightScanner
//
//  Created by L.T.A Neeft on 22/10/2021.
//

import SwiftUI

struct TableCellViewCell: View {
    let image: String
    let depature: String
    let flightNumber: String
    
    var body: some View {
        NavigationLink(
            destination: Text("Destination"),
            label: {
                HStack {
                    Image(systemName: "\(image)")
                    Text(flightNumber)
                    Spacer()
                    Text(depature)
                    
                }
                .font(.body)
            })
        
    }
}

struct TableCellViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TableCellViewCell(image: "paperplane", depature: "HV2022", flightNumber: "")
            .previewLayout(.sizeThatFits)
    }
}
