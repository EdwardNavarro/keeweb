import Foundation
import Quartz

let printTime = Process.arguments.contains("--print-time")
let startTime = CACurrentMediaTime()

while true {
    let maybeCommand = InputParser.next()
    if let command = maybeCommand {
        command.execute()
        if (printTime) {
            let elapsed = Int((CACurrentMediaTime() - startTime) * 1000);
            let name = String(command.dynamicType)
            print("\(name): \(elapsed)ms")
        }
    } else {
        break
    }
    usleep(100);
}
