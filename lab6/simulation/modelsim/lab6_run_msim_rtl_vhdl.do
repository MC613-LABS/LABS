transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ec2021-fra/ra198932/MC613/lab6/ff_jk.vhd}

