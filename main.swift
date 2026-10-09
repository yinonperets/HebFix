import Cocoa
import Carbon

let en = Array("qwertyuiopasdfghjkl;'zxcvbnm,./")
let he = Array("/'קראטוןםפשדגכעיחלךף,זסבהנמצתץ.")
var toHe = [Character: Character](), toEn = [Character: Character]()
for (e, h) in zip(en, he) { toHe[e] = h; toEn[h] = e }

func convert(_ s: String) -> String {
    let hasHebrew = s.unicodeScalars.contains { (0x5D0...0x5EA).contains($0.value) }
    let m = hasHebrew ? toEn : toHe
    return String(s.map { m[$0] ?? $0 })
}

func key(_ code: CGKeyCode, cmd: Bool = true) {
    for down in [true, false] {
        let e = CGEvent(keyboardEventSource: nil, virtualKey: code, keyDown: down)
        e?.flags = cmd ? .maskCommand : []
        e?.post(tap: .cghidEventTap)
    }
}

func fix() {
    let pb = NSPasteboard.general
    let saved = pb.string(forType: .string)
    pb.clearContents()
    key(8) // cmd+C
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
        guard let sel = pb.string(forType: .string), !sel.isEmpty else {
            pb.clearContents(); if let s = saved { pb.setString(s, forType: .string) }; return
        }
        pb.clearContents()
        pb.setString(convert(sel), forType: .string)
        key(9) // cmd+V
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            pb.clearContents(); if let s = saved { pb.setString(s, forType: .string) }
        }
    }
}

class App: NSObject, NSApplicationDelegate {
    let item = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    @objc func run() { fix() }
    func applicationDidFinishLaunching(_ n: Notification) {
        _ = AXIsProcessTrustedWithOptions([kAXTrustedCheckOptionPrompt.takeUnretainedValue(): true] as CFDictionary)
        item.button?.title = "עב"
        let menu = NSMenu()
        menu.addItem(withTitle: "Fix selected text (⌃⌥H)", action: #selector(run), keyEquivalent: "").target = self
        menu.addItem(withTitle: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        item.menu = menu
        // ponytail: fixed hotkey ⌃⌥H; make configurable if needed
        var ref: EventHotKeyRef?
        var spec = EventTypeSpec(eventClass: OSType(kEventClassKeyboard), eventKind: UInt32(kEventHotKeyPressed))
        InstallEventHandler(GetApplicationEventTarget(), { _, _, _ in fix(); return noErr }, 1, &spec, nil, nil)
        RegisterEventHotKey(UInt32(kVK_ANSI_H), UInt32(controlKey | optionKey), EventHotKeyID(signature: 0x48454246, id: 1), GetApplicationEventTarget(), 0, &ref)
    }
}

let app = NSApplication.shared
let delegate = App()
app.delegate = delegate
app.setActivationPolicy(.accessory)
app.run()
