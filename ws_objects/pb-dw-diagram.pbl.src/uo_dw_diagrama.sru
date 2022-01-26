$PBExportHeader$uo_dw_diagrama.sru
forward
global type uo_dw_diagrama from userobject
end type
type cb_2 from commandbutton within uo_dw_diagrama
end type
type cb_1 from commandbutton within uo_dw_diagrama
end type
type dw_sec from datawindow within uo_dw_diagrama
end type
type dw_act from datawindow within uo_dw_diagrama
end type
type dw_1 from datawindow within uo_dw_diagrama
end type
type str_flechas from structure within uo_dw_diagrama
end type
end forward

type str_flechas from structure
	string		l_punta1
	string		l_punta2
	string		l_fecha
	string		etiqueta
end type

global type uo_dw_diagrama from userobject
integer width = 3739
integer height = 2604
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
dw_sec dw_sec
dw_act dw_act
dw_1 dw_1
end type
global uo_dw_diagrama uo_dw_diagrama

type variables
String is_g[]
Long il_nro_lineas = 0, il_diagrama

private str_flechas istr_flechas[]

String is_control_dw_move
Long il_x_move, il_y_move


BOOLEAN ib_justo_cambio = false
end variables

forward prototypes
public subroutine uof_create ()
public subroutine uof_create_arrow (integer id)
public subroutine uof_line_create (long fila_conector, long fila_actividad_1, long fila_actividad_2, string as_etiqueta)
public function long uof_get_property_long (string as_nombre, string as_tipo)
public function integer uof_set_property_long (string as_nombre, string as_tipo, string as_valor)
public function integer resize (integer w, integer h)
public subroutine config (datawindow adw_act, datawindow adw_sec)
public subroutine uof_posicion (long fila, long xpos, long ypos)
public subroutine uof_destroy ()
end prototypes

public subroutine uof_create ();

Long li_fila, ll_x, ll_y, ll_id_actividad, ll_ln, li_fila_sec 
String ls_etiqueta, ls_actividades[], ls_nombre_acciones[]
String err, ls_accion, ls_nombre_accion 


uof_destroy( )
dw_1.SetRedraw( false )


String ls_tipo
ll_ln = 0
For li_fila = 1 to dw_act.RowCount( )
	ll_id_actividad = dw_act.Object.id_actividad[li_fila]
	ls_tipo = dw_act.Object.tipo[li_fila]
	ls_accion = dw_act.Object.descripcion[li_fila]
	
	ll_x = dw_act.Object.grafico_x[li_fila]
	if Isnull( ll_x  ) or ll_x < 0  Then ll_x = 0 
	ll_y = dw_act.Object.grafico_y[li_fila]
	if Isnull( ll_y ) or ll_y < 0  Then ll_y = 0 


	String mod_string, ls_filename, ls_nombre
	ls_filename = 'wf_proceso_'+ ls_tipo +'.bmp' 
	
	if Not FileExists (ls_filename ) Then ls_filename = 'wf_proceso_DO.bmp'
	
	ls_nombre = 'p_activ_' + String ( li_fila ) 
	mod_string = 'CREATE bitmap(band=detail '
	mod_string += 'filename="' + ls_filename + '"'
	mod_string += ' x="' + String ( ll_x ) + '" '
	mod_string += 'y="' + String ( ll_y ) + '" '

	If ls_tipo = 'FN' OR ls_tipo = 'IN' OR ls_tipo = 'CI' OR ls_tipo = 'FI'  Then 
		mod_string += 'height="168" '
		mod_string += 'width="192" '
	Else 
		mod_string += 'height="328" '
		mod_string += 'width="466" '
	end if 
	
	mod_string += 	'border="0" '
	mod_string += 'name=' + ls_nombre + ' '
	mod_string += 'visible="1"  moveable=1 transparency="0" pointer="Size!" )' 

	ls_actividades[ li_fila ] = mod_string
	is_g [li_fila] = ls_nombre
	
	
	ls_nombre_accion = 't_accion_'  + String ( li_fila ) 
	mod_string = 'CREATE text(band=detail alignment="2" text="'+  ls_accion +'" border="0" color="0" '
	mod_string += 'x="'+String (ll_x + 40)+'" '
	mod_string += 'y="'+String (ll_y + 80)+'" '
	mod_string += 'height="240" width="398" html.valueishtml="0"  '
	mod_string += 'name='+ ls_nombre_accion + ' ' 
	mod_string += 'visible="1"  font.face="Arial" '
	
	If ls_tipo = 'CI' OR ls_tipo = 'FI'  Then 
		mod_string += 	'font.height="-7" font.weight="500" '
	Else 
		mod_string += 	'font.height="-8" font.weight="700" '
	end if 

	mod_string += 	'moveable=0 font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'
	
	ls_nombre_acciones[ li_fila ] = mod_string


	dw_sec.SetFilter ( 'id_actividad_in='+String( ll_id_actividad ) )
	li_fila_sec = dw_sec.Filter()
	
	For li_fila_sec = 1 to dw_sec.RowCount()
		dw_sec.Object.c_fila_in[li_fila_sec] = li_fila
	Next 

	dw_sec.SetFilter ( 'id_actividad_out='+String( ll_id_actividad ) )
	li_fila_sec = dw_sec.Filter()
	
	For li_fila_sec = 1 to dw_sec.RowCount()
		dw_sec.Object.c_fila_out[li_fila_sec] = li_fila
	Next 

