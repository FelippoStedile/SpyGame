import SwiftUI

struct LockView: View {
    
    @State var rotation = 0.0
    @State var indicatorColor = Color.cyan
    @State var counter = 0
    
    var body: some View {
        VStack {
            Text("0")
            HStack{
                Text("27")
                    .padding(.horizontal)
                Image(systemName: "triangle.fill")
                    .resizable()
                    .foregroundStyle(indicatorColor)
                    .frame(width: 50, height: 50)
                    .rotationEffect(Angle(degrees: rotation))
                    .focusable(true)
                    .digitalCrownRotation($rotation, from: 0, through: 360, by: 10, sensitivity: ((Int(rotation) <= Constants.shared.correctLocker[counter]+50 && Int(rotation) >= Constants.shared.correctLocker[counter]-50) ? (Int(rotation) == Constants.shared.correctLocker[counter] ? .high : .medium) : .low), isContinuous: true, isHapticFeedbackEnabled: true)
                Text("9")
                    .padding(.horizontal)
            }
            .padding()
            Text("18")
        }
        .onChange(of: rotation) {
            if Int(rotation) == Constants.shared.correctLocker[counter] {
                indicatorColor = Color.green
                Constants.shared.playAudio(audio: "lockerClick")
                if counter == 2 {
                    counter = -1
                }
                counter = counter + 1
            }
            else {
                indicatorColor = Color.cyan
            }
        }
        .padding()
    }
}

#Preview {
    LockView()
}
