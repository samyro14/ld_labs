project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE rca_to_sev.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY rca_to_sev
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_C10 -to a[0]   ;# SW[0]
set_location_assignment PIN_C11 -to a[1]  ;# SW[0]
set_location_assignment PIN_D12 -to a[2]   ;# SW[0]
set_location_assignment PIN_C12 -to a[3]  ;# SW[0]

set_location_assignment PIN_A12 -to b[0]   ;# SW[0]
set_location_assignment PIN_B12 -to b[1]  ;# SW[0]
set_location_assignment PIN_A13 -to b[2]   ;# SW[0]
set_location_assignment PIN_A14 -to b[3]  ;# SW[0]


set_location_assignment PIN_C14  -to seg1[0]  ;# LED[0]
set_location_assignment PIN_E15  -to seg1[1]  ;# LED[0]
set_location_assignment PIN_C15  -to seg1[2]  ;# LED[0]
set_location_assignment PIN_C16  -to seg1[3]  ;# LED[0]
set_location_assignment PIN_E16  -to seg1[4]  ;# LED[0]
set_location_assignment PIN_D17  -to seg1[5] ;# LED[0]
set_location_assignment PIN_C17  -to seg1[6]  ;# LED[0]

set_location_assignment PIN_C18  -to seg2[0]  ;# LED[0]
set_location_assignment PIN_D18  -to seg2[1]  ;# LED[0]
set_location_assignment PIN_E18  -to seg2[2]  ;# LED[0]
set_location_assignment PIN_B16  -to seg2[3]  ;# LED[0]
set_location_assignment PIN_A17  -to seg2[4]  ;# LED[0]
set_location_assignment PIN_A18  -to seg2[5] ;# LED[0]
set_location_assignment PIN_B17  -to seg2[6]  ;# LED[0]

load_package flow
execute_flow -compile

project_close
