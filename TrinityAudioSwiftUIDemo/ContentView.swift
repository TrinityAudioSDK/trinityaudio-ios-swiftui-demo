import SwiftUI
import TrinityPlayer


struct ContentView: View {

    @StateObject var permissionRequester = AppTrackingPermissionRequester()
    // Use session value to force the screen reload
    @State var session = 0

    var body: some View {
        NavigationView{
            VStack{
                if permissionRequester.isRequestedTrackingPermission {
                    NavigationLink("Main Usage") {
                        DemoContentView(session: $session).id(session)
                    }.padding(.bottom, 20)
                    NavigationLink("Auto Play") {
                        DemoContentView(autoPlay: true, session: $session).id(session)
                    }
                } else {
                    EmptyView()
                }
            }
        }.onAppear(perform: {
            // Request permission for tracking user.
            // After have a permission we could access the IAD
            permissionRequester.request()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
