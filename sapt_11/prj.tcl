project_new example1 -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE example1.bdf
set_global_assignment -name VERILOG_FILE seven_seg_decoder.v
set_global_assignment -name SDC_FILE example1.sdc

set_global_assignment -name TOP_LEVEL_ENTITY seven_seg_decoder
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_F15 -to sw_in[3];
set_location_assignment PIN_B14 -to sw_in[2];
set_location_assignment PIN_A14 -to sw_in[1];
set_location_assignment PIN_A13 -to sw_in[0];
set_location_assignment PIN_C12 -to sw_in[7];
set_location_assignment PIN_D12 -to sw_in[6];
set_location_assignment PIN_C11 -to sw_in[5];
set_location_assignment PIN_C10 -to sw_in[4];

set_location_assignment PIN_C14 -to led_out[0];
set_location_assignment PIN_E15 -to led_out[1];
set_location_assignment PIN_C15 -to led_out[2];
set_location_assignment PIN_C16 -to led_out[3];
set_location_assignment PIN_E16 -to led_out[4];
set_location_assignment PIN_D17 -to led_out[5];
set_location_assignment PIN_C17 -to led_out[6];

load_package flow
execute_flow -compile

project_close
