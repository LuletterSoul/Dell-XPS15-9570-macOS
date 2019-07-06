/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-XHC.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000017F (383)
 *     Revision         0x02
 *     Checksum         0x2D
 *     OEM ID           "hack"
 *     OEM Table ID     "XHC"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "XHC", 0x00000000)
{
    External (_SB_.PCI0.XHC_, DeviceObj)    // (from opcode)

    Method (_SB.PCI0.XHC._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LNot (Arg2))
        {
            Return (Buffer (One)
            {
                 0x03                                           
            })
        }

        Store (Package (0x0E)
            {
                "RM,pr2-force", 
                Buffer (0x04)
                {
                     0x00, 0x00, 0x00, 0x00                         
                }, 

                "subsystem-id", 
                Buffer (0x04)
                {
                     0x70, 0x72, 0x00, 0x00                         
                }, 

                "subsystem-vendor-id", 
                Buffer (0x04)
                {
                     0x86, 0x80, 0x00, 0x00                         
                }, 

                "AAPL,current-available", 
                Buffer (0x04)
                {
                     0x34, 0x08, 0x00, 0x00                         
                }, 

                "AAPL,current-extra", 
                Buffer (0x04)
                {
                     0x98, 0x08, 0x00, 0x00                         
                }, 

                "AAPL,current-extra-in-sleep", 
                Buffer (0x04)
                {
                     0x40, 0x06, 0x00, 0x00                         
                }, 

                "AAPL,max-port-current-in-sleep", 
                Buffer (0x04)
                {
                     0x34, 0x08, 0x00, 0x00                         
                }
            }, Local0)
        If (LOr (LOr (CondRefOf (\_SB.PCI0.RMD2), CondRefOf (\_SB.PCI0.RMD3)), CondRefOf (\_SB.PCI0.RMD4)))
        {
            CreateDWordField (DerefOf (Index (Local0, One)), Zero, PR2F)
            Store (0x3FFF, PR2F)
        }

        Return (Local0)
    }
}

