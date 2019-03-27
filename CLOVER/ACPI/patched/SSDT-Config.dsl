/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20180427 (64-bit version)(RM)
 * Copyright (c) 2000 - 2018 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-Config.aml, Thu Mar 28 21:45:12 2019
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002B2 (690)
 *     Revision         0x02
 *     Checksum         0x82
 *     OEM ID           "hack"
 *     OEM Table ID     "RMCF"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20180427 (538444839)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "RMCF", 0x00000000)
{
    Device (RMCF)
    {
        Name (_ADR, Zero)  // _ADR: Address
        Method (HELP, 0, NotSerialized)
        {
            Store ("TYPE indicates type of the computer. 0: desktop, 1: laptop", Debug)
            Store ("HIGH selects display type. 1: high resolution, 2: low resolution", Debug)
            Store ("IGPI overrides ig-platform-id or snb-platform-id", Debug)
            Store ("DPTS for laptops only. 1: enables/disables DGPU in _WAK/_PTS", Debug)
            Store ("SHUT enables shutdown fix. 1: disables _PTS code when Arg0==5", Debug)
            Store ("AUDL indicates audio layout-id for patched AppleHDA. Ones: no injection", Debug)
            Store ("BKLT indicates the type of backlight control. 0: IntelBacklight, 1: AppleBacklight", Debug)
            Store ("LMAX indicates max for IGPU PWM backlight. Ones: Use default, other values must match framebuffer", Debug)
        }

        Name (TYPE, Zero)
        Name (HIGH, One)
        Name (IGPI, Zero)
        Name (DPTS, One)
        Name (SHUT, One)
        Name (AUDL, 0x1E)
        Name (BKLT, One)
        Name (LMAX, 0x056C)
    }
}

