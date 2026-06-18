`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026
// Design Name: 
// Module Name: tb_elevator_controller
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_elevator_controller(

    );
    reg clk,reset,up,down,open,close;
    wire FIRST_FLOOR,SECOND_FLOOR,THIRD_FLOOR,door_open;
    wire [1:0] state_out;
    
    elevator_controller dut(clk,reset,up,down,open,close,
                            FIRST_FLOOR,SECOND_FLOOR,THIRD_FLOOR,
                            door_open,state_out);
    
    initial begin
        clk=0;
        reset=1;
        up=0;
        down=0;
        open=0;
        close=0;
        end
        
        always #10 clk=~clk;
        
    initial begin
        #15 reset=0;
        
        #20 up=1;
        #20 up=0;
        
        #20 open=1;
        #20 open=0;
        
        #20 up=1;
        #20 up=0;
        
        #20 close=1;
        #20 close=0;
        
        #20 up=1;
        #20 up=0;
        
        #20 down=1;
        #20 down=0;
        
        #100;
        $finish;
        end
        
        initial $monitor("t=%0t clk=%b reset=%b up=%b down=%b open=%b close=%b door_open=%b FIRST_FLOOR=%b SECOND_FLOOR=%b THIRD_FLOOR=%b state_out=%b",
        $time,clk,reset,up,down,open,close,door_open,FIRST_FLOOR,SECOND_FLOOR,THIRD_FLOOR,state_out);
endmodule
