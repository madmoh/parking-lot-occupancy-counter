module enter
    (input wire clk, input wire [1:0]sw,
    output wire [7:0]an, output wire [7:0]sseg);
    wire [15:0]count_out;
    wire new_clk, enter, exit;
    disp_hex_mux disp_unit
        (.clk(clk), .reset(sw[2]),
        .hex3(count_out[15:12]), .hex2(count_out[11:8]),
        .hex1(count_out[7:4]), .hex0(count_out[3:0]),
        .dp_in(4'b1011), .an(an), .sseg(sseg));
    counter cntr_unit
        (.clock(clk), .new_clock(new_clk));
//    enter_fsm enr_fsm
//            (sw[0], sw[1], new_clk, enter);
//    exit_fsm ext_fsm
//        (sw[0], sw[1], new_clk, exit);
    enter_exit_fsm enr_ext_fsm
        (sw[0], sw[1], new_clk, enter, exit);
    bcd_counter bcd_cntr_unit
        (.clock(new_clk), .en(enter), .ex(exit),
        .BCD1(count_out[7:4]), .BCD0(count_out[3:0]),
        .BCD3(count_out[15:12]), .BCD2(count_out[11:8]));
endmodule