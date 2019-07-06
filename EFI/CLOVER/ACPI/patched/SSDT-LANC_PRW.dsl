/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-LANC_PRW.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000080 (128)
 *     Revision         0x02
 *     Checksum         0xBC
 *     OEM ID           "hack"
 *     OEM Table ID     "LANC_PRW"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "LANC_PRW", 0x00000000)
{
    External (_SB_.PCI0.LANC, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LANC.XPRW, MethodObj)    // 0 Arguments (from opcode)

    Method (_SB.PCI0.LANC._PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
    {
        Store (\_SB.PCI0.LANC.XPRW (), Local0)
        Store (Zero, Index (Local0, One))
        Return (Local0)
    }
}

