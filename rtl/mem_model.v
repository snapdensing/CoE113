`timescale 1ns / 1ps

module mem_model
    #(  parameter DATA_DEP = 512,
        parameter ADDR_WID = 9
    ) 
    (   input   clk,
        input   [ADDR_WID-1:0]  addr,
        output  [63:0]          rdata,
        input   wr_en,
        input   [63:0]          wdata,
        input   [7:0]           wmask
    );
    
    reg [63:0] memdata [0:DATA_DEP-1];
    
    assign rdata = memdata[addr];
        
    always@(posedge clk) begin
        if (wr_en) begin
            if (wmask[7])
                memdata[addr][63:56] <= wdata[63:56];
            if (wmask[6])
                memdata[addr][55:48] <= wdata[55:48];
            if (wmask[5])
                memdata[addr][47:40] <= wdata[47:40];
            if (wmask[4])
                memdata[addr][39:32] <= wdata[39:32];
            if (wmask[3])
                memdata[addr][31:24] <= wdata[31:24];
            if (wmask[2])
                memdata[addr][23:16] <= wdata[23:16];
            if (wmask[1])
                memdata[addr][15:8]  <= wdata[15:8];
            if (wmask[0])
                memdata[addr][7:0]   <= wdata[7:0];
        end
    end
        
endmodule
