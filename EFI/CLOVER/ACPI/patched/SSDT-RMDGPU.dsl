// For disabling the discrete GPU
DefinitionBlock ("", "SSDT", 2, "hack", "D-DGPU", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PGOF, MethodObj)    // 1 Arguments (from opcode)

    Device (RMD1)
    {
        Name (_HID, "RMD10000")  // _HID: Hardware ID
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            \_SB.PCI0.PEG0.PEGP._OFF ()
            \_SB_.PCI0.PGOF(Zero)
        }
    }
}

