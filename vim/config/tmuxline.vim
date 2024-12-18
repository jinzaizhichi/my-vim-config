let g:tmuxline_theme = {
            \   'a'    : [ 0, 5 ],
            \   'b'    : [ 5, 8 ],
            \   'c'    : [ 5, 0 ],
            \   'x'    : [ 5, 0 ],
            \   'y'    : [ 5, 8 ],
            \   'z'    : [ 8, 5 ],
            \   'win'  : [ 5, 0 ],
            \   'cwin' : [ 0, 5 ],
            \   'bg'   : [ 0, 0 ],
            \ }

let g:tmuxline_preset = {
            \'a'       : '  #S',
            \'b'       : ': #(top -l 1 | grep -E "^CPU" | awk ''{print 100-$7"%%"}'')    #(memory_pressure | grep "System-wide memory free percentage" | awk ''{print 100-$5"%%"}'')',
            \'c'       : '',
            \'win'     : '#I #W',
            \'cwin'    : '󰈸 #W',
            \'x'       : 'Missing ' ,
            \'y'       : '%R',
            \'z'       : '#h ',
            \'options' : {
            \'status-justify' : 'left',
            \}}
