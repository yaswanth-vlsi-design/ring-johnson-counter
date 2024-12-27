module jr_counter #(parameter WIDTH = 4) (
    input clk,                 
    input rstn,                
    input j_r,                 
    output reg [WIDTH-1:0] out 
);

    integer i; 

    always @(posedge clk or posedge rstn) begin
        if (rstn==1) begin
            out <= 1; 
        end else begin
            if (j_r == 1) begin
                
                out[WIDTH-1] <= ~out[0]; 
                for (i = 0; i < WIDTH-1; i = i + 1) begin
                    out[i] <= out[i+1];
                end
            end else begin
                
                out[WIDTH-1] <= out[0]; 
                for (i = 0; i < WIDTH-1; i = i + 1) begin
                    out[i] <= out[i+1];
                end
            end
        end
    end

endmodule
