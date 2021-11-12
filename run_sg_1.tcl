set DESIGN adder_1
open_project adder_1.prj

current_goal lint/lint_rtl -top $DESIGN 
set_goal_option addrules { STARC05-2.10.3.1 }
set_goal_option addrules { STARC05-2.10.3.2 }
set_goal_option addrules { STARC05-2.2.3.1 }
set_parameter check_static_value yes

run_goal

write_report summary > summary.rpt
write_report moresimple > moresimple.rpt

exit -force
