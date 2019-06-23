module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [2:0]con1;
    
    //in BCD addition, if sum of digit BCD numbers is greater than 9 then we should further add 6 to the result to obtain the correct solution
    //ex : 5+3 = 8  = 0000 1000 obtained by 0101+0011      
    //     8+9 = 17 = 0001 0111 obtained by 1000+1001+0110
 
    bcd_fadd B_add1(a[3:0],b[3:0],cin,con1[0],sum[3:0]);
    bcd_fadd B_add2(a[7:4],b[7:4],con1[0],con1[1],sum[7:4]);
    bcd_fadd B_add3(a[11:8],b[11:8],con1[1],con1[2],sum[11:8]);
    bcd_fadd B_add4(a[15:12],b[15:12],con1[2],cout,sum[15:12]);

endmodule
