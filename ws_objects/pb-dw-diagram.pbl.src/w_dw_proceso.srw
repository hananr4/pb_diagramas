$PBExportHeader$w_dw_proceso.srw
forward
global type w_dw_proceso from window
end type
type tab_1 from tab within w_dw_proceso
end type
type tabpage_1 from userobject within tab_1
end type
type cb_10 from commandbutton within tabpage_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_6 from commandbutton within tabpage_1
end type
type cb_5 from commandbutton within tabpage_1
end type
type cb_4 from commandbutton within tabpage_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_2 from datawindow within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_10 cb_10
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type uo_1 from uo_dw_diagrama within tabpage_2
end type
type tabpage_2 from userobject within tab_1
uo_1 uo_1
end type
type tab_1 from tab within w_dw_proceso
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_dw_proceso from window
integer width = 5248
integer height = 1980
boolean titlebar = true
string title = "Procesos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_dw_proceso w_dw_proceso

on w_dw_proceso.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_dw_proceso.destroy
destroy(this.tab_1)
end on

event resize;this.tab_1.resize (newwidth, newheight)
this.tab_1.tabpage_1.dw_1.resize (this.tab_1.tabpage_1.dw_1.width, newheight - 350)
this.tab_1.tabpage_1.dw_2.resize (newwidth - this.tab_1.tabpage_1.dw_1.width - 100, newheight - 350)
this.tab_1.tabpage_2.uo_1.resize (newwidth - 250, newheight - 250)
end event

type tab_1 from tab within w_dw_proceso
integer width = 5211
integer height = 1808
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanging;string ls_actividades, ls_secuencias 
int rc

if newindex = 2 then 
	tab_1.tabpage_2.uo_1.config(tab_1.tabpage_1.dw_1, tab_1.tabpage_1.dw_2)

End If	
	
	

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5175
integer height = 1680
long backcolor = 16777215
string text = "Proceso"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_10 cb_10
cb_8 cb_8
cb_7 cb_7
cb_6 cb_6
cb_5 cb_5
cb_4 cb_4
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
dw_2 dw_2
dw_1 dw_1
end type

on tabpage_1.create
this.cb_10=create cb_10
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_6=create cb_6
this.cb_5=create cb_5
this.cb_4=create cb_4
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.cb_10,&
this.cb_8,&
this.cb_7,&
this.cb_6,&
this.cb_5,&
this.cb_4,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.dw_2,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.cb_10)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_6)
destroy(this.cb_5)
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type cb_10 from commandbutton within tabpage_1
integer x = 3749
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Limpiar"
end type

event clicked;dw_1.reset()
dw_2.reset()
end event

type cb_8 from commandbutton within tabpage_1
integer x = 1307
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Borrar"
end type

event clicked;int row
row = dw_1.GetRow()
if row > 0 Then dw_1.DeleteRow(row)
end event

type cb_7 from commandbutton within tabpage_1
integer x = 891
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nueva"
end type

event clicked;int row
row = dw_1.RowCount()
if row < 1 then row = 0
dw_1.InsertRow(row + 1)


end event

type cb_6 from commandbutton within tabpage_1
integer x = 3255
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Borrar"
end type

event clicked;int row
row = dw_2.GetRow()
if row > 0 Then dw_2.DeleteRow(row)
end event

type cb_5 from commandbutton within tabpage_1
integer x = 2839
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Nueva"
end type

event clicked;


DataWindowChild dwc
dw_2.GetChild('id_actividad_in', dwc)
dwc.Reset()
dw_1.RowsCopy(1, &
      dw_1.RowCount(), Primary!, dwc, 1, Primary!)
dwc.sort()

dw_2.GetChild('id_actividad_out', dwc)
dwc.Reset()

dw_1.RowsCopy(1, &
      dw_1.RowCount(), Primary!, dwc, 1, Primary!)
		
dwc.sort()

int row
row = dw_2.RowCount()
if row < 1 then row = 0
dw_2.InsertRow(row)
end event

type cb_4 from commandbutton within tabpage_1
integer x = 2423
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Importar"
end type

event clicked;dw_2.Reset()
dw_2.importFile(Text!, 'dw_proceso_secuencia.txt')
dw_2.sort()
end event

type cb_3 from commandbutton within tabpage_1
integer x = 2007
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar"
end type

event clicked;dw_2.saveas('dw_proceso_secuencia.txt', Text!, false)
end event

type cb_2 from commandbutton within tabpage_1
integer x = 475
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Importar"
end type

event clicked;dw_1.Reset()
dw_1.importFile(Text!, 'dw_proceso_actividad.txt')
dw_1.sort()

DataWindowChild dwc
dw_2.GetChild('id_actividad_in', dwc)
dwc.Reset()
dwc.importFile(Text!, 'dw_proceso_actividad.txt')
dwc.sort()

dw_2.GetChild('id_actividad_out', dwc)
dwc.Reset()
dwc.importFile(Text!, 'dw_proceso_actividad.txt')
dwc.sort()
end event

type cb_1 from commandbutton within tabpage_1
integer x = 59
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar"
end type

event clicked;dw_1.saveas('dw_proceso_actividad.txt', Text!, false)
end event

type dw_2 from datawindow within tabpage_1
integer x = 2007
integer y = 128
integer width = 3168
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_wf_secuencia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within tabpage_1
integer x = 59
integer y = 128
integer width = 1929
integer height = 1204
integer taborder = 20
string title = "none"
string dataobject = "dw_wf_actividad"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5175
integer height = 1680
long backcolor = 16777215
string text = "Diagrama"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on tabpage_2.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_2.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_dw_diagrama within tabpage_2
integer width = 13737
integer height = 12604
integer taborder = 20
borderstyle borderstyle = styleshadowbox!
end type

on uo_1.destroy
call uo_dw_diagrama::destroy
end on

