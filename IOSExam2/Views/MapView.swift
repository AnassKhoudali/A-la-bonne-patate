import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject var customerInformation : customerInfo;
    var mapView: MKMapView? = nil
    @State var address: String = ""
    @State var city: String = ""
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude : 45.422, longitude: -75.693), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    @State private var locations : [Location] = [
        Location(id: UUID(), type: "restaurant", name: "Resto 1", description: "Restaurant de Hull", latitude: 45.42378, longitude: -75.73201),
        Location(id: UUID(), type: "restaurant", name: "Resto 2", description: "Restaurant d'Ottawa", latitude: 45.37436, longitude: -75.77303)]
    
    @State private var selectedPlace: Location?
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    VStack {
                        if(location.type == "restaurant"){
                            Image(systemName: "star.circle")
                                .resizable()
                                .modifier(RestorantsAnnotationModifier())
                        }
                        else{
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .modifier(CustomersAnnotationModifier())
                        }
                        Text(location.name)
                            .fixedSize()
                    }
                    .onTapGesture {
                        selectedPlace = location
                    }
                }
            }
            VStack{
             TextField("Adresse", text:$address)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .background(.white.opacity(0.9))
                    
                   
                TextField("Ville", text: $city)
                    .padding(.all)
                    .background(.white.opacity(0.9))
                    .offset( y: -7)
                HStack {
                    Spacer()
                    Button(""){
                        FindAddress()
                        
                    }
                    .buttonStyle(SubmitButtonmodifier())
                    .disabled(address == "" || city == "")
                }
                .offset( y: -20)
                Spacer()
            }
            .padding(.all)
            
        }
    }
    func FindAddress() -> Void {
        let searchRequest = MKLocalSearch.Request(); searchRequest.naturalLanguageQuery = "\(address),\(city)"; let search = MKLocalSearch(request: searchRequest);
        searchRequest.region = region;
        search.start { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            customerInformation.customerLocation = Location (id: UUID(), type: "Client", name: "", description: "Customer", latitude: response.mapItems[0].placemark.coordinate.latitude, longitude: response.mapItems[0].placemark.coordinate.longitude);
            locations.append(customerInformation.customerLocation)
            
            //mettre a jour le centre avec animation si l'tilisateur sort de la region d'Ottawa.
            //je sais que ce n'est pas demandé mais ça ajoute à l'expérience utilisateur.
            if(city.lowercased() == "ottawa" || city.lowercased() == "gatineau"){
                withAnimation(.easeInOut(duration: 0.8)){
                    region.center.longitude =  -75.693;
                    region.center.latitude = 45.422;
                }
            }
            else{
                withAnimation(.easeInOut(duration: 0.8)){
                    region.center.longitude = customerInformation.customerLocation.longitude;
                    region.center.latitude = customerInformation.customerLocation.latitude;
                    city = "\(city == "ottawa"))";
                }
                
            }
            address = ""
            city = ""
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(customerInfo())
    }
}
