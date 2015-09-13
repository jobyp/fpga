module modular_2 ( clk,
		   reset,
		   go_1, kill_1,
		   go_2, kill_2,
		   go_3, kill_3,
		   kill_clr,
		   kill_ltchd,
		   done_out
		   );

   input           clk;
   input 	   reset;
   input 	   go_1;
   input 	   kill_1;
   input 	   go_2;
   input 	   kill_2;
   input 	   go_3;
   input 	   kill_3;
   input 	   kill_clr;
   
   output 	   kill_ltchd;
   output 	   done_out;

   wire 	   done_1;
   wire 	   done_2;


   fsm_1           go_delay_1
     (
      .clk         ( clk ),
      .reset       ( reset ),
      .go          ( go_1 ),
      .kill        ( kill_1 ),
      .done        ( done_1 )
      );


   fsm_1           go_delay_2
     (
      .clk         ( clk ),
      .reset       ( reset ),
      .go          ( done_1
		     | go_2
		     ),
      .kill        ( kill_2 ),
      .done        ( done_2 )
      );

   fsm_1           go_delay_3
     (
      .clk         ( clk ),
      .reset       ( reset ),
      .go          ( done_1
		     | done_2
		     | go_3 
		     ),
      .kill        ( kill_2 ),
      .done        ( done_out )
      );


   always @ ( posedge clk or posedge reset )
     begin

	if ( reset )
	  kill_ltchd <= 1'b0;
	else if ( kill_1
		  || kill_2
		  || kill_3 )
	  kill_ltchd <= 1'b1;
	else if ( kill_clr )
	  kill_ltchd <= 1'b0;

     end


endmodule

// Local Variables:
// mode: verilog
// End:
