//
//  NYCSchoolsViewModelTests.swift
//  20230209-KarthikKannan-NYCSchoolsTests
//
//  Created by Kannan, Karthik (K.) on 2/11/23.
//


import XCTest
@testable import _0230209_KarthikKannan_NYCSchools

class NYCSchoolsViewModelTests: XCTestCase {
    
    var subject: NYCSchoolsViewModel!
    var fakeNYCSchoolClient: FakeNYCSchoolClient!
    
    override func setUp() {
        super.setUp()
        
        //dependencies
        fakeNYCSchoolClient = FakeNYCSchoolClient()
        
        subject = NYCSchoolsViewModel(schoolClient: fakeNYCSchoolClient)
    }
    
    override func tearDown() {
        super.tearDown()
        
        subject = nil
        fakeNYCSchoolClient = nil
    }
    
    func testNetworkClient() {
        XCTAssertNotNil(subject)
    }
    
    func testSchools() async throws {
        
        var expectedResult: [NYCSchool] = [NYCSchool(dbn: "1", name: "2", boro: "3", overview: "4", school10thSeats: "5", academicopportunities1: "6", academicopportunities2: "7", ellPrograms: "8", neighborhood: "21", buildingCode: "23", location: "234", phoneNumber: "4234", faxNumber: "67", email: "12421", website: "241", subway: "4124", bus: "4214", grades2018: "213", finalgrades: "3123", totalStudents: "2321", extracurricularActivities: "2313", schoolSports: "213213", attendanceRate: "6456", pctStuEnoughVariety: "6554", pctStuSafe: "54654", schoolAccessibilityDescription: "6546", directions1: "4124", requirement1: "346346", requirement2: "6346", requirement3: "6456", requirement4: "412412", requirement5: "5235", offerRate1: "6346", program1: "235", code1: "rie", interest1: "12312", method1: "41241", seats9ge1: "5235", grade9gefilledflag1: "6346346", grade9geapplicants1: "3213", seats9swd1: "%#@2", grade9swdfilledflag1: "745646", grade9swdapplicants1: "5235", seats101: "3213", admissionspriority11: "532523", admissionspriority21: "6463", admissionspriority31: "53255", grade9geapplicantsperseat1: "5345345", grade9swdapplicantsperseat1: "543543", primaryAddressLine1: "534543", city: "4234324", zip: "63463465", stateCode: "534534", latitude: "534534", longitude: "5345", communityBoard: "534534", councilDistrict: "534543", censusTract: "5345", bin: "5345", bbl: "5345", nta: "63434", borough: "412412")]
        
        
        //when
        
        fakeNYCSchoolClient.schoolList = expectedResult
        
        try await subject.getSchools()
        
        XCTAssertEqual(subject.schoolList, expectedResult)
    }
    
    func testSchoolDetails() async throws {
        
        let schoolDetails = NYCSchoolDetails(dbn: "dbn", name: "name", noOfSatTestTakers: "12", satCriticaReadingAvgScore: "2313", satMathAvgScore: "232", satWritingAvgScore: "2313")
        
        var expectedResult: [NYCSchoolDetails] = [schoolDetails]
        //when
        fakeNYCSchoolClient.schoolDetails = expectedResult
        
        try await subject.getSchoolDetails(dbn: "test")
        
        XCTAssertEqual(subject.schoolDetails, expectedResult)
    }
    
    
}
