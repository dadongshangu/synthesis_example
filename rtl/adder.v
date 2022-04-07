
//Retime by hand. 2021-11-24 15:14:12 
module adder #(parameter DSIZE = 64)
            (
                in_a,
                in_b,
                in_c,
                in_d,
                sum,
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
wire   [DSIZE-1:0]      sum_abcd;
reg    [DSIZE-1:0]      sum_ab_l;
reg    [DSIZE-1:0]      sum_cd_l;
reg    [DSIZE-1:0]      sum_abcd_l;

assign sum_ab[DSIZE-1:0]    = in_a + in_b;
assign sum_cd[DSIZE-1:0]    = in_c + in_d;
assign sum_abcd[DSIZE-1:0]  = sum_ab_l + sum_cd_l;

always @(posedge clk or negedge rst_n)
begin
    if(~rst_n)
    begin
        sum_ab_l    <= 0;
        sum_cd_l    <= 0;
        sum_abcd_l  <= 0;
    end
    else
    begin
        sum_ab_l    <= sum_ab;
        sum_cd_l    <= sum_cd;
        sum_abcd_l  <= sum_abcd;
    end
end

assign sum = sum_abcd_l;

endmodule
