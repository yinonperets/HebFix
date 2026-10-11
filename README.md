# HebFix

**English** | [עברית](#עברית)

Typed in English by mistake while your keyboard was on the wrong layout? Select the text, press **⌃⌥H** (Control + Option + H), and it turns into Hebrew (`akuo` → `שלום`). If the selected text is already Hebrew, it's converted to English instead.

A tiny macOS menu-bar app. No network access, no dependencies.

## Install
1. Download `HebFix.zip` from the [latest release](../../releases/latest), unzip, and drag `HebFix.app` to **Applications**.
2. First launch: **right-click → Open → Open** (the app is not notarized by Apple).
   If still blocked: *System Settings → Privacy & Security → Open Anyway*.
3. Grant permission: *System Settings → Privacy & Security → Accessibility* → enable HebFix. Then choose **עב → Quit** and launch it again.

## Use
Select text → **⌃⌥H**, or click **עב** in the menu bar → *Fix selected text*.
To start at login: *System Settings → General → Login Items → +*.

## Notes
- Standard Hebrew keyboard layout mapping. Shift/uppercase letters are not converted.
- It works by copying the selection, converting it, and pasting; your clipboard is restored afterwards.
- Requires macOS 12+. Universal binary (Apple silicon + Intel).

## Build from source
```bash
swiftc -O main.swift -o HebFix
```
Wrap the binary in a `HebFix.app` bundle with an `Info.plist` containing `LSUIElement = true`.

## Windows
1. Install [AutoHotkey v2](https://www.autohotkey.com/).
2. Download [`windows/HebFix.ahk`](windows/HebFix.ahk) and double-click it. A green **H** icon appears in the tray.
3. Select text → **Ctrl+Alt+H**.
To start with Windows: press `Win+R`, type `shell:startup`, and put a shortcut to `HebFix.ahk` there.
Prefer an `.exe`? Right-click the script → *Compile Script* (Ahk2Exe, bundled with AutoHotkey).

License: MIT

---

<div dir="rtl">

## עברית

<a id="עברית"></a>

כתבתם באנגלית בטעות כשהמקלדת הייתה על השפה הלא נכונה? מסמנים את הטקסט, לוחצים **⌃⌥H** (Control + Option + H), והוא הופך לעברית (`akuo` ← `שלום`). אם הטקסט המסומן כבר בעברית, הוא יומר לאנגלית.

אפליקציית סרגל תפריטים קטנה ל-macOS. בלי גישה לרשת ובלי תלויות.

### התקנה
1. מורידים את `HebFix.zip` מה-[Release האחרון](../../releases/latest), פותחים וגוררים את `HebFix.app` ל-**Applications**.
2. בפעם הראשונה: **לחיצה ימנית ← Open ← Open** (האפליקציה לא מאושרת על ידי Apple).
   אם עדיין חסום: *הגדרות מערכת ← פרטיות ואבטחה ← Open Anyway*.
3. נותנים הרשאה: *הגדרות מערכת ← פרטיות ואבטחה ← נגישות* ← מפעילים את HebFix. אחר כך **עב ← Quit** ופותחים שוב.

### שימוש
מסמנים טקסט ← **⌃⌥H**, או לוחצים על **עב** בסרגל התפריטים ← *Fix selected text*.
להפעלה בכניסה למחשב: *הגדרות מערכת ← כללי ← פריטי כניסה ← +*.

### הערות
- מיפוי של המקלדת העברית הרגילה. אותיות Shift/גדולות לא מומרות.
- האפליקציה מעתיקה את הבחירה, ממירה ומדביקה, ומחזירה את הלוח למצבו.
- דורש macOS 12 ומעלה. תומך גם בשבב Apple וגם ב-Intel.

### בנייה מהמקור
```bash
swiftc -O main.swift -o HebFix
```
עוטפים את הקובץ ב-bundle בשם `HebFix.app` עם `Info.plist` שמכיל `LSUIElement = true`.

### Windows
1. מתקינים [AutoHotkey v2](https://www.autohotkey.com/).
2. מורידים את [`windows/HebFix.ahk`](windows/HebFix.ahk) ופותחים בלחיצה כפולה. מופיע אייקון **H** ירוק במגש המערכת.
3. מסמנים טקסט ← **Ctrl+Alt+H**.
להפעלה עם Windows: `Win+R`, מקלידים `shell:startup`, ושמים שם קיצור ל-`HebFix.ahk`.
רוצים קובץ `.exe`? לחיצה ימנית על הסקריפט ← *Compile Script*.

רישיון: MIT

</div>
