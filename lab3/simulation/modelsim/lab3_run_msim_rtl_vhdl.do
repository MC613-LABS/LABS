transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {/home/ec2021-fra/ra246973/mc613/LABS-main/lab3/extra_logic.vhd}
vcom -93 -work work {/home/ec2021-fra/ra246973/mc613/LABS-main/lab3/dec2_to_4.vhd}
vcom -93 -work work {/home/ec2021-fra/ra246973/mc613/LABS-main/lab3/mux4_to_1.vhd}
vcom -93 -work work {/home/ec2021-fra/ra246973/mc613/LABS-main/lab3/mux16_to_1.vhd}

