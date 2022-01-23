$PBExportHeader$w_frame.srw
forward
global type w_frame from window
end type
type mdi_1 from mdiclient within w_frame
end type
end forward

global type w_frame from window
integer width = 4754
integer height = 2056
boolean titlebar = true
string title = "Diagramas"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_frame w_frame

on w_frame.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

type mdi_1 from mdiclient within w_frame
long BackColor=268435456
end type

