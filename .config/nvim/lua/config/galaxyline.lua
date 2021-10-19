-- config for galaxyline
local gl = require('galaxyline')
-- local hl = require('highlite')
local section = gl.section
local extension = require('galaxyline.provider_extensions')
local condition = require('galaxyline.condition')

gl.short_line_list = {
    'defx',
    'packager',
    'NvimTree',
    'Floaterm'
}

-- from gruvbox.nvim; TODO: figure out how to just reference colors
local colors = {
    dark0_hard = "#1d2021",
    dark0 = "#282828",
    dark0_soft = "#32302f",
    dark1 = "#3c3836",
    dark2 = "#504945",
    dark3 = "#665c54",
    dark4 = "#7c6f64",
    light0_hard = "#f9f5d7",
    light0 = "#fbf1c7",
    light0_soft = "#f2e5bc",
    light1 = "#ebdbb2",
    light2 = "#d5c4a1",
    light3 = "#bdae93",
    light4 = "#a89984",
    bright_red = "#fb4934",
    bright_green = "#b8bb26",
    bright_yellow = "#fabd2f",
    bright_blue = "#83a598",
    bright_purple = "#d3869b",
    bright_aqua = "#8ec07c",
    bright_orange = "#fe8019",
    neutral_red = "#cc241d",
    neutral_green = "#98971a",
    neutral_yellow = "#d79921",
    neutral_blue = "#458588",
    neutral_purple = "#b16286",
    neutral_aqua = "#689d6a",
    neutral_orange = "#d65d0e",
    faded_red = "#9d0006",
    faded_green = "#79740e",
    faded_yellow = "#b57614",
    faded_blue = "#076678",
    faded_purple = "#8f3f71",
    faded_aqua = "#427b58",
    faded_orange = "#af3a03",
    gray = "#928374",
}


local modes = {
    [110] = {
	color = colors.faded_green,
	name = "NORMAL"
    },
    [105] = {
	color = colors.faded_blue,
	name = "INSERT"
    },
    [99] = {
	color = colors.neutral_green,
	name = "COMMAND"
    },
    [116] = {
	color = colors.neutral_blue,
	name = "TERMINAL"
    },
    [118] = {
	color = colors.faded_purple,
	name = "VISUAL"
    },
    [22] = {
	color = colors.faded_purple,
	name = "V-BLOCK"
    },
    [86] = {
	color = colors.faded_purple,
	name = "V-LINE"
    },
    [82] = {
	color = colors.faded_red,
	name = "REPLACE"
    },
    [115] = {
	color = colors.faded_yellow,
	name = "SELECT"
    },
    [83] = {
	color = colors.faded_yellow,
	name = "S-LINE"
    }
}

local function current_mode()
    mode_color = modes[vim.fn.mode():byte()]
    if mode_color ~= nill then return mode_color end
    return {
	color = color.faded_orange,
	name = "Unknown :" .. vim.fn.mode():byte()
    }
end

local function file_readonly()
    if vim.bo.filetype == 'help' then return '' end
    if vim.bo.readonly == true then return ' ⨂ ' end
    return ''
end

vim.o.showmode = false
section.left[1] = {
    ViMode = {
	provider = function()
	    c = current_mode()
	    -- hl.highlight('GalaxyViMode', {fg=c.color, style='bold'})
	    return '▊ '..c.name..' '
	end,
	-- highlight = {colors.dark0, colors.dark0}
    }
}

section.left[2] = {
    FileReadOnly = {
	provider = file_readonly,
	highlight = {
	    colors.neutral_red,
	    colors.dark0
	}
    }
}

section.left[4] = {
    FileName = {
	provider = function() return vim.fn.expand("%:F") end,
	condition = condition.buffer_not_empty,
	separator = " ",
	highlight = {
	    colors.faded_yellow,
	    colors.dark0
	}
    }
}

section.left[5] = {
    DiagnosticError = {
	provider = 'DiagnosticError',
	icon = ' ',
	highlight = {
	    colors.faded_red,
	    colors.dark0
	}
    }
}

section.left[6] = {
    DiagnosticWarn = {
	provider = 'DiagnosticWarn',
	icon = ' ',
	highlight = {
	    colors.faded_yellow,
	    colors.dark0
	}
    }
}

section.left[7] = {
    DiagnosticHint = {
	provider = 'DiagnosticHint',
	icon = ' ',
	highlight = {
	    colors.faded_blue,
	    colors.dark0
	}
    }
}

section.left[8] = {
    DiagnosticInfo = {
	provider = 'DiagnosticInfo',
	icon = ' ',
	highlight = {
	    colors.faded_blue,
	    colors.dark0
	}
    }
}

section.right[1] = {
    FileEncode = {
	provider = 'FileEncode',
	condition = condition.hide_in_width,
	separator = ' ',
	highlight = {colors.green,colors.bg,'bold'}
    }
}

section.right[2] = {
    FileIcon = {
	provider = 'FileIcon',
	condition = condition.buffer_not_empty,
	separator = ' ',
	highlight = {
	    require('galaxyline.provider_fileinfo').get_file_icon_color,
	    colors.dark0
	}
    }
}

section.right[3] = {
    FileTypeName = {
	provider = 'FileTypeName',
	condition = condition.buffer_not_empty,
	highlight = {
	    require('galaxyline.provider_fileinfo').get_file_icon_color,
	    colors.dark0
	}
    }
}

section.right[4] = {
    GitBranch = {
	provider = "GitBranch",
	icon = ' ',
	condition = require("galaxyline.provider_vcs").check_git_workspace,
	separator = " ",
	highlight = {colors.neutral_purple, colors.dark0}
    }
}

section.right[5] = {
    DiffAdd = {
	provider = 'DiffAdd',
	icon = ' ',
	separator = " ",
	condition = condition.hide_in_width,
	highlight = {colors.faded_green, colors.dark0}
    }
}

section.right[6] = {
    DiffModified = {
	provider = 'DiffModified',
	icon = ' ',
	separator = " ",
	condition = condition.hide_in_width,
	highlight = {colors.faded_orange, colors.dark0}
    }
}

section.right[7] = {
    DiffRemove = {
	provider = 'DiffRemove',
	icon = ' ',
	separator = " ",
	condition = condition.hide_in_width,
	highlight = {colors.faded_red, colors.dark0}
    }
}

section.right[8] = {
    LineInfo = {
	provider = 'LineColumn',
	highlight = {colors.light0, colors.dark0},
    },
}

section.short_line_left[1] = {
    SFileTypeName = {
	provider = 'FileTypeName',
	separator = ' ',
	highlight = {colors.dark3, colors.dark0}
    }
}

section.short_line_left[2] = {
    SFileName = {
	provider = 'SFileName',
	condition = condition.buffer_not_empty,
	highlight = {colors.dark3, colors.dark0}
    }
}

section.short_line_right[1] = {
    SBufferIcon = {
	provider= 'BufferIcon',
	highlight = {colors.dark3, colors.dark0}
    }
}
