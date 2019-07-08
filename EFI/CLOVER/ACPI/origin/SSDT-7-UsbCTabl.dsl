/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-7-UsbCTabl.aml, Sun Jul  7 13:20:19 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000007DC (2012)
 *     Revision         0x02
 *     Checksum         0xE3
 *     OEM ID           "DELL\x"
 *     OEM Table ID     "UsbCTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "DELL\x", "UsbCTabl", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.ECDV, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.ECDV.PATM, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (ECRB, MethodObj)    // 1 Arguments (from opcode)
    External (ECRD, UnknownObj)    // (from opcode)
    External (ECWB, MethodObj)    // 2 Arguments (from opcode)
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (OSYS, UnknownObj)    // (from opcode)
    External (UBCB, UnknownObj)    // (from opcode)
    External (XDCE, UnknownObj)    // (from opcode)

    Mutex (ECMU, 0x00)
    Scope (\_SB)
    {
        Device (UBTC)
        {
            Name (_HID, EisaId ("USBC000"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0CA0"))  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_DDN, "USB Type-C")  // _DDN: DOS Device Name
            Name (_ADR, Zero)  // _ADR: Address
            Name (CRS, ResourceTemplate ()
            {
                Memory32Fixed (ReadWrite,
                    0x00000000,         // Address Base
                    0x00001000,         // Address Length
                    _Y53)
            })
            Method (TPLD, 2, Serialized)
            {
                Name (PCKG, Package (0x01)
                {
                    Buffer (0x10){}
                })
                CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                Store (0x02, REV)
                CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                Store (Arg0, VISI)
                CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                Store (Arg1, GPOS)
                CreateField (DerefOf (Index (PCKG, Zero)), 0x4A, 0x04, SHAP)
                Store (One, SHAP)
                CreateField (DerefOf (Index (PCKG, Zero)), 0x20, 0x10, WID)
                Store (0x08, WID)
                CreateField (DerefOf (Index (PCKG, Zero)), 0x30, 0x10, HGT)
                Store (0x03, HGT)
                Return (PCKG)
            }

            Method (TUPC, 1, Serialized)
            {
                Name (PCKG, Package (0x04)
                {
                    One, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Store (Arg0, Index (PCKG, One))
                Return (PCKG)
            }

            Method (RUCC, 2, Serialized)
            {
                If (LEqual (Arg1, One))
                {
                    Return (TUPC (0x09))
                }
                Else
                {
                    Return (TPLD (One, One))
                }
            }

            Device (TC01)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                {
                    Return (TUPC (0x09))
                }

                Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                {
                    Return (TPLD (One, One))
                }
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateDWordField (CRS, \_SB.UBTC._Y53._BAS, CBAS)  // _BAS: Base Address
                Store (UBCB, CBAS)
                Return (CRS)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (\ECRB (0x80), VER1)
                Store (\ECRB (0x81), VER2)
                ShiftLeft (VER2, 0x08, Local0)
                Or (Local0, VER1, Local0)
                If (LAnd (LGreaterEqual (OSYS, 0x07E1), LNotEqual (Local0, Zero)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            OperationRegion (USBC, SystemMemory, UBCB, 0x38)
            Field (USBC, ByteAcc, Lock, Preserve)
            {
                VER1,   8, 
                VER2,   8, 
                RSV1,   8, 
                RSV2,   8, 
                CCI0,   8, 
                CCI1,   8, 
                CCI2,   8, 
                CCI3,   8, 
                CTL0,   8, 
                CTL1,   8, 
                CTL2,   8, 
                CTL3,   8, 
                CTL4,   8, 
                CTL5,   8, 
                CTL6,   8, 
                CTL7,   8, 
                MGI0,   8, 
                MGI1,   8, 
                MGI2,   8, 
                MGI3,   8, 
                MGI4,   8, 
                MGI5,   8, 
                MGI6,   8, 
                MGI7,   8, 
                MGI8,   8, 
                MGI9,   8, 
                MGIA,   8, 
                MGIB,   8, 
                MGIC,   8, 
                MGID,   8, 
                MGIE,   8, 
                MGIF,   8, 
                MGO0,   8, 
                MGO1,   8, 
                MGO2,   8, 
                MGO3,   8, 
                MGO4,   8, 
                MGO5,   8, 
                MGO6,   8, 
                MGO7,   8, 
                MGO8,   8, 
                MGO9,   8, 
                MGOA,   8, 
                MGOB,   8, 
                MGOC,   8, 
                MGOD,   8, 
                MGOE,   8, 
                MGOF,   8
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg0, ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f")))
                {
                    Switch (ToInteger (Arg2))
                    {
                        Case (Zero)
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                           
                            })
                        }
                        Case (One)
                        {
                            \ECWB (0xA0, MGO0)
                            \ECWB (0xA1, MGO1)
                            \ECWB (0xA2, MGO2)
                            \ECWB (0xA3, MGO3)
                            \ECWB (0xA4, MGO4)
                            \ECWB (0xA5, MGO5)
                            \ECWB (0xA6, MGO6)
                            \ECWB (0xA7, MGO7)
                            \ECWB (0xA8, MGO8)
                            \ECWB (0xA9, MGO9)
                            \ECWB (0xAA, MGOA)
                            \ECWB (0xAB, MGOB)
                            \ECWB (0xAC, MGOC)
                            \ECWB (0xAD, MGOD)
                            \ECWB (0xAE, MGOE)
                            \ECWB (0xAF, MGOF)
                            \ECWB (0x88, CTL0)
                            \ECWB (0x89, CTL1)
                            \ECWB (0x8A, CTL2)
                            \ECWB (0x8B, CTL3)
                            \ECWB (0x8C, CTL4)
                            \ECWB (0x8D, CTL5)
                            \ECWB (0x8E, CTL6)
                            \ECWB (0x8F, CTL7)
                            \ECWB (0xB0, 0xE0)
                        }
                        Case (0x02)
                        {
                            Store (\ECRB (0x90), MGI0)
                            Store (\ECRB (0x91), MGI1)
                            Store (\ECRB (0x92), MGI2)
                            Store (\ECRB (0x93), MGI3)
                            Store (\ECRB (0x94), MGI4)
                            Store (\ECRB (0x95), MGI5)
                            Store (\ECRB (0x96), MGI6)
                            Store (\ECRB (0x97), MGI7)
                            Store (\ECRB (0x98), MGI8)
                            Store (\ECRB (0x99), MGI9)
                            Store (\ECRB (0x9A), MGIA)
                            Store (\ECRB (0x9B), MGIB)
                            Store (\ECRB (0x9C), MGIC)
                            Store (\ECRB (0x9D), MGID)
                            Store (\ECRB (0x9E), MGIE)
                            Store (\ECRB (0x9F), MGIF)
                            Store (\ECRB (0x84), CCI0)
                            Store (\ECRB (0x85), CCI1)
                            Store (\ECRB (0x86), CCI2)
                            Store (\ECRB (0x87), CCI3)
                        }
                        Case (0x03)
                        {
                            Return (XDCE)
                        }

                    }
                }

                Return (Zero)
            }
        }
    }

    Scope (\_SB.PCI0.LPCB.ECDV)
    {
        Method (_Q79, 0, NotSerialized)  // _Qxx: EC Query
        {
            If (LNotEqual (\ECRD, One))
            {
                Return (Zero)
            }

            Acquire (ECMU, 0xFFFF)
            Store (\ECRB (0x90), \_SB.UBTC.MGI0)
            Store (\ECRB (0x91), \_SB.UBTC.MGI1)
            Store (\ECRB (0x92), \_SB.UBTC.MGI2)
            Store (\ECRB (0x93), \_SB.UBTC.MGI3)
            Store (\ECRB (0x94), \_SB.UBTC.MGI4)
            Store (\ECRB (0x95), \_SB.UBTC.MGI5)
            Store (\ECRB (0x96), \_SB.UBTC.MGI6)
            Store (\ECRB (0x97), \_SB.UBTC.MGI7)
            Store (\ECRB (0x98), \_SB.UBTC.MGI8)
            Store (\ECRB (0x99), \_SB.UBTC.MGI9)
            Store (\ECRB (0x9A), \_SB.UBTC.MGIA)
            Store (\ECRB (0x9B), \_SB.UBTC.MGIB)
            Store (\ECRB (0x9C), \_SB.UBTC.MGIC)
            Store (\ECRB (0x9D), \_SB.UBTC.MGID)
            Store (\ECRB (0x9E), \_SB.UBTC.MGIE)
            Store (\ECRB (0x9F), \_SB.UBTC.MGIF)
            Store (\ECRB (0x84), \_SB.UBTC.CCI0)
            Store (\ECRB (0x85), \_SB.UBTC.CCI1)
            Store (\ECRB (0x86), \_SB.UBTC.CCI2)
            Store (\ECRB (0x87), \_SB.UBTC.CCI3)
            Notify (\_SB.UBTC, 0x80)
            Release (ECMU)
        }
    }
}

