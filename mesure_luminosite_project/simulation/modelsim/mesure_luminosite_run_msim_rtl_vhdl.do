transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {E:/ProjetFPGA/mesure_luminosite_project/mesure_luminosite.vhd}

