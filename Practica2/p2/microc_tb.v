`timescale 1 ns / 10 ps

module microc_tb;

reg clk, reset;


// generación de reloj clk
always //siempre activo, no hay condición de activación
begin
  clk = 1'b0;  //clico de 40 nanosegundos, equivalente a 25 megahercios
  #20;
  clk = 1'b1;
  #20;
end

// instanciación del procesador
cpu micpu(clk, reset);

initial
begin
  $dumpfile("microc_tb.vcd");
  $dumpvars;
  reset=0;
  #1
  reset = 1;  //a partir del flanco de subida del reset empieza el funcionamiento normal
  #10;
  reset = 0;  //bajamos el reset 
end

initial
begin
  
  #(20*40); //tiempo para diez instruciones, realmente son once, pero es un margen


  $finish;
end

endmodule

