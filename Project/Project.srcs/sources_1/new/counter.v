module counter (input wire clock, output wire new_clock);
    reg [31:0] r_reg;
    wire [31:0] r_next;
    always @ (posedge clock)
        r_reg <= r_next;
    assign r_next = (r_reg == 50000000) ? 0 : r_reg + 1;
    assign new_clock = (r_reg == 50000000) ? 1'b1 : 1'b0;
endmodule