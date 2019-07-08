// By LuletterSoul

// a "GPIO Controller Enable" patch for ensuring your 

// DSDT notifies the system that your device is GPIO pinned

// TPD0 is the ACPI id of tracpad 

// TPL1 is the ACPI id of touchscreen

// TPD0 and TPL1 are both I2C devices in Dell XPS 9570 ,speacially TPD0, 

// should enable GPIN interuption as VoodooI2C document requirments.



DefinitionBlock ("", "SSDT", 2, "hack", "I2C", 0x00000000)
{
    External (_SB_.PCI0.GPI0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0.SBFB, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPD0.SBFG, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPL1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPL1.SBFB, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPL1.SBFG, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C0.TPL1.XCRS, MethodObj)    // 0 Arguments (from opcode)
    External (_SB_.PCI0.I2C1.TPD0, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPD0.SBFB, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPD0.SBFG, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPL1, DeviceObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPL1.SBFB, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPL1.SBFG, FieldUnitObj)    // (from opcode)
    External (_SB_.PCI0.I2C1.TPL1.XCRS, MethodObj)    // 0 Arguments (from opcode)

    Scope (_SB.PCI0.I2C0.TPD0)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }

    Scope (_SB.PCI0.I2C0.TPL1)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If (CondRefOf (XCRS))
            {
                Return (XCRS ())
            }

            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }

    Scope (_SB.PCI0.I2C1.TPD0)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }

    Scope (_SB.PCI0.I2C1.TPL1)
    {
        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
        {
            If (CondRefOf (XCRS))
            {
                Return (XCRS ())
            }

            Return (ConcatenateResTemplate (SBFB, SBFG))
        }
    }
}

