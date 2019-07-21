// For solving instant wake by hooking GPRW or UPRW


DefinitionBlock("", "SSDT", 2, "hack", "_UPRW", 0)
{
    External(YPRW, MethodObj)
    External(RMCF.DWOU, IntObj)
    Method(GPRW, 2, NotSerialized)
    {
       // when RMCF.DWOU is provided and is zero, patch disabled
       If (CondRefOf(\RMCF.DWOU)) 
      { 
        If (\RMCF.DWOU)
        {
           // either RMCF.DWOU not provided, or is non-zero, patch is enabled
            If (0x6d == Arg0) { Return (Package() { 0x6d, 0, }) }
            If (0x0d == Arg0) { Return (Package() { 0x0d, 0, }) }
        }
      }
        Return (YPRW(Arg0, Arg1))
    }
    
    Method (UPRW, 0, NotSerialized)
    {
        Return (Zero)
    }
    
    
    
    
#ifndef NO_DEFINITIONBLOCK
}
#endif
//EOF
