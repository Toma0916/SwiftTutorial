//
//  OrderDetail.swift
//  Tapioca milk tea
//
//  Created by 鈴木透馬 on 2020/04/14.
//  Copyright © 2020 example.com. All rights reserved.
//

import SwiftUI

struct OrderDetail: View {
    // order paramを受け取れるようにOrderEntity型の箱を用意
    var order: OrderEntity
    var dateFormatter: DateFormatter {
        // getter
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    var body: some View {
        VStack {
            Text(order.flavorName)
                .font(.title)
            if order.nataDeCoco {
                Text("Nata de coco")
            }
            if order.iceCream != 0 {
                Text(order.iceCreamName)
            }
            Text(order.other)
            Text(dateFormatter.string(from: order.date))
                .font(.caption)
        }
    }
}

struct OrderDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            OrderDetail(order: orderStore.orders[0])
            OrderDetail(order: orderStore.orders[1])
        }
    }
}
