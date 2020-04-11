#!/usr/bin/swift sh

import Foundation
import ArgumentParser // apple/swift-argument-parser

protocol KeyboardMaestroCommand: ParsableCommand {
    var macroId: String { get }
}

extension KeyboardMaestroCommand {
    func runAppleScript(withParameter parameter: String) {
        let source = """
        tell application "Keyboard Maestro Engine" to do script "\(macroId)" with parameter "\(parameter)"
        """
        let appleScript = NSAppleScript(source: source)!
        appleScript.executeAndReturnError(nil)
    }
}

struct KeyboardMaestro: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "km",
        subcommands: [Luna.self]
    )

    struct Luna: KeyboardMaestroCommand {
        let macroId = "A145145E-BA51-433C-807A-2998AF7009E3"

        @Argument(help: "The password of the user")
        var password: String

        func run() {
            runAppleScript(withParameter: password)
        }
    }
}

KeyboardMaestro.main()
