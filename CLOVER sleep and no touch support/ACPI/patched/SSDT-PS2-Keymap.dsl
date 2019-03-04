// Key remaps for the internal PS/2 keyboard
// Uncomment sections as needed, or add new remaps.
DefinitionBlock ("", "SSDT", 2, "hack", "ps2", 0)
{
    Name(_SB.PCI0.LPCB.PS2K.RMCF, Package()
    {
        "Keyboard", Package()
        {
            "Custom ADB Map", Package()
            {
                Package(){},
                // Remap left control to caps lock, and caps lock to left control
                //"3a=3b",    // 3a is PS2 for capslock, 3b is ADB for left control (normal map is 3a=39)
                //"1d=39",    // 1d is PS2 for left control, 39 is ADB for caps lock (normal map is 1d=3b)
                
                // Remap right control to right option
                //"e01d=3d",    // e01d is PS2 for right control, 3d is ADB for right option (normal map is e01d=3e)
            },
        },
    })
}
//EOF
