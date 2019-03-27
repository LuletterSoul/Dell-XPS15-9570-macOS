/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-I2C.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000171 (369)
 *     Revision         0x02
 *     Checksum         0x38
 *     OEM ID           "hack"
 *     OEM Table ID     "I2C"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20170929 (538380585)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPD1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPD1.SBFB, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPD1.SBFG, FieldUnitObj)    // (from opcode)

    Scope (_SB.PCI0.GPI0)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }
    }

    Scope (_SB.PCI0.I2C1.TPD1)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }

    Name (_SB.PCI0.LPCB.PS2K.RMCF, Package (0x08)
    {
        "Mouse", 
        Package (0x02)
        {
            "DisableDevice", 
            ">y"
        }, 

        "Synaptics TouchPad", 
        Package (0x02)
        {
            "DisableDevice", 
            ">y"
        }, 

        "ALPS GlidePoint", 
        Package (0x02)
        {
            "DisableDevice", 
            ">y"
        }, 

        "Sentelic FSP", 
        Package (0x02)
        {
            "DisableDevice", 
            ">y"
        }
    })
}