Next 


Long ll_fila_actividad_1
Long ll_fila_actividad_2 


dw_sec.SetFilter ( '' )
dw_sec.Filter()
Int li_flecha = 0
for li_fila_sec = 1 to dw_sec.Rowcount( )
	li_flecha ++ 
	uof_create_arrow( li_flecha )
	ll_fila_actividad_1 = dw_sec.Object.c_fila_in[li_fila_sec]
	dw_sec.Object.c_flecha[li_fila_sec] = li_flecha
Next 
For li_fila = 1 to dw_act.RowCount( )
	mod_string = ls_actividades[ li_fila ] 
	err = dw_1.Modify(mod_string)

	mod_string = ls_nombre_acciones[ li_fila ] 
	err = dw_1.Modify(mod_string)
Next

dw_sec.SetFilter ( '' )
dw_sec.Filter()
li_flecha = 0
for li_fila_sec = 1 to dw_sec.Rowcount( )
	li_flecha  = dw_sec.Object.c_flecha[li_fila_sec] 
	ll_fila_actividad_1 = dw_sec.Object.c_fila_in[li_fila_sec]
	ll_fila_actividad_2 = dw_sec.Object.c_fila_out[li_fila_sec]
	dw_sec.Object.c_Id[li_fila_sec]  = li_fila_sec
	ls_etiqueta = ''
	uof_line_create(li_flecha, ll_fila_actividad_1, ll_fila_actividad_2, ls_etiqueta  )
Next 

dw_1.SetRedraw( true  )
end subroutine

