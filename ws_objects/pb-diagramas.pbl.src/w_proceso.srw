$PBExportHeader$w_proceso.srw
forward
global type w_proceso from window
end type
type tab_1 from tab within w_proceso
end type
type tabpage_1 from userobject within tab_1
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
type cb_9 from commandbutton within tabpage_2
end type
type wb_1 from webbrowser within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cb_9 cb_9
wb_1 wb_1
end type
type tab_1 from tab within w_proceso
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_proceso from window
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
global w_proceso w_proceso

on w_proceso.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_proceso.destroy
destroy(this.tab_1)
end on

event resize;this.tab_1.resize (newwidth, newheight)
this.tab_1.tabpage_1.dw_1.resize (this.tab_1.tabpage_1.dw_1.width, newheight - 350)
this.tab_1.tabpage_1.dw_2.resize (newwidth - this.tab_1.tabpage_1.dw_1.width - 100, newheight - 350)
this.tab_1.tabpage_2.wb_1.resize (newwidth - 250, newheight - 250)
end event

event open;
tab_1.tabpage_1.dw_1.Reset()
tab_1.tabpage_1.dw_1.importFile(Text!, 'proceso_actividad.txt')
tab_1.tabpage_1.dw_1.sort()

tab_1.tabpage_1.dw_2.Reset()
tab_1.tabpage_1.dw_2.importFile(Text!, 'proceso_secuencia.txt')
tab_1.tabpage_1.dw_2.sort()

DataWindowChild dwc
tab_1.tabpage_1.dw_2.GetChild('id_actividad_desde', dwc)
dwc.Reset()
dwc.importFile(Text!, 'proceso_actividad.txt')
dwc.sort()

tab_1.tabpage_1.dw_2.GetChild('id_actividad_hasta', dwc)
dwc.Reset()
dwc.importFile(Text!, 'proceso_actividad.txt')
dwc.sort()
end event

type tab_1 from tab within w_proceso
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
	ls_actividades = tab_1.tabpage_1.dw_1.ExportJson()
	ls_secuencias = tab_1.tabpage_1.dw_2.ExportJson()
	
	String ls_url 
	ls_url += url + 'proceso?actividades='+ls_actividades + '&secuenciales=' + ls_secuencias
	rc = tab_1.tabpage_2.wb_1.Navigate (ls_url)
	
	
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
this.Control[]={this.cb_8,&
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
dw_2.GetChild('id_actividad_desde', dwc)
dwc.Reset()
dw_1.RowsCopy(1, &
      dw_1.RowCount(), Primary!, dwc, 1, Primary!)
dwc.sort()

dw_2.GetChild('id_actividad_hasta', dwc)
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
dw_2.importFile(Text!, 'proceso_secuencia.txt')
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

event clicked;dw_2.saveas('proceso_secuencia.txt', Text!, false)
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
dw_1.importFile(Text!, 'proceso_actividad.txt')
dw_1.sort()

DataWindowChild dwc
dw_2.GetChild('id_actividad_desde', dwc)
dwc.Reset()
dwc.importFile(Text!, 'proceso_actividad.txt')
dwc.sort()

dw_2.GetChild('id_actividad_hasta', dwc)
dwc.Reset()
dwc.importFile(Text!, 'proceso_actividad.txt')
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

event clicked;dw_1.saveas('proceso_actividad.txt', Text!, false)
end event

type dw_2 from datawindow within tabpage_1
integer x = 2007
integer y = 128
integer width = 3168
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_proceso_secuencia"
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
string dataobject = "dw_proceso_actividad"
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
cb_9 cb_9
wb_1 wb_1
end type

on tabpage_2.create
this.cb_9=create cb_9
this.wb_1=create wb_1
this.Control[]={this.cb_9,&
this.wb_1}
end on

on tabpage_2.destroy
destroy(this.cb_9)
destroy(this.wb_1)
end on

type cb_9 from commandbutton within tabpage_2
integer y = 12
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Imprimir"
end type

event clicked;Integer li_rtn
String ls_pdfpath
Ls_pdfpath = getcurrentdirectory() + "\printaspdf.pdf"
Li_rtn = wb_1.PrintAsPDF(ls_pdfpath)

run('cmd /c ' + Ls_pdfpath, Minimized! ) 
end event

type wb_1 from webbrowser within tabpage_2
integer width = 3502
integer height = 1600
boolean border = false
borderstyle borderstyle = stylebox!
end type

