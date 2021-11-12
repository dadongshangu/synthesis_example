
synth_1: 
	dc_shell -f main_1.tcl -o syn_run_1.log

synth_2: 
	dc_shell -f main_2.tcl -o syn_run_2.log

.PHONY: synth_1 synth_2 clean 

clean:
	-rm -rf alib-52 default.svf WORK  *.report_* *.log report_1 log_1 netlist_1 report_2 log_2 netlist_2
