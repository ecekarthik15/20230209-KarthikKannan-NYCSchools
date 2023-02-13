//
//  ContentView.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/9/23.
//

import SwiftUI

struct NYCSchoolsListView: View {
    
    @ObservedObject var schoolsViewModel = NYCSchoolsViewModel()
    @State private var searchText = ""
    var body: some View {
        
        NavigationView {
            List {
                ForEach(result, id: \.dbn) { school in
                    
                    NavigationLink(destination: {
                        NYCSchoolsDetailsView(school: school)
                        
                    }, label: {
                        SchoolRow(school: school)
                            .accessibilityIdentifier("cell \(school.dbn)")
                    })
                    
                }
            }
            .accessibilityIdentifier("listview")
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.brown, Color.gray]), startPoint: .leading, endPoint: .trailing)
            )
            .onAppear {
                
                Task {
                    try await schoolsViewModel.getSchools()
                }
            }
            .padding(0)
            .navigationTitle("New York Schools")
        }
        .searchable(text: $searchText)
    }
    
    var result: [NYCSchool] {
        let matches = schoolsViewModel.schoolList.filter { school in
            school.name.contains(searchText) || school.address.contains(searchText) || school.phoneNumber.contains(searchText)
        }
        
        return searchText.isEmpty ? schoolsViewModel.schoolList : matches
    }
    

    
    struct SchoolRow: View {
        
        let school: NYCSchool
        
        var body: some View {
   
            ZStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(school.name)
                            .accessibilityIdentifier("\(school.dbn) name")
                            .font(.system(size: 18))
                            .font(.headline)
                            .fontWeight(.bold)
                            .lineLimit(3)
                            .padding(.bottom, 5)
                        
                        Text("\(school.address)")
                            .accessibilityIdentifier("\(school.dbn) address")
                            .font(.system(size: 15))
                            .padding(.bottom, 5)
                        
                        HStack(alignment: .center) {
                            Image(systemName: "phone.circle")
                            Text(school.phoneNumber)
                                .accessibilityIdentifier("\(school.dbn) phonenumber")
                                .onTapGesture {
                                    guard let number = URL(string: "tel://" + "\(school.phoneNumber)") else { return }
                                    UIApplication.shared.open(number)
                                }
                        }
                        .padding(.bottom, 5)
                        
                    }
                    .padding(.horizontal, 5)
                    
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [Color.black, Color.brown, Color.gray]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                        
                        VStack {
                            Text("\(school.totalStudents)")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text("students")
                                .accessibilityIdentifier("\(school.dbn) students")
                                .font(.caption)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(width: 70, height: 70, alignment: .center)
                }
            }
            .background(Color.clear)
        }
    }
}

struct NYCSchoolsListView_Previews: PreviewProvider {
    static var previews: some View {
        NYCSchoolsListView()
    }
}
