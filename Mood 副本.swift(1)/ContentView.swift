import SwiftUI

struct ContentView: View {
    @State var bottletoday = [
        bottleImage(Papertext: "", moodtext: "", weathertext: "", tomorrowplan: "", datenow: Date(), tapButton: true, isok: true)
    ]
    @State var Papertext = ""
    @State var moodtext = ""
    @State var weathertext = ""
    @State var tomorrowplan = ""
    @State var tapbottle = false
    var body: some View {
        VStack{
            Text("Mood Bottle")
                .font(.system(size: 40, weight: .black))
                .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                .shadow(color: .red.opacity(0.3), radius: 10, x: 0, y: 5)
                .padding(.top)
            Text("Keep the good mood and imprison the bad mood")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                .shadow(color: .gray.opacity(0.4), radius: 10, x: 0, y: 5)
            Spacer()
            ScrollView (.horizontal, showsIndicators: false){
                LazyHStack{
                    ForEach(bottleImageData.loadProject()){ (bottleImage) in
                        Button{
                            tapbottle.toggle()
                        }label: {
                        VStack{
                        Image("Bottle")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            HStack{
                                Text(bottleImage.datenow, style: .date)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .bold))
                                Text(bottleImage.datenow, style: .time)
                                    .bold()
                                    .foregroundColor(.gray)
                                    .font(.system(size: 10, weight: .bold))
                            }
                        }
                        }.padding()
                    }
                }
            }
            
            Spacer()
            HStack{
                HStack{
                    Button{
                        
                    }label: {
                    Image(systemName: "tray.full.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                        .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding(.trailing)
                    }
                    Button{
                        
                    }label: {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                        .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                }.padding()
                    .background()
                    .cornerRadius(10)
                    .shadow(color: .red.opacity(0.1), radius: 20, x: 0, y: 7)
                HStack{
                    Button{
                        
                        bottleImageData.saveProject(project: bottleImage(Papertext: Papertext, moodtext: moodtext, weathertext: weathertext, tomorrowplan: tomorrowplan, datenow: Date(), tapButton: true, isok: true))
                    }label: {
                    Image(systemName: "plus")
                        .font(.system(size: 30, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                        .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                }.padding()
                    .background()
                    .cornerRadius(10)
                    .shadow(color: .red.opacity(0.1), radius: 20, x: 0, y: 7)
                    .padding(.trailing)
                    .padding(.leading)
                HStack{
                    Button{
                        
                    }label: {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 20, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                        .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 5)
                        .padding(.trailing)
                    }
                    Button{
                        
                    }label: {
                    Image(systemName: "person.fill")
                        .font(.system(size: 23, weight: .heavy))
                        .foregroundColor(Color(red: 0.9, green: 0.3, blue: 0.2))
                        .shadow(color: .red.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                }.padding()
                    .background()
                    .cornerRadius(10)
                    .shadow(color: .red.opacity(0.1), radius: 20, x: 0, y: 7)
            }.padding()
            
        }
        /*ScrollView (.horizontal, showsIndicators: false){
        HStack {
            Image("Bottle")
                .resizable()
                .scaledToFit()
            Image("Bottlehasapaper")
                .resizable()
                .scaledToFit()
            Image("Paper")
                .resizable()
                .scaledToFit()
        }
    }*/
    }
}