public subroutine uof_create_arrow (integer id);	String err, mod_string, ls_nombre

	ls_nombre = 'l_fecha_' + String (id ) 
	mod_string = 'CREATE line(band=detail x1="0" y1="0" x2="100" y2="100"  '
	mod_string += 'name=' + ls_nombre + ' '
	mod_string += 'visible="1" pen.style="0" pen.width="10" pen.color="0"  )'

	dw_1.Modify(ls_nombre+".TabSequence = 0")

	err = dw_1.Modify(mod_string)
	
	IF err <> "" THEN
		MessageBox("Error",  "Al crear grafico de fecha (flecha = [" + ls_nombre + "])" + err, StopSign!)
		RETURN
	END IF
	
	istr_flechas[id].l_fecha  = ls_nombre
	
	ls_nombre = 'l_punta1_' + String (id ) 
	mod_string = 'CREATE line(band=detail x1="0" y1="0" x2="100" y2="100"  '
	mod_string += 'name=' + ls_nombre + ' '
	mod_string += 'visible="1" pen.style="0" pen.width="5" pen.color="0"  )'

	err = dw_1.Modify(mod_string)
	
	IF err <> "" THEN
			 			  MessageBox("Error",  "Al crear grafico de fecha (punta1 = [" + ls_nombre + "])" + err, StopSign!)
			  RETURN
	END IF
	
	istr_flechas[id].l_punta1 = ls_nombre
	
	
	ls_nombre = 'l_punta2_' + String (id ) 
	mod_string = 'CREATE line(band=detail x1="0" y1="0" x2="100" y2="100"  '
	mod_string += 'name=' + ls_nombre + ' '
	mod_string += 'visible="1" pen.style="0" pen.width="5" pen.color="0"  )'

	err = dw_1.Modify(mod_string)
	
	IF err <> "" THEN
			  MessageBox("Error",  "Al crear grafico de fecha (punta2 = [" + ls_nombre + "])" + err, StopSign!)
			  RETURN
	END IF
	
	istr_flechas[id].l_punta2 = ls_nombre
	

	ls_nombre = 't_etiqueta_' + String (id ) 

	mod_string = 'CREATE text(band=detail alignment="2" text="'+  '' +'" border="0" color="0" '
	mod_string += 'x="'+String (  40)+'" '
	mod_string += 'y="'+String ( 80)+'" '
	mod_string += 'height="240" width="398" html.valueishtml="0"  '
	mod_string += 'name='+ ls_nombre + ' ' 
	mod_string += 'visible="1"  font.face="Arial" font.height="-9" font.weight="700"   moveable=1 font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="553648127" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )'


	err = dw_1.Modify(mod_string)
	istr_flechas[id].etiqueta = ls_nombre
	
	
	

end subroutine

public subroutine uof_line_create (long fila_conector, long fila_actividad_1, long fila_actividad_2, string as_etiqueta);int cuadrante_direccion
Long  ll_Width, ll_Height

if IsNull ( fila_actividad_2 ) or fila_actividad_2 < 1 Then return 


ll_Width = uof_get_property_long( is_g[fila_actividad_2], 'Width') 
ll_Height = uof_get_property_long( is_g[fila_actividad_2], 'Height')  

Long X1, X2,Y1, Y2

if (fila_actividad_1> 0) then 
	X1 = uof_get_property_long( is_g[fila_actividad_1], 'x') + ( uof_get_property_long( is_g[fila_actividad_1], 'Width') / 2  )
	Y1 = uof_get_property_long( is_g[fila_actividad_1], 'y') + ( uof_get_property_long( is_g[fila_actividad_1], 'Height') / 2  )
End if
if (fila_actividad_2> 0) then 
	X2 = uof_get_property_long( is_g[fila_actividad_2], 'x') + ( uof_get_property_long( is_g[fila_actividad_2], 'Width') / 2  )
	Y2 = uof_get_property_long( is_g[fila_actividad_2], 'Y') + ( uof_get_property_long( is_g[fila_actividad_2], 'Height') / 2  )
End if

If X1 > X2 Then
	If Y1> Y2 Then 
		cuadrante_direccion = 1
	Else  
		cuadrante_direccion = 3
	End If 
Else 
	If Y1> Y2 Then 
		cuadrante_direccion = 2
	Else  
		cuadrante_direccion = 4
	End If 
End If 

