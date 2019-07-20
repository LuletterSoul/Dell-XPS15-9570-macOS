// Overriding _PTS and _WAK
DefinitionBlock ("", "SSDT", 2, "hack", "PTSWAK", 0x00000000)
{
    External (_SB_.PCI0.PEG0.PEGP._OFF, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.PGOF, MethodObj)
    External (_SB_.PCI0.PEG0.PEGP._ON_, MethodObj)    // 0 Arguments (from opcode)
    External (RMCF.DPTS, IntObj)    // (from opcode)
    External (RMCF.SHUT, IntObj)    // (from opcode)
    External (ZPTS, MethodObj)    // 1 Arguments (from opcode)
    External (ZWAK, MethodObj)    // 1 Arguments (from opcode)

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        If (CondRefOf (\RMCF.SHUT))
        {
            If (LAnd (\RMCF.SHUT, LEqual (0x05, Arg0)))
            {
                Return (Zero)
            }
        }

        If (CondRefOf (\RMCF.DPTS))
        {
            If (\RMCF.DPTS)
            {
                \_SB.PCI0.PEG0.PEGP._ON ()
                
            }
        }

        ZPTS (Arg0)
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (LOr (LLess (Arg0, One), LGreater (Arg0, 0x05)))
        {
            Store (0x03, Arg0)
        }

        Store (ZWAK (Arg0), Local0)
        If (CondRefOf (\RMCF.DPTS))
        {
            If (\RMCF.DPTS)
            {
                \_SB.PCI0.PEG0.PEGP._OFF ()
                \_SB_.PCI0.PGOF(Zero)
            }
        }

        Return (Local0)
    }
}



