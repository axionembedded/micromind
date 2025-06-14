
comp_micromind:
	iverilog -o micromind -c micromind_srclist.txt

run_micromind:
	vvp -v micromind

all_micromind: comp_micromind run_micromind

gtkwave_micromind:
	gtkwave micromind.vcd &

.PHONY: clean
clean:
	rm -f micromind
	rm -f micromind.vcd
