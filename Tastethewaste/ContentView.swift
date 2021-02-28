//
//  ContentView.swift
//  Tastethewaste
//
//  Created by Caylie Taylor on 2/27/21.
//

import SwiftUI
import CoreData
/*
 -Bring in Lottie Library
 -Create custom reusable view
 -Update some project settings
 -Add animations
 */
struct ContentView: View {
    
    var body: some View {
      
        NavigationView{
          
            ZStack{
                Color.green
                  
                        
                VStack{
                    
                LottieView(fileName: "flower").frame(width: 600, height: 500, alignment: .center)
                .padding(.bottom, 130.0)
                    LottieView(fileName: "flower2").frame(width: 900, height: 450, alignment: .top).padding(.bottom, 110.0)
                        }
                    
                LottieView(fileName: "flower2").frame(width: 500, height: 400, alignment: .top).padding(.bottom, 90.0)
                
                VStack{
                    NavigationLink(destination: WasteInfo()) {
                     Text("Why is reduced waste important?")
                     .font(.system(size: 25, weight: .semibold, design: .monospaced))
                     .frame(width: 290, height: 80)
                     .background(Color.green)
                     .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                     .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                     .padding(.bottom)
                         .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))}
                        
                    NavigationLink(destination: WasteTracker()) {
                    Text("Track Your Waste")
                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .frame(width: 290, height: 80)
                    .background(Color.green)
                    .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                    .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                    .padding(.bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                    
                                    }
                    
                    NavigationLink(destination: Alternatives())   {
                    Text("Sustainable Alternatives")

                    .font(.system(size: 25, weight: .semibold, design: .monospaced))
                    .frame(width: 290, height: 80)
                    .background(Color.green)
                    .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                    .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                    .padding(.bottom)
                            .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))}
                    
                   
                    
                    }
                }
                
            }
           
        }
    }

import CoreData
struct WasteTracker: View{
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [])
    private var waste:FetchedResults<WasteList>
    
    var  body: some View{
        NavigationView{
            List{
                ForEach(waste){
                    task in Text(task.title ?? "Untitled")
                }.onDelete(perform: deleteTasks)
            }
            .navigationTitle("List of Used Waste")
            .navigationBarItems(trailing: Button("Add Item"){
                addTask()
            })
        }
    }
    private func deleteTasks(offsets: IndexSet){
        withAnimation{
            offsets.map{waste[$0] }.forEach(viewContext.delete)
            saveContext()
        }
    }
    private func saveContext(){
        do{
            try  viewContext.save()
        }catch{
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
            
        }
    }
    private func addTask(){
        withAnimation{
            let newTask = WasteList(context: viewContext)
            newTask.title = "Item Added \(Date())"
            newTask.createdAt = Date()
            
            saveContext()
        }
    }
}

struct WasteInfo: View{
    var  body: some View{
        NavigationView{
            
            ZStack{
            Image( "info")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                LottieView(fileName: "earth").frame(width: 110, height: 150, alignment: .center) .clipShape(Circle())
                    
                Text(
                    " In the past 50 years, humans have consumed more resources than in all previous history. Just in 2018 the total generation of municipal solid waste was 292.4 million tons or 4.9 pounds per person per day. ")
                    .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    .frame(width: 380, height: 130)
                    .background(Color.white)
                    .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                    .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                    .padding(.bottom)
                    .padding(.trailing, 10)
                    .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                    Text(
                        "  Landfills are a major contributor to climate change. The breakdown of organic materials in landfills releases methane (CH4), a greenhouse gas with a Global Warming Potential of up to 72 times that of carbon dioxide (CO2). ")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        .frame(width: 380, height: 145)
                        .background(Color.white)
                        .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                        .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                        .padding(.bottom)
                        .padding(.trailing, 10)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                    Text(
                        "  An estimated 70% of materials sent to landfills in the United States are recoverable, meaning they can be recycled. ")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        .frame(width: 380, height: 110)
                        .background(Color.white)
                        .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                        .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                        .padding(.bottom)
                        .padding(.trailing, 10)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                    Text(
                        "  By sending less waste to landfills in combination with diverting organic materials to composting facilities, there could be a significant reduction in greenhouse gas emissions. ")
                        .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        .frame(width: 380, height: 110)
                        .background(Color.white)
                        .padding(.trailing, 10)
                        .shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
                        .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
                        .padding(.bottom, 150)
                        .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                    
                   
                }
            }
           
            
        }
    }
}

struct Alternatives: View{
    var  body: some View{
        
       
        NavigationView{
            
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.purple]), startPoint: .top, endPoint: .bottom)
                
                HStack{
                    
                    VStack{
                        Image("cottonRound").frame(width: 80, height: 80, alignment: .center) .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))   .padding(.trailing,40)
                        Link("Reusable Cotton Rounds", destination: URL(string: "https://ecoroots.us/products/reusable-cotton-rounds")!) .frame(width: 70, height: 70)  .padding(.trailing, 60)
                            .font(.system(size: 15, weight: .semibold, design: .monospaced))
                        
                    }
                    VStack{
                        Image("napkin").frame(width: 80, height: 80, alignment: .center) .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous)) .padding(.leading, 50)
                        Link("Tutorial for DIY Reusable Napkins", destination: URL(string: "https://myfloatingfeathers.blogspot.com/2011/04/diy-sewing-cloth-napkins.html")!) .frame(width: 90, height: 70)  .padding(.leading, 60) .font(.system(size: 15, weight: .semibold, design: .monospaced))
                    }
                   }
                    HStack{
                        
                        VStack{
                            Image("producebag").frame(width: 80, height: 80, alignment: .center) .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous))
                                .padding(.top, 350)
                                .padding(.trailing, 70)
                            Link("Zero Waste Produce Bag", destination: URL(string: "https://happiestcamper.com/diy-zero-waste-produce-bags/")!) .frame(width: 80, height: 90)
                                .padding(.trailing, 70).font(.system(size: 15, weight: .semibold, design: .monospaced))
                        }
                       
                        VStack{
                            Image("tote").frame(width: 80, height: 80, alignment: .center) .clipShape(RoundedRectangle(cornerRadius: 16, style:.continuous)) .padding(.top, 340) .padding(.leading, 50)
                            Link("Pattern for Reusable Tote", destination: URL(string: "https://www.hgtv.com/design/make-and-celebrate/handmade/make-an-easy-to-sew-lined-tote-bag")!) .frame(width: 90, height: 70)  .padding(.leading, 50).font(.system(size: 15, weight: .bold, design: .monospaced))
                        }
                    
                    }.padding(.bottom, 700)
            }.shadow(color: Color("ShadowGreen"), radius: 20, x: 20, y: 20)
            .shadow(color: Color("LighterGreen"), radius: 20, x: -20, y: -20)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
