
comp_micromind:
	iverilog -o micromind -c micromind_srclist.txt

comp_signed_qformat:
	iverilog -o signed_qformat signed_qformat.v signed_qformat_tb.v

run_micromind:
	vvp -v micromind

run_signed_qformat:
	vvp -v signed_qformat

all_micromind: comp_micromind run_micromind

all_signed_qformat: comp_signed_qformat run_signed_qformat

gtkwave_micromind:
	gtkwave micromind.vcd &

gtkwave_signed_qformat:
	gtkwave signed_qformat.vcd &

.PHONY: clean
clean:
	rm -f micromind
	rm -f micromind.vcd
	rm -f signed_qformat
	rm -f signed_qformat.vcd
