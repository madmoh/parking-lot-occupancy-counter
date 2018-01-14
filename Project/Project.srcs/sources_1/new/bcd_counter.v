module bcd_counter (clock, en, ex, BCD1, BCD0, BCD3, BCD2);
input clock, en, ex;
output reg [3:0] BCD1, BCD0, BCD3, BCD2;
    always @(posedge clock) begin
        if (en) begin
            if (BCD0 == 4'b1001) begin
                BCD0 <= 0;
                if (BCD1 == 4'b1001) BCD1 <= 0;
                else BCD1 <= BCD1 + en;
            end else BCD0 <= BCD0 + en;
        end
        if (ex) begin
            if (BCD0 == 0) begin
                BCD0 <= 4'b1001;
                if (BCD1 == 0) BCD1 <= 4'b1001;
                else BCD1 <= BCD1 - 1;
            end else BCD0 <= BCD0 - 1;
        end
    end
    
    always@(BCD0, BCD1) begin
        BCD2 = 4'b1001 - BCD0;
        BCD3 = 4'b1001 - BCD1;
    end
endmodule

