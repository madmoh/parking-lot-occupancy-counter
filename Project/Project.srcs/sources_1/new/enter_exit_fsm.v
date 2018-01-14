module enter_exit_fsm
    (input a, input b, input clock,
    output reg enter, exit);
    reg [2:0]y, Y;
    parameter [2:0]A = 3'b000, B = 3'b001, C = 3'b011, D = 3'b010, E = 3'b101, F = 3'b111, G = 3'b110;
    always@(a, b, y) 
        case (y)
            A: if ({b,a} == 2'b00) begin
                Y = A;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b01) begin
                Y = E;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = A;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = D;
                {enter,exit} = 2'b00;
            end
            
            B: if ({b,a} == 2'b00) begin
                Y = A;
                {enter,exit} = 2'b01;
            end else if ({b,a} == 2'b01) begin
                Y = B;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = C;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = B;
                {enter,exit} = 2'b00;
            end
            
            C: if ({b,a} == 2'b00) begin
                Y = C;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b01) begin
                Y = B;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = C;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = D;
                {enter,exit} = 2'b00;
            end
            
            D: if ({b,a} == 2'b00) begin
                Y = A;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b01) begin
                Y = D;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = C;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = D;
                {enter,exit} = 2'b00;
            end
            
            E: if ({b,a} == 2'b00) begin
                Y = A;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b01) begin
                Y = E;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = F;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = E;
                {enter,exit} = 2'b00;
            end
            
            F: if ({b,a} == 2'b00) begin
                Y = F;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b01) begin
                Y = E;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = F;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = G;
                {enter,exit} = 2'b00;
            end
            
            G: if ({b,a} == 2'b00) begin
                Y = A;
                {enter,exit} = 2'b10;
            end else if ({b,a} == 2'b01) begin
                Y = G;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b11) begin
                Y = F;
                {enter,exit} = 2'b00;
            end else if ({b,a} == 2'b10) begin
                Y = G;
                {enter,exit} = 2'b00;
            end
        endcase
    
    always@(posedge clock)
        y <= Y;
        
endmodule
