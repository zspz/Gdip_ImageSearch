;************************************************
; Test script for Gdip_ImageSearch()
; by MasterFocus
; 02/April/2013 00:30h BRT
; Ported to AHK v2 by SP
;************************************************

;ListLines 0
ProcessSetPriority "High"

#Include Gdip_All.ahk
#Include Gdip_ImageSearch.ahk

OnExit EXIT_FUNC

gdipToken := Gdip_Startup()

;;SLEEP 2000
;;bmpHaystack := Gdip_BitmapFromScreen()

bmpHaystack := Gdip_CreateBitmapFromFile("IMG/T-002-haystack-novo.png")
bmpNeedle := Gdip_CreateBitmapFromFile("IMG/T-002-needle-novo.png")
RET := Gdip_ImageSearch(bmpHaystack,bmpNeedle,&LIST:="",0,0,0,0,0,0xFFFFFF,1,0)
Gdip_DisposeImage(bmpHaystack)
Gdip_DisposeImage(bmpNeedle)
Gdip_Shutdown(gdipToken)
MsgBox "Returned: " RET "`n`n" LIST

;; following loop used for pointing to each instance of
;; the needle when the haystack is the screen
/*
CoordMode Mouse, Screen
Loop Parse LIST, `n
{
    Coord := StrSplit(A_LoopField, ",")
    MouseMove Coord[1], Coord[2], 0
    Sleep 200
}
*/

EXIT_FUNC(*) ; be really sure the script will shutdown GDIP
{
    global gdipToken
    try Gdip_Shutdown(gdipToken)
    EXITAPP
}