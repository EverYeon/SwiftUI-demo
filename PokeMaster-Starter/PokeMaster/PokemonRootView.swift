
import SwiftUI
import Combine

struct PokemonRootView: View {
    var body: some View {
        if #available(iOS 15.0, *) {
            PokemonList().navigationTitle("宝可梦列表")
        } else {
            // Fallback on earlier versions
        }
    }
}
