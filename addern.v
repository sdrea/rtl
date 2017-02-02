// [1] Stephen Brown, Zvonko Vranesic, Fundamentals of Digital Logic, McGraw-Hill, New York, 2nd edition, 2008.

module addern(carryin, X, Y, S, carryout);

  parameter n = 64;
  input carryin;
  input [n-1:0] X, Y;
  output reg [n-1:0] S;
  output reg carryout;
  
  reg [n:0] C;
  integer k;
  
  always @(X, Y, carryin) begin
    C[0] = carryin;
    for (k=0;k<n;k=k+1) begin
      S[k] = X[k] ^ Y[k] ^ C[k];
      C[k+1] = (X[k] & Y[k]) | (X[k] & C[k]) | (Y[k] & C[k]);
    end
    carryout = C[n];
  end
  
endmodule
