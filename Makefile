
comp:
	iverilog -o micromind -c testbench_srclist.txt

run:
	vvp -v micromind

all: comp run

gtkwave:
	gtkwave micromind.vcd &

.PHONY: clean
clean:
	rm -f micromind
	rm -f micromind.vcd
