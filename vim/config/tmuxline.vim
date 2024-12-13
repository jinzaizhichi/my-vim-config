let g:tmuxline_theme = {
            \   'a'    : [ 8, 5 ],
            \   'b'    : [ 5, 0 ],
            \   'c'    : [ 5, 8 ],
            \   'x'    : [ 5, 8 ],
            \   'y'    : [ 5, 0 ],
            \   'z'    : [ 8, 5 ],
            \   'win'  : [ 5, 0 ],
            \   'cwin' : [ 0, 5 ],
            \   'bg'   : [ 8, 8 ],
            \ }

let g:tmuxline_preset = {
            \'a'       : '  #S',
            \'b'       : ': #(top -l 1 | grep -E "^CPU" | awk ''{print 100-$7"%%"}'')    #(memory_pressure | grep "System-wide memory free percentage" | awk ''{print 100-$5"%%"}'')',
            \'c'       : '',
            \'win'     : '#I #W',
            \'cwin'    : '󰈸 #W',
            \'x'       : '' ,
            \'y'       : '%R',
            \'z'       : '#h ',
            \'options' : {
            \'status-justify' : 'left',
            \}}
