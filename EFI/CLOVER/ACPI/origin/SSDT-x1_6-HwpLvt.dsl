/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-x1_6-HwpLvt.aml, Sun Jul  7 13:20:19 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000724 (1828)
 *     Revision         0x02
 *     Checksum         0xCA
 *     OEM ID           "PmRef"
 *     OEM Table ID     "HwpLvt"
 *     OEM Revision     0x00003000 (12288)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "PmRef", "HwpLvt", 0x00003000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.CFGD, FieldUnitObj)    // (from opcode)
    External (_SB_.OSCP, IntObj)    // (from opcode)
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PR00, DeviceObj)    // (from opcode)
    External (_SB_.PR01, ProcessorObj)    // (from opcode)
    External (_SB_.PR02, ProcessorObj)    // (from opcode)
    External (_SB_.PR03, ProcessorObj)    // (from opcode)
    External (_SB_.PR04, ProcessorObj)    // (from opcode)
    External (_SB_.PR05, ProcessorObj)    // (from opcode)
    External (_SB_.PR06, ProcessorObj)    // (from opcode)
    External (_SB_.PR07, ProcessorObj)    // (from opcode)
    External (_SB_.PR08, ProcessorObj)    // (from opcode)
    External (_SB_.PR09, ProcessorObj)    // (from opcode)
    External (_SB_.PR10, ProcessorObj)    // (from opcode)
    External (_SB_.PR11, ProcessorObj)    // (from opcode)
    External (_SB_.PR12, ProcessorObj)    // (from opcode)
    External (_SB_.PR13, ProcessorObj)    // (from opcode)
    External (_SB_.PR14, ProcessorObj)    // (from opcode)
    External (_SB_.PR15, ProcessorObj)    // (from opcode)
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (TCNT, FieldUnitObj)    // (from opcode)

    Scope (\_GPE)
    {
        Method (HLVT, 0, Serialized)
        {
            Name (NTVL, 0x83)
            If (LAnd (And (\_SB.CFGD, 0x02000000), And (\_SB.OSCP, 0x1000)))
            {
                Store (0x85, NTVL)
            }

            Switch (ToInteger (TCNT))
            {
                Case (0x10)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                    Notify (\_SB.PR07, NTVL)
                    Notify (\_SB.PR08, NTVL)
                    Notify (\_SB.PR09, NTVL)
                    Notify (\_SB.PR10, NTVL)
                    Notify (\_SB.PR11, NTVL)
                    Notify (\_SB.PR12, NTVL)
                    Notify (\_SB.PR13, NTVL)
                    Notify (\_SB.PR14, NTVL)
                    Notify (\_SB.PR15, NTVL)
                }
                Case (0x0E)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                    Notify (\_SB.PR07, NTVL)
                    Notify (\_SB.PR08, NTVL)
                    Notify (\_SB.PR09, NTVL)
                    Notify (\_SB.PR10, NTVL)
                    Notify (\_SB.PR11, NTVL)
                    Notify (\_SB.PR12, NTVL)
                    Notify (\_SB.PR13, NTVL)
                }
                Case (0x0C)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                    Notify (\_SB.PR07, NTVL)
                    Notify (\_SB.PR08, NTVL)
                    Notify (\_SB.PR09, NTVL)
                    Notify (\_SB.PR10, NTVL)
                    Notify (\_SB.PR11, NTVL)
                }
                Case (0x0A)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                    Notify (\_SB.PR07, NTVL)
                    Notify (\_SB.PR08, NTVL)
                    Notify (\_SB.PR09, NTVL)
                }
                Case (0x08)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                    Notify (\_SB.PR07, NTVL)
                }
                Case (0x07)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                    Notify (\_SB.PR06, NTVL)
                }
                Case (0x06)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                    Notify (\_SB.PR05, NTVL)
                }
                Case (0x05)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                    Notify (\_SB.PR04, NTVL)
                }
                Case (0x04)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                    Notify (\_SB.PR03, NTVL)
                }
                Case (0x03)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                    Notify (\_SB.PR02, NTVL)
                }
                Case (0x02)
                {
                    Notify (\_SB.PR00, NTVL)
                    Notify (\_SB.PR01, NTVL)
                }
                Default
                {
                    Notify (\_SB.PR00, NTVL)
                }

            }
        }
    }
}

