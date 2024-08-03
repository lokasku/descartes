type charset = {
  hbar : string;
  vbar : string;
  blangle : string; (* Bottom left angle *)
  tlangle : string; (* Top left angle *)
  uarrow : string;
  darrow : string;
}

let ascii : charset =
  {
    hbar = "-";
    vbar = "|";
    blangle = "+";
    tlangle = "+";
    uarrow = "^";
    darrow = "v";
  }

let unicode : charset =
  {
    hbar = "─";
    vbar = "│";
    blangle = "╰";
    tlangle = "╭";
    uarrow = "▲";
    darrow = "▼";
  }
