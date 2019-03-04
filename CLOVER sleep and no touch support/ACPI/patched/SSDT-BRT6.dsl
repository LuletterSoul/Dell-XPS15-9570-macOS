// Fixes internal keyboard brightness keys.
// Contains a remapping of the BRT6 (brightness control) method.
// BRT6 Method in DSDT is renamed to BRTX, and calls to BRT6 land here.
//
// Credit darkhandz: https://github.com/darkhandz/XPS15-9550-Sierra
// Credit bavariancake (stubbing out _SB.PCI0.PEG0.PEGP.BRT6): https://github.com/bavariancake/XPS9570-macOS
DefinitionBlock("", "SSDT", 2, "hack", "BRT6", 0)
{
    External(_SB.PCI0.PEG0.PEGP, DeviceObj)
    External(_SB.PCI0.IGPU, DeviceObj)
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.IGPU.LCD, DeviceObj)

    // Allow IGPU brightness keys to trigger PS/2 codes, which can then control brightness
    Scope(_SB.PCI0.IGPU)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (LEqual (Arg0, One))
            {
                Notify (^LCD, 0x86)    //native code
                Notify (^^LPCB.PS2K, 0x10)    //ELAN code
                Notify (^^LPCB.PS2K, 0x0206) // PS2 code
                Notify (^^LPCB.PS2K, 0x0286) // PS2 code
            }

            If (And (Arg0, 0x02))
            {
                Notify (^LCD, 0x87)    //native code
                Notify (^^LPCB.PS2K, 0x20)    //ELAN code
                Notify (^^LPCB.PS2K, 0x0205) // PS2 code
                Notify (^^LPCB.PS2K, 0x0285) // PS2 code
            }
        }
    }

    // Stub out PEG0/Nvidia discrete graphics brightness function
    Scope(_SB.PCI0.PEG0.PEGP)
    {
        Method (BRT6, 2, NotSerialized)
        {
        }
    }

}
//EOF
