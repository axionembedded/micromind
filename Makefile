
comp:
	iverilog -o micromind -c testbench_srclist.txt

run:
	vvp -v micromind

all: comp run

gtkwave:
	gtkwave micromind.vcd
