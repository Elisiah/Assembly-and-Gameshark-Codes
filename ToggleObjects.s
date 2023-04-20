// Toggle Object Spawns Code when asm had to be manually hooked

.org 0x8002D660
J _tobj // hook
NOP

toggleSpawnsOff:
.byte 0x00
.align 4

// Toggle Object Spawns ON ^ OFF
_tobj:
    LI t0, toggleSpawnsOff
    LB t1, 0x00 (t0)
    BNEZL t1, _tobj_return
    ADDIU a1, r0, 0x0 // No enemies or objects appear
    NOP
_tobj_return:
    ADDIU t7, t7, 0xAC68
    J 0x8002D668// +0x08 from hook
    NOP