Double m 
Long Ky, Kx
Long Ty, Tx

	choose case cuadrante_direccion
		case 1
			Kx = X2 + ( ll_Width / 2 )
			Ky = Y2 + ( ll_Height / 2 )
		case 2
			Kx = X2 - ( ll_Width / 2 )
			Ky = Y2 + ( ll_Height / 2 )
		case 3
			Kx = X2 + ( ll_Width / 2 )
			Ky = Y2 - ( ll_Height / 2 )
		case 4
			Kx = X2 - ( ll_Width / 2 )
			Ky = Y2 - ( ll_Height / 2 )
	end choose
	
	if abs ( X2 - X1 )> 0  Then 
		m = (Y2 - Y1) / ( X2 - X1 )

		Ty = m * ( Kx - X1 ) + Y1 
		if m <> 0 Then 
			Tx = ( Ky - Y1 ) / m  + X1 
		Else 
			Tx = Kx
		End If 
	Else 
		Tx = X2 
		Ty = Ky 
	End If 
	
	choose case cuadrante_direccion
		case 1
			If Tx < Kx Then 
				X2 = Tx 
			Else 
				X2 = Kx 
			End If 
			If Ty < Ky Then 
				Y2 = Ty 
			Else 
				Y2 = Ky
			End If 
		case 2
			If Tx > Kx Then 
				X2 = Tx 
			Else 
				X2 = Kx 
			End If 
			If Ty < Ky Then 
				Y2 = Ty 
			Else 
				Y2 = Ky
			End If 
		case 3
			If Tx < Kx Then 
				X2 = Tx 
			Else 
				X2 = Kx 
			End If 
			If Ty > Ky Then 
				Y2 = Ty 
			Else 
				Y2 = Ky
			End If 
		case 4
			If Tx > Kx Then 
				X2 = Tx 
			Else 
				X2 = Kx 
			End If 
			If Ty > Ky Then 
				Y2 = Ty 
			Else 
				Y2 = Ky
			End If 
	end choose



string ls_linea 
ls_linea  = istr_flechas[fila_conector].l_fecha
uof_set_property_long( ls_linea, 'X1', String ( X1 ) )
uof_set_property_long( ls_linea, 'Y1', String ( Y1 ) )
uof_set_property_long( ls_linea, 'X2', String ( X2 ) )
uof_set_property_long( ls_linea, 'Y2', String ( Y2 ) )

Double alpha, epsilon1, epsilon2, angulo_punta, largo_punta
Long PX1, PY1,PX2, PY2
Long SX1, SY1,SX2, SY2

angulo_punta = 25 * pi(1) / 180
largo_punta = 75

If ((Y1 - Y2)^2 + (Y1 - Y2)^2 ) > 0 Then 
	alpha = ABS ( ASin( ABS(Y1 - Y2)/Sqrt( (Y1 - Y2)^2 + (X1 - X2)^2 ) )  ) 
Else 
	alpha = 0
End If 

epsilon1 = alpha - ( angulo_punta / 2  )
epsilon2 = alpha + ( angulo_punta / 2 )

PX1 =  largo_punta * cos(epsilon1)
PY1 =  largo_punta * sin(epsilon1)


PX2 =  largo_punta * cos(epsilon2)
PY2 =  largo_punta * sin(epsilon2)


choose case cuadrante_direccion
	case 1
		SX1 = X2 + PX1 
		SY1 = Y2 + PY1 
		SX2 = X2 + PX2 
		SY2 = Y2 + PY2 
	case 2
		SX1 = X2 - PX1 
		SY1 = Y2 + PY1 
		SX2 = X2 - PX2 
		SY2 = Y2 + PY2 
	case 3
		SX1 = X2 + PX1 
		SY1 = Y2 - PY1 
		SX2 = X2 + PX2 
		SY2 = Y2 - PY2 
	case 4
		SX1 = X2 - PX1 
		SY1 = Y2 - PY1 
		SX2 = X2 - PX2 
		SY2 = Y2 - PY2 
end choose

ls_linea = istr_flechas[fila_conector].l_punta1
uof_set_property_long( ls_linea, 'X1', string ( SX1 ) )
uof_set_property_long( ls_linea, 'Y1', string ( SY1 ) )
uof_set_property_long( ls_linea, 'X2', string ( X2 ) )
uof_set_property_long( ls_linea, 'Y2', string ( Y2 ) )

ls_linea = istr_flechas[fila_conector].l_punta2
uof_set_property_long( ls_linea, 'X1', string ( SX2 ) )
uof_set_property_long( ls_linea, 'Y1', string ( SY2 ) )
uof_set_property_long( ls_linea, 'X2', string ( X2 ) )
uof_set_property_long( ls_linea, 'Y2', string ( Y2 ) )


