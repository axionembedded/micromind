
comp:
	iverilog -o tb -c testbench_srclist.txt

run:
	vvp -v tb

all: comp run

gtkwave:
	gtkwave tb.vcd
