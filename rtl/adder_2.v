module adder_2 #(parameter DSIZE = 64)
            (
                in_a,
                in_b,
                in_c,
                in_d,
                clk, 
                rst_n
            );
input   [DSIZE-1:0]     in_a;
input   [DSIZE-1:0]     in_b;
input   [DSIZE-1:0]     in_c;
input   [DSIZE-1:0]     in_d;
output  [DSIZE-1:0]     sum ;

input                   clk;
input                   rst_n;

wire   [DSIZE-1:0]      sum_ab;
wire   [DSIZE-1:0]      sum_cd;
reg    [DSIZE-1:0]      sum_abcd_l;
reg    [DSIZE-1:0]      sum_abcd_l2;

assign sum_ab[DSIZE-1:0]    = in_a + in_b;
assign sum_cd[DSIZE-1:0]    = in_c + in_d;
assign sum_abcd[DSIZE-1:0]  = sum_ab + sum_cd;

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sum_abcd_l  <= 0;
        sum_abcd_l2 <= 0;
    end
    else
    begin
        sum_abcd_l  <= sum_abcd;
        sum_abcd_l2 <= sum_abcd_l;
    end
end

assign sum = sum_abcd_l2;

endmodule
