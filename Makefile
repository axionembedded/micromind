
comp_micromind:
	iverilog -o micromind -c micromind_srclist.txt

comp_qformat:
	iverilog -o qformat qformat.v qformat_tb.v

run_micromind:
	vvp -v micromind

run_qformat:
	vvp -v qformat

all_micromind: comp_micromind run_micromind

all_qformat: comp_qformat run_qformat

gtkwave_micromind:
	gtkwave micromind.vcd &

gtkwave_qformat:
	gtkwave qformat.vcd &

.PHONY: clean
clean:
	rm -f micromind
	rm -f micromind.vcd
	rm -f qformat
	rm -f qformat.vcd
