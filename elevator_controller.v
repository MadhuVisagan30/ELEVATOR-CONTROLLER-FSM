`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.06.2026 20:02:53
// Design Name: 
// Module Name: elevator_controller
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


module elevator_controller(input clk,reset,up,down,open,close,
                            output reg FIRST_FLOOR,SECOND_FLOOR,THIRD_FLOOR,door_open,output [1:0] state_out );
                          
     parameter first_floor=2'b00,second_floor=2'b01,third_floor=2'b10;
                           
     reg [1:0] state,next_state;
     
     always  @(posedge clk or posedge reset)begin
            if(reset) begin state<=first_floor; door_open<=0; end
            else begin state<=next_state;
            
            if(open) door_open<=1;
            else if (close) door_open<=0; 
            end
            end
            
     always @(*)begin
            
            if (!door_open)begin
            
                case(state)
                    first_floor:begin
                        if((up&~down)||(up&down)) next_state=second_floor;
                        else next_state=first_floor; end
                    second_floor:begin
                        if(up) next_state=third_floor;
                        else if (~up&down) next_state=first_floor;
                        else next_state=second_floor; end
                    third_floor:begin
                         if(~up&down) next_state=second_floor;
                         else next_state=third_floor; end 
                    default:next_state=first_floor;
                         endcase
                         end
              
              else next_state=state; end
       
       always @(*)begin
            FIRST_FLOOR=0;
            SECOND_FLOOR=0;
            THIRD_FLOOR=0;
       case(state)
            first_floor:FIRST_FLOOR=1;
            second_floor:SECOND_FLOOR=1;
            third_floor:THIRD_FLOOR=1;
            default:FIRST_FLOOR=1;endcase
            end
 
assign state_out = state;
            
       
                
endmodule


