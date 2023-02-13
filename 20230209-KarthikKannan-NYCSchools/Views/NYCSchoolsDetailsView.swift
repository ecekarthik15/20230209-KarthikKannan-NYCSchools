//
//  NYCSchoolsDetailsView.swift
//  20230209-KarthikKannan-NYCSchools
//
//  Created by Kannan, Karthik (K.) on 2/11/23.
//

import SwiftUI
import MapKit

struct NYCSchoolsDetailsView: View {
    
    @ObservedObject var schoolsViewModel = NYCSchoolsViewModel()
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D.init(latitude: 0.0, longitude: 0.0), span: MKCoordinateSpan.init(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let school: NYCSchool
    
    var body: some View {
        
        HStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 3) {
                    Text(school.name)
                        .accessibilityIdentifier("name")
                        .font(.system(size: 30))
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    if let details = schoolDetails {
                        SATView(schoolDetails: details)
                            .padding(.top, 15)
                    }
                    
                    DetailsView(title: "Overview",
                                description: school.overview)
                    
                    if let sports = school.schoolSports {
                        DetailsView(title: "Sports",
                                    description: sports)
                    }
                    
                    if let extracurricularActivities = school.extracurricularActivities {
                        DetailsView(title: "Extracurricular Activities",
                                    description: extracurricularActivities)
                    }
                    
                    if let bus = school.bus {
                        DetailsView.init(title: "Transport", description: bus)
                    }
                    
                    LocationView(title: "Location",
                                 description: school.address,
                                 phoneNumber:school.phoneNumber,
                                 email: school.email,
                                 website: school.website,
                                 region: $region)
                    
                    Spacer()
                    
                }
                .padding(.leading, 15)
                
                Spacer()
            }
        }
        .onAppear {
            let span = MKCoordinateSpan.init(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let coordinates = CLLocationCoordinate2D.init(latitude: Double(school.latitude ?? "0") ?? 0.0, longitude: Double(school.longitude ?? "0") ?? 0.0)
            
            region =  MKCoordinateRegion(center: coordinates, span: span)
            
            Task {
                try await schoolsViewModel.getSchoolDetails(dbn: school.dbn)
            }
        }
    }
    
    var schoolDetails: NYCSchoolDetails? {
        schoolsViewModel.schoolDetails.count > 0 ? schoolsViewModel.schoolDetails[0] : nil
    }
    
    struct SATView: View {
        let schoolDetails: NYCSchoolDetails
        
        var body: some View {
            VStack(alignment: .leading, spacing: 3){
                Text("SAT Critical Reading Average Score: \(schoolDetails.satCriticaReadingAvgScore)")
                    .accessibilityIdentifier("sat critical reading avg score")
                    .font(.system(size: 15))
                Text("SAT Math Average Score: \(schoolDetails.satMathAvgScore)")
                    .accessibilityIdentifier("sat math avg score")
                    .font(.system(size: 15))
                Text("SAT Writing Average Score: \(schoolDetails.satWritingAvgScore)")
                    .accessibilityIdentifier("sat writing avg score")
                    .font(.system(size: 15))
                
                Divider()
                    .padding(.vertical, 18)
            }
        }
    }
    
    struct DetailsView: View {
        let title: String
        let description: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 3){
                Text("\(title)")
                    .accessibilityIdentifier("\(title) title")
                    .font(.system(size: 25))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                
                Text("\(description)")
                    .accessibilityIdentifier("\(title) description")
                    .font(.system(size: 15))
                
                Divider()
                    .padding(.vertical, 10)
            }
        }
    }
    
    struct LocationView: View {
        let title: String
        let description: String
        let phoneNumber: String
        let email: String?
        let website: String
        
        @Binding var region: MKCoordinateRegion
        
        var body: some View {
            VStack(alignment: .leading, spacing: 3){
                Text("\(title)")
                    .accessibilityIdentifier("\(title) title")
                    .font(.system(size: 25))
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                
                Text("\(description)")
                    .accessibilityIdentifier("\(title) description")
                    .font(.system(size: 15))
                
                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(width: UIScreen.main.bounds.width - 20, height: 150)
                    .padding(.top, 10)
                
                HStack(alignment: .center) {
                    Image(systemName: "phone.circle")
                    Text(phoneNumber)
                        .accessibilityIdentifier("\(title) phoneNumber")
                        .onTapGesture {
                            guard let url = URL(string: "tel://" + "\(phoneNumber)") else { return }
                            if UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }
                }
                .padding(.top, 30)
                if let mail = email {
                    HStack(alignment: .center) {
                        Image(systemName: "mail")
                        Text(mail)
                            .accessibilityIdentifier("\(title) mail")
                            .onTapGesture {
                                if let url = URL(string: "mailto://\(mail)") {
                                    if UIApplication.shared.canOpenURL(url) {
                                        UIApplication.shared.open(url)
                                    }
                                }
                            }
                    }
                    .padding(.top, 30)
                }
                
                NavigationLink (destination: NYCSchoolWebView(url: website)){
                    HStack(alignment: .center) {
                        Image(systemName: "network")
                        Text(website)
                            .accessibilityIdentifier("\(title) website")
                    }
                    .padding(.top, 30)
                }
                Divider()
                    .padding(.vertical, 10)
            }
        }
    }
}

struct NYCSchoolsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let school: NYCSchool = NYCSchool(dbn: "1", name: "2", boro: "3", overview: "4", school10thSeats: "5", academicopportunities1: "6", academicopportunities2: "7", ellPrograms: "8", neighborhood: "21", buildingCode: "23", location: "234", phoneNumber: "4234", faxNumber: "67", email: "12421", website: "241", subway: "4124", bus: "4214", grades2018: "213", finalgrades: "3123", totalStudents: "2321", extracurricularActivities: "2313", schoolSports: "213213", attendanceRate: "6456", pctStuEnoughVariety: "6554", pctStuSafe: "54654", schoolAccessibilityDescription: "6546", directions1: "4124", requirement1: "346346", requirement2: "6346", requirement3: "6456", requirement4: "412412", requirement5: "5235", offerRate1: "6346", program1: "235", code1: "rie", interest1: "12312", method1: "41241", seats9ge1: "5235", grade9gefilledflag1: "6346346", grade9geapplicants1: "3213", seats9swd1: "%#@2", grade9swdfilledflag1: "745646", grade9swdapplicants1: "5235", seats101: "3213", admissionspriority11: "532523", admissionspriority21: "6463", admissionspriority31: "53255", grade9geapplicantsperseat1: "5345345", grade9swdapplicantsperseat1: "543543", primaryAddressLine1: "534543", city: "4234324", zip: "63463465", stateCode: "534534", latitude: "534534", longitude: "5345", communityBoard: "534534", councilDistrict: "534543", censusTract: "5345", bin: "5345", bbl: "5345", nta: "63434", borough: "412412")

        
        NYCSchoolsDetailsView(school: school)
    }
}
