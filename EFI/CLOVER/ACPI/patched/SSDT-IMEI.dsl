/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-IMEI.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000137 (311)
 *     Revision         0x02
 *     Checksum         0x32
 *     OEM ID           "hack"
 *     OEM Table ID     "IMEI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160422 (538313762)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "IMEI", 0x00000000)
{
    External (_SB_.PCI0.IGPU, DeviceObj)    // (from opcode)

    Device (_SB.PCI0.IMEI)
    {
        Name (_ADR, 0x00160000)  // _ADR: Address
    }

    Scope (_SB.PCI0.IGPU)
    {
        OperationRegion (RMP2, PCI_Config, 0x02, 0x02)
    }

    Scope (_SB.PCI0.IMEI)
    {
        OperationRegion (RMP1, PCI_Config, 0x02, 0x02)
        Field (RMP1, AnyAcc, NoLock, Preserve)
        {
            MDID,   16
        }

        Field (^IGPU.RMP2, AnyAcc, NoLock, Preserve)
        {
            GDID,   16
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LNot (Arg2))
            {
                Return (Buffer (One)
                {
                     0x03                                           
                })
            }

            Store (^GDID, Local1)
            Store (^MDID, Local2)
            If (LAnd (LEqual (0x1C3A, Local2), LNotEqual (Ones, Match (Package (0x02)
                                {
                                    0x0166, 
                                    0x0162
                                }, MEQ, Local1, MTR, Zero, Zero))))
            {
                Return (Package (0x02)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x3A, 0x1E, 0x00, 0x00                         
                    }
                })
            }
            ElseIf (LAnd (LEqual (0x1E3A, Local2), LNotEqual (Ones, Match (Package (0x04)
                                {
                                    0x0116, 
                                    0x0126, 
                                    0x0112, 
                                    0x0122
                                }, MEQ, Local1, MTR, Zero, Zero))))
            {
                Return (Package (0x02)
                {
                    "device-id", 
                    Buffer (0x04)
                    {
                         0x3A, 0x1C, 0x00, 0x00                         
                    }
                })
            }

            Return (Package (0x00){})
        }
    }
}