String ls_etiqueta
ls_etiqueta = istr_flechas[fila_conector].etiqueta 

If Isnull ( as_etiqueta  ) or as_etiqueta = '' Then 
	uof_set_property_long( ls_etiqueta, 'visible', "0" )
Else 
	ll_width =  40 * Len (as_etiqueta)
	uof_set_property_long( ls_etiqueta, 'Width', String ( ll_width ) )
	uof_set_property_long( ls_etiqueta, 'X', String ( Long ( X1 + (X2 - X1)/2 - ( ll_width / 2 ) ) ) )
	uof_set_property_long( ls_etiqueta, 'Y', String ( Long ( Y1 + (Y2 - Y1)/2 ) ) )
	uof_set_property_long( ls_etiqueta, 'Text', as_etiqueta ) 
	uof_set_property_long( ls_etiqueta, 'visible', "1" ) 
End If 	

end subroutine

public function long uof_get_property_long (string as_nombre, string as_tipo);String ls_temp, ls_valor
ls_temp = as_nombre + '.' + as_tipo

ls_valor = dw_1.Describe(ls_temp)

return Long (ls_valor)
end function

public function integer uof_set_property_long (string as_nombre, string as_tipo, string as_valor);String ls_temp, ls_ret
ls_temp = as_nombre + '.' + as_tipo + '="' + as_valor + '"'

ls_ret = dw_1.Modify(ls_temp)
If ls_ret <> '' then
	MessageBox ( 'ERROR', 'Error al actualizar ' + as_nombre+ '.' + as_tipo + ' = "' + as_valor + '"') 
	return -1
end if

return 1
end function

public function integer resize (integer w, integer h);dw_1.resize( w, h)
return 1
end function

public subroutine config (datawindow adw_act, datawindow adw_sec);dw_act.Reset()
dw_sec.Reset()

adw_act.RowsCopy(adw_act.GetRow(), adw_act.RowCount(), Primary!, dw_act, 1, Primary!)
adw_sec.RowsCopy(adw_sec.GetRow(), adw_sec.RowCount(), Primary!, dw_sec, 1, Primary!)

int i
for i = 1 to adw_sec.RowCount()
	adw_sec.Object.c_fila_in[1] = 0
	adw_sec.Object.c_fila_out[1] = 0
	adw_sec.Object.c_fila_false[1] = 0
	adw_sec.Object.c_id[1] = 0
	adw_sec.Object.c_flecha[1] = 0
	adw_sec.Object.c_flecha_false[1] = 0
Next 

uof_destroy( )

uof_create()
end subroutine

public subroutine uof_posicion (long fila, long xpos, long ypos);String ls_etiqueta 
IF xpos < 0 Then xpos = 0 
IF ypos < 0 Then ypos = 0 

dw_act.Object.grafico_x [fila] = xpos
dw_act.Object.grafico_y [fila] = ypos


Long li_fila_sec, ll_id 
Long ll_fila_actividad_1
Long ll_fila_actividad_2 
Int li_flecha 
dw_sec.SetFilter ( 'c_fila_in = ' + String (fila) + ' OR c_fila_out = ' + String (fila)   + ' OR c_fila_false = ' + String (fila)   )
dw_sec.Filter()
for li_fila_sec = 1 to dw_sec.Rowcount( )
	ll_fila_actividad_1 = dw_sec.Object.c_fila_in[li_fila_sec]
	ll_fila_actividad_2 = dw_sec.Object.c_fila_out[li_fila_sec]
	ll_id = dw_sec.Object.c_id[li_fila_sec]
	li_flecha = dw_sec.Object.c_flecha[li_fila_sec]

	ls_etiqueta = ''

	uof_line_create(li_flecha, ll_fila_actividad_1, ll_fila_actividad_2, ls_etiqueta )
	

Next 
end subroutine

public subroutine uof_destroy ();String ls_dataobject

dw_1.SetRedraw( true )

