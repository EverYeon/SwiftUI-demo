
import SwiftUI
import Combine

struct SettingView: View {
    @ObservedObject var settings = Settings()
    var body: some View {
        Form {
            accountSection
            optionSection
            actionSection
        }
    }
    
    var accountSection: some View {
        Section(header: Text("账户")) {
            Picker(selection: $settings.accountBehavior, label: Text("")) {
                ForEach(Settings.AccountBehavior.allCases, id: \.self) {
                    Text($0.text)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            TextField("电子邮箱", text: $settings.email)
            SecureField("密码", text: $settings.password)
            if settings.accountBehavior == .register {
                SecureField("确认密码", text: $settings.verifyPassword)
            }
            Button(settings.accountBehavior.text) {
                print("登录/注册")
            }
        }
    }
    
    var optionSection: some View {
        Section(header: Text("选项")) {
            HStack {
                Text("显示英文名")
                Toggle("", isOn: $settings.showEnglishName)
            }
            HStack {
                Text("排序方式")
                    .foregroundColor(.gray)
                Picker("", selection: $settings.sorting) {
                    ForEach(Settings.Sorting.allCases, id: \.self) {
                        Text($0.text)
                    }
                }
            }
            HStack {
                Text("只显示收藏")
                Toggle("", isOn: $settings.showFavoriteOnly)
            }
        }
    }
    
    var actionSection: some View {
        Button("清空缓存") {
            
        }
        .foregroundColor(.red)
    }
}

struct SettingView_Preview: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
