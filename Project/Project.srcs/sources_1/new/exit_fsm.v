module exit_fsm
    (input a, input b, input clock,
    output reg exit);
    reg [1:0]y, Y;
    parameter [1:0]A = 2'b00, B = 2'b01, C = 2'b11, D = 2'b10;
    always@(a, b, y) case (y)
        A: if ({b,a} == A) begin
            Y = A;
            exit = 0;
        end else if ({b,a} == B) begin
            Y = A;
            exit = 0;
        end else if ({b,a} == C) begin
            Y = A;
            exit = 0;
        end else if ({b,a} == D) begin
            Y = D;
            exit = 0;
        end
        B: if ({b,a} == A) begin
            Y = A;
            exit = 1;
        end else if ({b,a} == B) begin
            Y = B;
            exit = 0;
        end else if ({b,a} == C) begin
            Y = C;
            exit = 0;
        end else if ({b,a} == D) begin
            Y = B;
            exit = 0;
        end
        C: if ({b,a} == A) begin
            Y = C;
            exit = 0;
        end else if ({b,a} == B) begin
            Y = B;
            exit = 0;
        end else if ({b,a} == C) begin
            Y = C;
            exit = 0;
        end else if ({b,a} == D) begin
            Y = D;
            exit = 0;
        end
        D: if ({b,a} == A) begin
            Y = A;
            exit = 0;
        end else if ({b,a} == B) begin
            Y = D;
            exit = 0;
        end else if ({b,a} == C) begin
            Y = C;
            exit = 0;
        end else if ({b,a} == D) begin
            Y = D;
            exit = 0;
        end
    endcase
    
    always@(posedge clock)
        y <= Y;
        
endmodule