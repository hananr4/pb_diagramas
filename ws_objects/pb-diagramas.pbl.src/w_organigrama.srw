$PBExportHeader$w_organigrama.srw
forward
global type w_organigrama from window
end type
type tab_1 from tab within w_organigrama
end type
type tabpage_1 from userobject within tab_1
end type
type cb_3 from commandbutton within tabpage_1
end type
type cb_8 from commandbutton within tabpage_1
end type
type cb_7 from commandbutton within tabpage_1
end type
type cb_2 from commandbutton within tabpage_1
end type
type cb_1 from commandbutton within tabpage_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
cb_3 cb_3
cb_8 cb_8
cb_7 cb_7
cb_2 cb_2
cb_1 cb_1
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
type tab_1 from tab within w_organigrama
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_organigrama from window
integer width = 5248
integer height = 1980
boolean titlebar = true
string title = "Organigrama"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 16777215
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_organigrama w_organigrama

on w_organigrama.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_organigrama.destroy
destroy(this.tab_1)
end on

event resize;this.tab_1.resize (newwidth, newheight)
this.tab_1.tabpage_1.dw_1.resize (newwidth -350, newheight - 350)

this.tab_1.tabpage_2.wb_1.resize (newwidth - 250, newheight - 250)
end event

type tab_1 from tab within w_organigrama
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

event selectionchanging;string ls_organigrama 

if newindex = 2 then 
	ls_organigrama = tab_1.tabpage_1.dw_1.ExportJson()
	
	String ls_url 
	ls_url += url + 'organigrama?organigrama='+ls_organigrama 
	tab_1.tabpage_2.wb_1.Navigate (ls_url)
	
	
End If	
	
	

end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5175
integer height = 1680
long backcolor = 16777215
string text = "Organigrama"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_3 cb_3
cb_8 cb_8
cb_7 cb_7
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
end type

on tabpage_1.create
this.cb_3=create cb_3
this.cb_8=create cb_8
this.cb_7=create cb_7
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.Control[]={this.cb_3,&
this.cb_8,&
this.cb_7,&
this.cb_2,&
this.cb_1,&
this.dw_1}
end on

on tabpage_1.destroy
destroy(this.cb_3)
destroy(this.cb_8)
destroy(this.cb_7)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type cb_3 from commandbutton within tabpage_1
integer x = 1723
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Limpiar"
end type

event clicked;dw_1.Reset()

DataWindowChild dwc
tab_1.tabpage_1.dw_1.GetChild('id_superior', dwc)
dwc.Reset()
dwc.sort()

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
DatawindowChild dwc


dw_1.GetChild('id_superior', dwc)
dwc.Reset()

dw_1.RowsCopy(1, &
      dw_1.RowCount(), Primary!, dwc, 1, Primary!)
		

row = dw_1.RowCount()
if row < 1 then row = 0
dw_1.InsertRow(row + 1)


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
dw_1.importFile(Text!, 'organigrama.txt')
dw_1.sort()

DataWindowChild dwc
dw_1.GetChild('id_superior', dwc)
dwc.Reset()
dwc.importFile(Text!, 'organigrama.txt')
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

event clicked;dw_1.saveas('organigrama.txt', Text!, false)
end event

type dw_1 from datawindow within tabpage_1
integer x = 59
integer y = 128
integer width = 1929
integer height = 1204
integer taborder = 20
string title = "none"
string dataobject = "dw_organigrama"
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
integer taborder = 40
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

