
syn_1: 
	dc_shell -f main_1.tcl -o dc_run_1.log

sg_1 : 
	sg_shell -t run_sg_1.tcl |tee sg_run_1.log

syn_2: 
	dc_shell -f main_2.tcl -o run_2.log

syn_2_retime: 
	dc_shell -f main_2_retime.tcl -o run_2_retime.log

sg_2 : 
	sg_shell -t run_sg_2.tcl |tee sg_run_2.log

.PHONY: sg_1 sg_2 syn_1 syn_2 syn_2_retime clean 

clean:
	-@rm -rf adder_1 adder_2 *.rpt *.log
	-rm -rf alib-52 default.svf WORK  *.report_* *.log report_1 log_1 netlist_1 report_2 log_2 netlist_2 report_2_retime log_2_retime netlist_2_retime WORK_2_retime