dw_1.reset( )
ls_dataobject= dw_1.dataobject 
dw_1.dataobject = ''
dw_1.dataobject = ls_dataobject
dw_1.InsertRow(0)
end subroutine

on uo_dw_diagrama.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_sec=create dw_sec
this.dw_act=create dw_act
this.dw_1=create dw_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_sec,&
this.dw_act,&
this.dw_1}
end on

on uo_dw_diagrama.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_sec)
destroy(this.dw_act)
destroy(this.dw_1)
end on

type cb_2 from commandbutton within uo_dw_diagrama
integer x = 443
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Vista previa"
end type

event clicked;String ls_preview, ls_err 

setpointer(hourglass!)

ls_preview = dw_1.Object.DataWindow.Print.Preview

if Upper (ls_preview) = 'YES' Then
       ls_err = dw_1.Modify( "DataWindow.Print.Preview = 'No'")
       if ls_err <> "" Then 
	       MessageBox ( 'ERROR', "ERROR: Solo soporta vista preliminar" ) 
       End if 
Else
       ls_err = dw_1.Modify( "DataWindow.Print.Preview = 'Yes'")
       if ls_err <> "" Then 
              MessageBox ( 'ERROR', "ERROR: No soporta vista preliminar" ) 
       End if 
End If



end event

type cb_1 from commandbutton within uo_dw_diagrama
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Guardar"
end type

event clicked;dw_act.saveas('dw_proceso_actividad.txt', Text!, false)
dw_sec.saveas('dw_secuencia_actividad.txt', Text!, false)
end event

type dw_sec from datawindow within uo_dw_diagrama
boolean visible = false
integer x = 1513
integer y = 1584
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_wf_secuencia"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_act from datawindow within uo_dw_diagrama
boolean visible = false
integer x = 123
integer y = 1584
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_wf_actividad"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within uo_dw_diagrama
event ue_cambiar_posicion ( string as_nombre )
event ue_dwnlbuttonup pbm_dwnlbuttonup
event ue_dwnmousemove pbm_dwnmousemove
integer y = 152
integer width = 1522
integer height = 1032
integer taborder = 10
string title = "none"
string dataobject = "dw_wf_grafico"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_cambiar_posicion(string as_nombre);
Long li_id 
String ls_id

		dw_1.setredraw( false )

If Mid ( as_nombre, 1, 8) = 'p_activ_' or Mid ( as_nombre, 1, 9) = 't_accion_' then
	If Mid ( as_nombre, 1, 8) = 'p_activ_' then
		ls_id = mid ( as_nombre, 9, 50)
		il_x_move = uof_get_property_long( 'p_activ_' + ls_id , 'x' )
		il_y_move = uof_get_property_long( 'p_activ_' + ls_id , 'y' )
		uof_set_property_long( 't_accion_' + ls_id , 'x',  String ( il_x_move + 40 ) )
		uof_set_property_long( 't_accion_' + ls_id , 'y',  String ( il_y_move + 80) )
	ElseIf Mid ( as_nombre, 1, 9) = 't_accion_' then
		ls_id = mid ( as_nombre, 10, 50)
		il_x_move = uof_get_property_long( 't_accion_' + ls_id , 'x' )
		il_y_move = uof_get_property_long( 't_accion_' + ls_id , 'y' )
		uof_set_property_long( 'p_activ_' + ls_id , 'x',  String ( il_x_move - 40) )
		uof_set_property_long( 'p_activ_' + ls_id , 'y',  String ( il_y_move - 80) )
	End If 
	li_id = Long ( ls_id )
	If li_id > 0 Then  uof_posicion( li_id, il_x_move, il_y_move )
end if

dw_1.setredraw( true )
end event

event ue_dwnlbuttonup;
ib_justo_cambio = true
dw_1.event post ue_cambiar_posicion( is_control_dw_move )
 
end event

event ue_dwnmousemove;if ib_justo_cambio = true then 
	dw_1.event post ue_cambiar_posicion( dwo.name )
	ib_justo_cambio = false
end if 

end event

