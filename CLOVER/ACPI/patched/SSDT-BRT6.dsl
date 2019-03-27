/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-BRT6.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000F3 (243)
 *     Revision         0x02
 *     Checksum         0x5F
 *     OEM ID           "hack"
 *     OEM Table ID     "BRT6"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20161210 (538317328)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BRT6", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.IGPU.LCD_, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)    // (from opcode)

    Scope (_SB.PCI0.IGPU)
    {
        Method (BRT6, 2, NotSerialized)
        {
            If (LEqual (Arg0, One))
            {
                Notify (^LCD, 0x86)
                Notify (^^LPCB.PS2K, 0x10)
                Notify (^^LPCB.PS2K, 0x0206)
                Notify (^^LPCB.PS2K, 0x0286)
            }

            If (And (Arg0, 0x02))
            {
                Notify (^LCD, 0x87)
                Notify (^^LPCB.PS2K, 0x20)
                Notify (^^LPCB.PS2K, 0x0205)
                Notify (^^LPCB.PS2K, 0x0285)
            }
        }
    }
}

