local nord_colors = require 'utils.palette'

require('indent_guides').setup({
    even_colors = {fg = nord_colors.nord1_gui, bg = nord_colors.nord2_gui},
    odd_colors = {fg = nord_colors.nord2_gui, bg = nord_colors.nord1_gui}
})
