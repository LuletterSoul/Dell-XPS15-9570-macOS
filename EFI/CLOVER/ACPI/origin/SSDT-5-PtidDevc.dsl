/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-5-PtidDevc.aml, Sun Jul  7 13:20:19 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000027DE (10206)
 *     Revision         0x02
 *     Checksum         0x5A
 *     OEM ID           "INTEL "
 *     OEM Table ID     "PtidDevc"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20160527 (538314023)
 */
DefinitionBlock ("", "SSDT", 2, "INTEL ", "PtidDevc", 0x00001000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_GPE.MMTB, MethodObj)    // Imported: 0 Arguments
    External (_GPE.VHOV, MethodObj)    // Imported: 3 Arguments
    External (_SB_.DTS1, UnknownObj)    // (from opcode)
    External (_SB_.DTS2, UnknownObj)    // (from opcode)
    External (_SB_.DTS3, UnknownObj)    // (from opcode)
    External (_SB_.DTS4, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.GFX0.DD02._BCM, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.B1CI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B1DC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B1DI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B1FC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B1FV, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B1RC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2CI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2DI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2FC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2FV, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2MH, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2ML, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.B2RC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.BMAX, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.BPWR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.CFS2, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.CFSP, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.CMDR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.CPUP, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECAV, IntObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.ECMD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECRD, MethodObj)    // Imported: 1 Arguments
    External (_SB_.PCI0.LPCB.H_EC.ECWT, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.LPCB.H_EC.GTVR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MCPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MCTD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MDT0, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MFSP, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MGPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MGTD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MMPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MMTL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.MPOL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NCPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NCTD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NGPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NGTD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NMTL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.NPOL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PCAD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PDT0, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PDT1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PDT2, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PDT3, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEC0, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEC1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEC2, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEC3, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECD, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECH, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PECI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEHI, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PENV, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEPM, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PEWL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PMAX, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PPDT, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PPWR, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRCS, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRFC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRS0, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRS1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRS2, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRS3, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PRS4, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PWFC, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.PWRL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TMPL, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TSR1, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TSR2, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TSR3, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TSR4, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.LPCB.H_EC.TSR5, UnknownObj)    // (from opcode)
    External (_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PCI0.SAT0.SDSM, MethodObj)    // Imported: 4 Arguments
    External (_SB_.PCI0.XHC_.RHUB.TPLD, MethodObj)    // Imported: 2 Arguments
    External (_SB_.PDTS, UnknownObj)    // (from opcode)
    External (_TZ_.TZ00._TMP, UnknownObj)    // (from opcode)
    External (MDBG, MethodObj)    // Imported: 1 Arguments
    External (PAMT, UnknownObj)    // (from opcode)
    External (TSDB, UnknownObj)    // (from opcode)

    Scope (\_SB)
    {
        Device (PTID)
        {
            Name (_HID, EisaId ("INT340E"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0C02"))  // _CID: Compatible ID
            Name (IVER, 0x00030000)
            Name (_STA, 0x0F)  // _STA: Status
            Method (TSDL, 0, NotSerialized)
            {
                If (LEqual (TSDB, One))
                {
                    Return (TSD2)
                }

                Return (TSD1)
            }

            Name (TSD1, Package (0x26)
            {
                Zero, 
                "CPU Core 0 DTS", 
                Zero, 
                "CPU Core 1 DTS", 
                Zero, 
                "CPU Core 2 DTS", 
                Zero, 
                "CPU Core 3 DTS", 
                Zero, 
                "CPU Core Package DTS", 
                0x03, 
                "DIMM0_hotspot_U4C1", 
                0x03, 
                "DIMM1_hotspot_Q4D1", 
                0x03, 
                "IMVP_conn_Q7C1", 
                0x03, 
                "board_hotspot1_U3G3", 
                0x03, 
                "board_hotspot2_Q3G1", 
                Zero, 
                "CPU Package Temperature", 
                0x05, 
                "PCH DTS Temperature from PCH", 
                Zero, 
                "CPU PECI reading", 
                0x05, 
                "SA DTS Temperature from PCH", 
                0x02, 
                "TZ00 _TMP", 
                0x03, 
                "SDRAM_hotspot_RT5B1", 
                0x03, 
                "NGFF_slot_RT6G1", 
                0x03, 
                "IMVP_conn_RT7D1", 
                0x03, 
                "board_hotspot3_RT8F1"
            })
            Name (TSD2, Package (0x26)
            {
                Zero, 
                "CPU Core 0 DTS", 
                Zero, 
                "CPU Core 1 DTS", 
                Zero, 
                "CPU Core 2 DTS", 
                Zero, 
                "CPU Core 3 DTS", 
                Zero, 
                "CPU Core Package DTS", 
                0x03, 
                "A-Skin Hotspot U21", 
                0x03, 
                "A-Skin Hotspot U21 IR", 
                0x03, 
                "B-Skin Hotspot U1", 
                0x03, 
                "B-Skin Hotspot U1 IR", 
                Zero, 
                "CPU Package Temperature", 
                0x05, 
                "PCH DTS Temperature from PCH", 
                Zero, 
                "CPU PECI reading", 
                0x05, 
                "SA DTS Temperature from PCH", 
                0x02, 
                "TZ00 _TMP", 
                0x03, 
                "SoC VR Thermsitor RT11", 
                0x03, 
                "Memory Thermistor RT9", 
                0x03, 
                "GNSS Board Ambient Thermistor R4", 
                0x03, 
                "System VR Thermistor RT10", 
                0x03, 
                "A-Skin MipiCam Thermistor RT8"
            })
            Name (PSDL, Package (0x26)
            {
                0x0B, 
                "Platform Power (mW)", 
                0x0B, 
                "Brick Power cW(100ths)", 
                0x0B, 
                "Battery Discharge Power cW(100ths)", 
                0x0B, 
                "Platform Average Power (mW)", 
                0x0B, 
                "Brick Average Power cW(0.01)", 
                0x0B, 
                "Battery Discharge Average Power cW(0.01)", 
                0x0C, 
                "Battery 1 Design Capacity (mWh)", 
                0x0C, 
                "Battery 1 Remaining Capacity (mWh)", 
                0x0C, 
                "Battery 1 Full Charge Capacity (mWh)", 
                0x0C, 
                "Battery 1 Full Resolution Voltage (mV)", 
                0x0C, 
                "Battery 1 Full Resolution Discharge Current (mA)", 
                0x0C, 
                "Battery 1 Full Resolution Charge Current (mA)", 
                0x0C, 
                "Battery 2 Remaining Capacity (mWh)", 
                0x0C, 
                "Battery 2 Full Charge Capacity (mWh)", 
                0x0C, 
                "Battery 2 Full Resolution Voltage (mV)", 
                0x0C, 
                "Battery 2 Full Resolution Discharge Current (mA)", 
                0x0C, 
                "Battery 2 Full Resolution Charge Current (mA)", 
                0x0C, 
                "Battery Pack 1 maximum power (mW)", 
                0x0C, 
                "Battery Pack 2 maximum power (mW)"
            })
            Method (OSDL, 0, NotSerialized)
            {
                If (LEqual (TSDB, One))
                {
                    Return (OSD2)
                }

                Return (OSD1)
            }

            Name (OSD1, Package (0x15)
            {
                0x04, 
                "CPU Fan Duty Cycle", 
                "RAW", 
                0x04, 
                "CPU Fan #1 Speed", 
                "RPM", 
                0x03, 
                "Skin Temp 0", 
                "RAW", 
                0x03, 
                "Thermistor 1 ", 
                "RAW", 
                0x03, 
                "Thermistor 2 ", 
                "RAW", 
                0x03, 
                "Thermistor 3 ", 
                "RAW", 
                0x03, 
                "Thermistor 4 ", 
                "RAW"
            })
            Name (OSD2, Package (0x18)
            {
                0x04, 
                "CPU Fan Duty Cycle", 
                "RAW", 
                0x04, 
                "CPU Fan #1 Speed", 
                "RPM", 
                0x03, 
                "Skin Temp 0", 
                "RAW", 
                0x03, 
                "Thermistor 1 ", 
                "RAW", 
                0x03, 
                "Thermistor 2 ", 
                "RAW", 
                0x03, 
                "Thermistor 3 ", 
                "RAW", 
                0x03, 
                "Thermistor 4 ", 
                "RAW", 
                0x03, 
                "Thermistor 5 ", 
                "RAW"
            })
            Method (TSDD, 0, Serialized)
            {
                If (LEqual (TSDB, One))
                {
                    Name (TMPX, Package (0x13)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    })
                    Store (Add (Multiply (\_SB.DTS1, 0x0A), 0x0AAC), Index (TMPX, Zero))
                    Store (Add (Multiply (\_SB.DTS2, 0x0A), 0x0AAC), Index (TMPX, One))
                    Store (Add (Multiply (\_SB.DTS3, 0x0A), 0x0AAC), Index (TMPX, 0x02))
                    Store (Add (Multiply (\_SB.DTS4, 0x0A), 0x0AAC), Index (TMPX, 0x03))
                    Store (Add (Multiply (\_SB.PDTS, 0x0A), 0x0AAC), Index (TMPX, 0x04))
                    If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                    {
                        Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR2)), 0x0AAC), Index (TMPX, 0x06))
                        Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR3)), 0x0AAC), Index (TMPX, 0x07))
                        Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR4)), 0x0AAC), Index (TMPX, 0x08))
                        Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR5)), 0x0AAC), Index (TMPX, 0x09))
                        Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PMAX)), 0x0A), 0x0AAC), Index (TMPX, 0x09))
                        Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PPDT)), 0x0A), 0x0AAC), Index (TMPX, 0x0A))
                        Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PECH)), 0x0A), 0x0AAC), Index (TMPX, 0x0B))
                    }

                    Store (\_TZ.TZ00._TMP, Index (TMPX, 0x0D))
                    Return (TMPX)
                }

                Name (TMPV, Package (0x14)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                })
                Store (Add (Multiply (\_SB.DTS1, 0x0A), 0x0AAC), Index (TMPV, Zero))
                Store (Add (Multiply (\_SB.DTS2, 0x0A), 0x0AAC), Index (TMPV, One))
                Store (Add (Multiply (\_SB.DTS3, 0x0A), 0x0AAC), Index (TMPV, 0x02))
                Store (Add (Multiply (\_SB.DTS4, 0x0A), 0x0AAC), Index (TMPV, 0x03))
                Store (Add (Multiply (\_SB.PDTS, 0x0A), 0x0AAC), Index (TMPV, 0x04))
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR1)), 0x0AAC), Index (TMPV, 0x05))
                    Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR2)), 0x0AAC), Index (TMPV, 0x06))
                    Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR3)), 0x0AAC), Index (TMPV, 0x07))
                    Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR4)), 0x0AAC), Index (TMPV, 0x08))
                    Store (Add (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR5)), 0x0AAC), Index (TMPV, 0x09))
                    Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PMAX)), 0x0A), 0x0AAC), Index (TMPV, 0x0A))
                    Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PPDT)), 0x0A), 0x0AAC), Index (TMPV, 0x0B))
                    Store (Add (Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PECH)), 0x0A), 0x0AAC), Index (TMPV, 0x0C))
                }

                Store (\_TZ.TZ00._TMP, Index (TMPV, 0x0E))
                Return (TMPV)
            }

            Method (PSDD, 0, Serialized)
            {
                Name (PWRV, Package (0x13)
                {
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000, 
                    0x80000000
                })
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CPUP)), Index (PWRV, Zero))
                    Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.BPWR)), 0x0A, Index (PWRV, One))
                    Multiply (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PPWR)), 0x0A, Index (PWRV, 0x02))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1DC)), Index (PWRV, 0x06))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1RC)), Index (PWRV, 0x07))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FC)), Index (PWRV, 0x08))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1FV)), Index (PWRV, 0x09))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1DI)), Index (PWRV, 0x0A))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B1CI)), Index (PWRV, 0x0B))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2RC)), Index (PWRV, 0x0C))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2FC)), Index (PWRV, 0x0D))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2FV)), Index (PWRV, 0x0E))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2DI)), Index (PWRV, 0x0F))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2CI)), Index (PWRV, 0x10))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.BMAX)), Local0)
                    If (Local0)
                    {
                        Not (Or (0xFFFF0000, Local0, Local0), Local0)
                        Multiply (Add (One, Local0, Local0), 0x0A, Local0)
                    }

                    Store (Local0, Index (PWRV, 0x11))
                    Add (ShiftLeft (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2MH)), 0x08), \_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.B2ML)), Local0)
                    If (Local0)
                    {
                        Not (Or (0xFFFF0000, Local0, Local0), Local0)
                        Multiply (Add (One, Local0, Local0), 0x0A, Local0)
                    }

                    Store (Local0, Index (PWRV, 0x12))
                }

                Return (PWRV)
            }

            Method (OSDD, 0, Serialized)
            {
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    If (LEqual (TSDB, One))
                    {
                        Name (OSD2, Package (0x08)
                        {
                            0x80000000, 
                            0x80000000, 
                            0x80000000, 
                            0x80000000, 
                            0x80000000, 
                            0x80000000, 
                            0x80000000, 
                            0x80000000
                        })
                        Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PENV)), Index (OSD2, Zero))
                        Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CFSP)), Index (OSD2, One))
                        Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.TSR3)), Index (OSD2, 0x02))
                        Return (OSD2)
                    }

                    Name (OSD1, Package (0x07)
                    {
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000, 
                        0x80000000
                    })
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PENV)), Index (OSD1, Zero))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.CFSP)), Index (OSD1, One))
                    Return (OSD1)
                }

                Return (Package (0x00){})
            }

            Method (SDSP, 0, NotSerialized)
            {
                Return (0x0A)
            }

            Name (PADA, Package (0x0A)
            {
                One, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x1A, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0xFFFFFFFF
            })
            Name (PADD, Package (0x0A)
            {
                0x02, 
                0x06A4, 
                0x06A0, 
                0x1A, 
                0x62, 
                0x63, 
                0x60, 
                0x61, 
                0x65, 
                0x64
            })
            Method (PADT, 0, NotSerialized)
            {
                If (PAMT)
                {
                    Return (PADA)
                }

                Return (PADD)
            }

            Method (RPMD, 0, Serialized)
            {
                Name (MTMP, Buffer (0x1A){})
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PCAD)), Index (MTMP, 0x06))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEWL)), Index (MTMP, 0x07))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PWRL)), Index (MTMP, 0x08))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PECD)), Index (MTMP, 0x09))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEHI)), Index (MTMP, 0x0A))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PECI)), Index (MTMP, 0x0B))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEPL)), Index (MTMP, 0x0C))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEPM)), Index (MTMP, 0x0D))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PWFC)), Index (MTMP, 0x0E))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PECC)), Index (MTMP, 0x0F))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PDT0)), Index (MTMP, 0x10))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PDT1)), Index (MTMP, 0x11))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PDT2)), Index (MTMP, 0x12))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PDT3)), Index (MTMP, 0x13))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRFC)), Index (MTMP, 0x14))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRS0)), Index (MTMP, 0x15))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRS1)), Index (MTMP, 0x16))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRS2)), Index (MTMP, 0x17))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRS3)), Index (MTMP, 0x18))
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRS4)), Index (MTMP, 0x19))
                }

                Return (MTMP)
            }

            Method (WPMD, 1, NotSerialized)
            {
                If (LNotEqual (SizeOf (Arg0), 0x1A))
                {
                    Return (0xFFFFFFFF)
                }

                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x06)), RefOf (\_SB.PCI0.LPCB.H_EC.PCAD))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x07)), RefOf (\_SB.PCI0.LPCB.H_EC.PEWL))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x08)), RefOf (\_SB.PCI0.LPCB.H_EC.PWRL))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x09)), RefOf (\_SB.PCI0.LPCB.H_EC.PECD))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0A)), RefOf (\_SB.PCI0.LPCB.H_EC.PEHI))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0B)), RefOf (\_SB.PCI0.LPCB.H_EC.PECI))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0C)), RefOf (\_SB.PCI0.LPCB.H_EC.PEPL))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0D)), RefOf (\_SB.PCI0.LPCB.H_EC.PEPM))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0E)), RefOf (\_SB.PCI0.LPCB.H_EC.PWFC))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x0F)), RefOf (\_SB.PCI0.LPCB.H_EC.PECC))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x10)), RefOf (\_SB.PCI0.LPCB.H_EC.PDT0))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x11)), RefOf (\_SB.PCI0.LPCB.H_EC.PDT1))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x12)), RefOf (\_SB.PCI0.LPCB.H_EC.PDT2))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x13)), RefOf (\_SB.PCI0.LPCB.H_EC.PDT3))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x14)), RefOf (\_SB.PCI0.LPCB.H_EC.PRFC))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x15)), RefOf (\_SB.PCI0.LPCB.H_EC.PRS0))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x16)), RefOf (\_SB.PCI0.LPCB.H_EC.PRS1))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x17)), RefOf (\_SB.PCI0.LPCB.H_EC.PRS2))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x18)), RefOf (\_SB.PCI0.LPCB.H_EC.PRS3))
                    \_SB.PCI0.LPCB.H_EC.ECWT (DerefOf (Index (Arg0, 0x19)), RefOf (\_SB.PCI0.LPCB.H_EC.PRS4))
                    \_SB.PCI0.LPCB.H_EC.ECMD (0x67)
                }

                Return (Zero)
            }

            Method (ISPC, 0, NotSerialized)
            {
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    \_SB.PCI0.LPCB.H_EC.ECMD (0x65)
                }

                Return (Zero)
            }

            Method (ENPC, 0, NotSerialized)
            {
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    \_SB.PCI0.LPCB.H_EC.ECMD (0x66)
                }

                Return (Zero)
            }

            Method (RPCS, 0, NotSerialized)
            {
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PRCS)), Local0)
                }

                Return (Local0)
            }

            Method (RPEC, 0, NotSerialized)
            {
                Store (Zero, Local0)
                If (LEqual (\_SB.PCI0.LPCB.H_EC.ECAV, One))
                {
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEC0)), Local1)
                    Or (Local0, Local1, Local0)
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEC1)), Local1)
                    Or (Local0, ShiftLeft (Local1, 0x08), Local0)
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEC2)), Local1)
                    Or (Local0, ShiftLeft (Local1, 0x10), Local0)
                    Store (\_SB.PCI0.LPCB.H_EC.ECRD (RefOf (\_SB.PCI0.LPCB.H_EC.PEC3)), Local1)
                    Or (Local0, ShiftLeft (Local1, 0x18), Local0)
                }

                Return (Local0)
            }
        }
    }
}

