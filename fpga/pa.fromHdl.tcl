
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name teste -dir "C:/Users/bruno.lerner/Desktop/Microproc/teste/planAhead_run_1" -part xc6slx16csg324-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "pins.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {projeto1.vhd}]]
set_property file_type VHDL $hdlfile
set_property library work $hdlfile
set_property top counter $srcset
add_files [list {pins.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16csg324-2
