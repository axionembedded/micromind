
comp_micromind:
	iverilog -o micromind -c micromind_srclist.txt

comp_q_format:
	iverilog -o q_format q_format.v q_format_tb.v

run_micromind:
	vvp -v micromind

run_q_format:
	vvp -v q_format

all_micromind: comp_micromind run_micromind

all_q_format: comp_q_format run_q_format

gtkwave_micromind:
	gtkwave micromind.vcd &

gtkwave_signed_qformat:
	gtkwave q_format.vcd &

.PHONY: clean
clean:
	rm -f micromind
	rm -f micromind.vcd
	rm -f q_format
	rm -f q_format.vcd
