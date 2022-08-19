import MapKit
import Foundation


struct Location: Identifiable, Codable, Equatable {
    var id: UUID
    var type: String
    var name: String
    var description: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let defaultLocations = [
        Location(id: UUID(), type: "restaurant", name: "Resto 1", description: "Restaurant de Hull", latitude: 45.42378, longitude: -75.73201),
        Location(id: UUID(), type: "restaurant", name: "Resto 2", description: "Restaurant d'Ottawa", latitude: 45.37436, longitude: -75.77303) ]
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
    func isEqualTo(_ location : Location)-> Bool{
        if(self.latitude == location.latitude && self.longitude == location.longitude){
            return true
        }
        return false
    }
}
