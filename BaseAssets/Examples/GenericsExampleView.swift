//
//  GenericsExample.swift
//  BaseAssets
//
//  Created by Guilherme - ília on 02/02/22.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct BoolModel {
    let info: Bool?
    
    func removeInfo() -> BoolModel {
        BoolModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil)
    }
}

class GenericsViewModel: ObservableObject {
    @Published var stringModel = StringModel(info: "Hello World")
    @Published var boolModel = BoolModel(info: true)
    @Published var genericStringModel = GenericModel(info: "Hello World")
    @Published var genericBoolModel = GenericModel(info: true)
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        boolModel = boolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
    }
}

struct GenericView<T:View>: View {
    let content: T
    let title: String
    
    var body: some View {
        Text(title)
        content
    }
}

struct GenericsExample: View {
    
    @StateObject private var vm = GenericsViewModel()
    
    var body: some View {
        VStack {
            GenericView(content: Text("custom content"), title: "new view")
            Text(vm.stringModel.info ?? "no data")
            Text(vm.boolModel.info?.description ?? "no data")
            Text(vm.genericStringModel.info ?? "no data")
            Text(vm.genericBoolModel.info?.description ?? "no data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsExample_Previews: PreviewProvider {
    static var previews: some View {
        GenericsExample()
    }
}
