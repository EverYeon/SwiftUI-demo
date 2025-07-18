import SwiftUI
import Combine

struct PokemonInfoPanel: View {
    let model: PokemonViewModel
    
    var abilities: [AbilityViewModel] {
        AbilityViewModel.sample(pokemonID: model.id)
    }
    
    var topIndicator: some View {
        RoundedRectangle(cornerRadius: 3)
            .frame(width: 40, height: 6)
            .opacity(0.2)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            topIndicator
            Header(model: model)
            pokemonDescription
            Divider()
            AbilityList(model: model, abilityModels: abilities)
        }
        .padding(EdgeInsets(
            top: 12, leading: 30, bottom: 30, trailing: 30
        ))
//        .background(Color.white)
        .blurBackground(style: .systemMaterial)
        .cornerRadius(20)
        .fixedSize(horizontal: false, vertical: true)
    }
    
    var pokemonDescription: some View {
        Text(model.description)
            .font(.callout)
            .foregroundColor(Color(hex: 0x666666))
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension PokemonInfoPanel {
    struct Header: View {
        let model: PokemonViewModel
        
        var body: some View {
            HStack(spacing: 18) {
                pokemonIcon
                nameSpecies
                verticalDivider
                bodyStatus
            }
        }
        
        var pokemonIcon: some View {
            Image("Pokemon-\(model.id)")
                .resizable()
                .frame(width: 68, height: 68)
        }
        
        var nameSpecies: some View {
            VStack {
                Text(model.name)
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(model.color)
                Text(model.nameEN)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(model.color)
                Text(model.genus)
                    .font(.system(size: 13, weight: .bold))
                    .foregroundColor(model.color)
                    .padding(.top, 10)
            }
        }
        
        var verticalDivider: some View {
            Rectangle().frame(width: 1, height: 44)
                .foregroundColor(Color.init(hex: 0x000000))
                .opacity(0.1)
        }
        
        var bodyStatus: some View {
            VStack {
                HStack {
                    Text("身高")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.height)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                }
                HStack {
                    Text("体重")
                        .font(.system(size: 11))
                        .foregroundColor(.gray)
                    Text(model.weight)
                        .font(.system(size: 11))
                        .foregroundColor(model.color)
                }
                .padding(.bottom, 12)
                HStack {
                    ForEach(model.types) { type in
                        Text(type.name)
                            .frame(width: 36, height: 14)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(type.color)
                            )
                            .font(.system(size: 11))
                            .foregroundColor(.white)
                
                    }
                }
            }
        }
        
        var typeInfo: some View {
            VStack {
                
            }
        }
    }
}

struct PokemonInfoPanel_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoPanel(model: .sample(id: 1))
    }
}
