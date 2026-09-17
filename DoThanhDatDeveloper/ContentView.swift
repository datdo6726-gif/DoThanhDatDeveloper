import SwiftUI

struct ContentView: View {
    let skills = [("Swift / SwiftUI", 0.90), ("Python", 0.86),
                  ("JavaScript / TypeScript", 0.82), ("HTML / CSS", 0.92),
                  ("Git / GitHub", 0.80), ("API / Backend", 0.75)]

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(red: 0.02, green: 0.03, blue: 0.07),
                                    Color(red: 0.05, green: 0.09, blue: 0.16)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "chevron.left.forwardslash.chevron.right").foregroundStyle(.cyan)
                        Text("dothanhdat.dev").font(.system(.headline, design: .monospaced))
                        Spacer()
                        Circle().fill(.green).frame(width: 8, height: 8)
                    }
                    card {
                        HStack(spacing: 16) {
                            Circle().fill(LinearGradient(colors: [.cyan, .blue, .purple],
                                                         startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 80, height: 80)
                                .overlay(Text("ĐĐ").font(.title.bold()))
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Đỗ Thành Đạt").font(.title2.bold())
                                Text("Developer • Programmer").foregroundStyle(.cyan)
                                Text("Passion for coding & technology").font(.caption).foregroundStyle(.secondary)
                            }
                        }
                        Text("Xin chào! Tôi là Đỗ Thành Đạt — một developer đam mê lập trình, công nghệ và xây dựng những sản phẩm hiện đại, đẹp mắt, nhanh và dễ sử dụng.")
                            .foregroundStyle(.white.opacity(0.82))
                    }
                    section("about.me", "person.crop.circle") {
                        info("Vai trò", "Developer / Programmer")
                        info("Đam mê", "Lập trình & công nghệ")
                        info("Phong cách", "Clean • Modern • Creative")
                        info("Mục tiêu", "Biến ý tưởng thành sản phẩm")
                    }
                    section("technical.skills", "chevron.left.slash.chevron.right") {
                        ForEach(skills, id: \.0) { item in
                            VStack(alignment: .leading, spacing: 6) {
                                HStack {
                                    Text(item.0)
                                    Spacer()
                                    Text("\(Int(item.1 * 100))%").foregroundStyle(.cyan)
                                }.font(.system(.subheadline, design: .monospaced))
                                ProgressView(value: item.1).tint(.cyan)
                            }
                        }
                    }
                    section("developer.stats", "chart.bar.xaxis") {
                        HStack {
                            stat("03+", "Năm học & code")
                            stat("20+", "Dự án")
                            stat("06+", "Công nghệ")
                        }
                    }
                    section("projects", "folder.fill") {
                        info("01", "Mobile Apps • SwiftUI / iOS")
                        info("02", "Web Projects • HTML / CSS / JS")
                        info("03", "Developer Tools • Python / API")
                    }
                    section("connect", "paperplane.fill") {
                        info("GitHub", "Developer projects")
                        info("Email", "Liên hệ trực tiếp")
                    }
                    Text("© 2026 Đỗ Thành Đạt • Built with SwiftUI")
                        .font(.caption2).foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity, alignment: .center)
                }.padding(18)
            }
        }.preferredColorScheme(.dark)
    }

    @ViewBuilder func card<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content().padding(20).background(.white.opacity(0.06))
            .clipShape(RoundedRectangle(cornerRadius: 24))
            .overlay(RoundedRectangle(cornerRadius: 24).stroke(.white.opacity(0.08)))
    }

    @ViewBuilder func section<Content: View>(_ title: String, _ icon: String,
                                             @ViewBuilder content: () -> Content) -> some View {
        card {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Image(systemName: icon).foregroundStyle(.cyan)
                    Text(title).font(.system(.headline, design: .monospaced))
                    Spacer()
                    Text("{ }").foregroundStyle(.secondary)
                }
                content()
            }
        }
    }

    func info(_ title: String, _ value: String) -> some View {
        HStack {
            Text(title).foregroundStyle(.secondary)
            Spacer()
            Text(value).multilineTextAlignment(.trailing)
        }.font(.subheadline)
    }

    func stat(_ value: String, _ label: String) -> some View {
        VStack {
            Text(value).font(.title2.bold()).foregroundStyle(.cyan)
            Text(label).font(.caption2).foregroundStyle(.secondary).multilineTextAlignment(.center)
        }.frame(maxWidth: .infinity)
    }
}
