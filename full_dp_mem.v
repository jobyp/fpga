module full_dp_mem ( reset,
		     // port a
		     clk_a,
		     dat_in_a,
		     address_a,
		     dat_out_a,
		     wr_a,
		     // port b
		     clk_b,
		     dat_in_b,
		     address_a,
		     dat_out_a,
		     wr_b
		     );

   input             reset;
   input 	     clk_a;
   input [15:0]      dat_in_a;
   input [9:0] 	     address_a;
   input [15:0]      dat_out_a;
   input 	     wr_a;
   input 	     clk_b;
   input [15:0]      dat_in_b;
   input [9:0] 	     address_b;
   input [15:0]      dat_out_b;
   input 	     wr_b;
   
   
   reg [15:0] 	     memory[0:1023];
   reg [15:0] 	     dat_out_a;
   reg [15:0] 	     dat_out_b;


   // Port a
   always @ ( posedge clk_a )
     begin

	if ( wr_a )
	  memory[address_a] <= dat_in_a;

	dat_out_a <= memory[address_a];
     end


   // Port b
   always @ ( posedge clk_b )
     begin

	if ( wr_b )
	  memory[address_b] <= dat_in_b;

	dat_out_b <= memory[address_b];
     end
   
endmodule
		     

// Local Variables:
// mode: verilog
// End:
