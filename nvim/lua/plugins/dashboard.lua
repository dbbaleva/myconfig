-- start screen
local horns = [[
          .                                                      .           
        .n                   .                 .                  n.         
  .   .dP                  dP                   9b                 9b.    .  
 4    qXb         .       dX                     Xb       .        dXp     t 
dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb
9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP
 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP 
  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'  
    `9XXXXXXXXXXXP' `9XX'   DIE    `98v8P'  HUMAN   `XXP' `9XXXXXXXXXXXP'    
        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~        
                        )b.  .dbo.dP'`v'`9b.odb.  .dX(                       
                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                      
                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb                     
                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                    
                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP                    
                     `'      9XXXXXX(   )XXXXXXP      `'                     
                              XXXX X.`v'.X XXXX                              
                              XP^X'`b   d'`X^XX                              
                              X. 9  `   '  P )X                              
                              `b  `       '  d'                              
                               `             '                               
]]
local stormtrooper = [[
                                                      
                .oooooooooooo                         
            oo08888888888888888oo                     
         ,o8888888888888888888888888o                 
       .|888888888888888888888888888888o              
      .|88888888888888888888888888888888º             
     .||88888888888888888888P˚   ˚888888,             
     :||88888888888888888888        88888d            
    ::||8888888P˚˚˚˚˚˚˚˚˚˚˚˚   .o,d:˚8888P:           
    ''                                ˚88|:           
     ..,,o˚PPP˚˚˚˚˚˚˚˚˚˚˚˚˚P8888888888888d0           
        ;d888o            :8888888888888888o          
       .|888888oo         8888888888888˚˚˚˚˚.         
      ,:8888888888oo   .o8888˚888888888     P         
       ;8888888888888888888˚   8888||d88oo,,          
       |88888888888888˚˚P˚'     8888''o˚8d|"          
      :"˚88888888888888888o    o88888d.,P88::         
          :  ˚˚888888888888o od888PP|P|"|||Poo        
      ,ooo:    ˚˚8888888888888PP88d888888ddd888o      
     :|88888ooo   ˚˚88888888P|"d888888888888888888    
     :d88888888888ooo:˚˚888Pd8888888888888888888888;  
     |8888888888888888888odd88888888888888888PPPd88": 
       '˚P88888888888888888888888888888888PP""do8˚''  
  .:     '˚888888888888888888888888888PPP|"'  "˚˚     
 :::       "P888888888888888888888888d|""'            
 ::..        '"˚˚˚˚˚˚88888888888888P˚"                
  ::          :::     ˚888888PPP""'                   
   ':...      '::    .."|""""::''                     
     '''        ':,,,::::''''                         
                   ''''                               
                                                      
]]
return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = stormtrooper,
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
