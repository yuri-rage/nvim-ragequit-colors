local vim = vim

local M = {}

M.colors = {
    name = 'ragequit',
    base0 = '#0a0e16', -- darkest bg
    base1 = '#141820', -- slightly lighter bg
    base2 = '#0a0e16', -- normal bg
    base3 = '#272932', -- selection bg
    base4 = '#525053', -- darker grey
    base5 = '#69676c', -- grey
    base6 = '#c8c4ce', -- light grey/white
    base7 = '#c8c4ce', -- white
    base8 = '#c8c4ce', -- brightest white
    border = '#69676c',
    brown = '#525053',
    white = '#c8c4ce',
    grey = '#69676c',
    black = '#0a0e16',
    pink = '#fc618d',
    green = '#5dba71',
    aqua = '#46b6d2',
    yellow = '#c8b252',
    orange = '#fd9353',
    purple = '#948ae3',
    magenta = '#da70d6',
    red = '#fc618d',
    diff_add = '#3d5213',
    diff_remove = '#4a0f23',
    diff_change = '#27406b',
    diff_text = '#23324d',
}

local function remove_italics(config, colors)
    if not config.italics and colors.style == 'italic' then
        colors.style = nil
    end
    return colors
end

local function highlighter(config)
    return function(group, color)
        color = remove_italics(config, color)
        local style = color.style and 'gui=' .. color.style or 'gui=NONE'
        local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
        local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
        local sp = color.sp and 'guisp=' .. color.sp or ''
        vim.cmd('highlight ' .. group .. ' ' .. style .. ' ' .. fg .. ' ' .. bg .. ' ' .. sp)
    end
end

M.load_syntax = function(palette)
    return {
        Normal = {
            fg = palette.white,
            bg = palette.base2,
        },
        NormalFloat = {
            bg = palette.base1,
        },
        Pmenu = {
            fg = palette.white,
            bg = palette.base3,
        },
        PmenuSel = {
            fg = palette.base4,
            bg = palette.orange,
        },
        PmenuSelBold = {
            fg = palette.base4,
            bg = palette.orange,
        },
        PmenuThumb = {
            fg = palette.purple,
            bg = palette.green,
        },
        PmenuSbar = {
            bg = palette.base3,
        },
        Cursor = {
            style = 'reverse',
        },
        ColorColumn = {
            bg = palette.base3,
        },
        CursorLine = {
            bg = palette.base1,
        },
        NonText = {
            fg = palette.base5,
        },
        Visual = {
            bg = palette.base3,
        },
        VisualNOS = {
            bg = palette.base3,
        },
        Search = {
            fg = palette.base2,
            bg = palette.yellow,
        },
        IncSearch = {
            fg = palette.base2,
            bg = palette.orange,
        },
        CursorLineNr = {
            fg = palette.white,
            bg = palette.base1,
        },
        MatchParen = {
            style = 'reverse',
        },
        Question = {
            fg = palette.yellow,
        },
        ModeMsg = {
            fg = palette.white,
            style = 'bold',
        },
        MoreMsg = {
            fg = palette.white,
            style = 'bold',
        },
        ErrorMsg = {
            fg = palette.red,
            style = 'bold',
        },
        WarningMsg = {
            fg = palette.yellow,
            style = 'bold',
        },
        VertSplit = {
            fg = palette.brown,
        },
        LineNr = {
            fg = palette.base5,
            bg = palette.base2,
        },
        SignColumn = {
            fg = palette.white,
            bg = palette.base2,
        },
        StatusLine = {
            fg = palette.base7,
            bg = palette.base3,
        },
        StatusLineNC = {
            fg = palette.grey,
            bg = palette.base3,
        },
        Tabline = {
            fg = palette.white,
            bg = palette.base3,
        },
        TabLineSel = {
            fg = palette.yellow,
            bg = palette.base1,
            style = 'underline',
        },
        SpellBad = {
            fg = palette.red,
            style = 'undercurl',
        },
        SpellCap = {
            fg = palette.purple,
            style = 'undercurl',
        },
        SpellRare = {
            fg = palette.aqua,
            style = 'undercurl',
        },
        SpellLocal = {
            fg = palette.pink,
            style = 'undercurl',
        },
        SpecialKey = {
            fg = palette.pink,
        },
        Title = {
            fg = palette.yellow,
            style = 'bold',
        },
        Directory = {
            fg = palette.aqua,
        },
        DiffAdd = {
            bg = palette.diff_add,
        },
        DiffDelete = {
            bg = palette.diff_remove,
        },
        DiffChange = {
            bg = palette.diff_change,
        },
        DiffText = {
            bg = palette.diff_text,
        },
        diffAdded = {
            fg = palette.green,
        },
        diffRemoved = {
            fg = palette.pink,
        },
        Folded = {
            fg = palette.grey,
            bg = palette.base3,
        },
        FoldColumn = {
            fg = palette.white,
            bg = palette.black,
        },
        Constant = {
            fg = palette.purple,
        },
        Number = {
            fg = palette.purple,
        },
        Float = {
            fg = palette.purple,
        },
        Boolean = {
            fg = palette.purple,
        },
        Character = {
            fg = palette.yellow,
        },
        String = {
            fg = palette.yellow,
        },
        Type = {
            fg = palette.aqua,
            style = 'italic',
        },
        Structure = {
            fg = palette.aqua,
            style = 'italic',
        },
        StorageClass = {
            fg = palette.aqua,
            style = 'italic',
        },
        Typedef = {
            fg = palette.aqua,
            style = 'italic',
        },
        Identifier = {
            fg = palette.white,
        },
        Function = {
            fg = palette.green,
        },
        Statement = {
            fg = palette.aqua,
        },
        Operator = {
            fg = palette.aqua,
        },
        Label = {
            fg = palette.aqua,
        },
        Keyword = {
            fg = palette.aqua,
            style = 'italic',
        },
        PreProc = {
            fg = palette.aqua,
        },
        Include = {
            fg = palette.aqua,
            style = 'italic',
        },
        Define = {
            fg = palette.aqua,
        },
        Macro = {
            fg = palette.aqua,
        },
        PreCondit = {
            fg = palette.aqua,
        },
        Special = {
            fg = palette.white,
        },
        SpecialChar = {
            fg = palette.aqua,
        },
        Delimiter = {
            fg = palette.yellow,
        },
        SpecialComment = {
            fg = palette.grey,
            style = 'italic',
        },
        Tag = {
            fg = palette.aqua,
        },
        Todo = {
            fg = palette.orange,
        },
        Comment = {
            fg = palette.base5,
            style = 'italic',
        },
        Underlined = {
            style = 'underline',
        },
        Ignore = {},
        Error = {
            fg = palette.red,
        },
        Terminal = {
            fg = palette.white,
            bg = palette.base2,
        },
        EndOfBuffer = {
            fg = palette.base2,
        },
        Conceal = {
            fg = palette.grey,
        },
        vCursor = {
            style = 'reverse',
        },
        iCursor = {
            style = 'reverse',
        },
        lCursor = {
            style = 'reverse',
        },
        CursorIM = {
            style = 'reverse',
        },
        CursorColumn = {
            bg = palette.base3,
        },
        Whitespace = {
            fg = palette.base5,
        },
        WildMenu = {
            fg = palette.white,
            bg = palette.orange,
        },
        QuickFixLine = {
            fg = palette.purple,
            style = 'bold',
        },
        Debug = {
            fg = palette.orange,
        },
        debugBreakpoint = {
            fg = palette.base2,
            bg = palette.red,
        },
        Conditional = {
            fg = palette.pink,
        },
        Repeat = {
            fg = palette.pink,
        },
        Exception = {
            fg = palette.pink,
        },
    }
end

M.load_plugin_syntax = function(palette)
    return {
        ["@annotation"] = {
            fg = palette.green,
        },
        ["@attribute"] = {
            fg = palette.green,
        },
        ["@boolean"] = {
            fg = palette.purple,
        },
        ["@character"] = {
            fg = palette.yellow,
        },
        ["@comment"] = {
            fg = palette.base5,
            style = 'italic',
        },
        ["@conditional"] = {
            fg = palette.pink,
        },
        ["@constant"] = {
            fg = palette.purple,
        },
        ["@constant.builtin"] = {
            fg = palette.purple,
        },
        ["@constant.macro"] = {
            fg = palette.aqua,
        },
        ["@constructor"] = {
            fg = palette.magenta,
        },
        ["@field"] = {
            fg = palette.white,
        },
        ["@function"] = {
            fg = palette.green,
        },
        ["@keyword"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@keyword.control"] = {
            fg = palette.aqua,
        },
        ["@keyword.operator"] = {
            fg = palette.aqua,
        },
        ["@keyword.function"] = {
            fg = palette.aqua,
        },
        ["@keyword.return"] = {
            fg = palette.aqua,
        },
        ["@keyword.import"] = {
            fg = palette.aqua,
        },
        ["@keyword.export"] = {
            fg = palette.aqua,
        },
        ["@keyword.storage"] = {
            fg = palette.aqua,
        },
        ["@keyword.type"] = {
            fg = palette.aqua,
        },
        ["@keyword.modifier"] = {
            fg = palette.aqua,
        },
        ["@keyword.conditional"] = {
            fg = palette.aqua,
        },
        ["@keyword.repeat"] = {
            fg = palette.aqua,
        },
        ["@keyword.exception"] = {
            fg = palette.aqua,
        },
        ["@keyword.debug"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.define"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.include"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.undef"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.if"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.else"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.elif"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.endif"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.ifdef"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.ifndef"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.pragma"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.line"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.error"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.warning"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.null"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.region"] = {
            fg = palette.aqua,
        },
        ["@keyword.directive.endregion"] = {
            fg = palette.aqua,
        },
        ["@parameter"] = {
            fg = palette.white,
        },
        ["@string"] = {
            fg = palette.yellow,
        },
        ["@type"] = {
            fg = palette.green,
            style = 'italic',
        },
        ["@type.builtin"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@type.qualifier"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@type.definition"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@storageclass"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@structure"] = {
            fg = palette.aqua,
            style = 'italic',
        },
        ["@variable"] = {
            fg = palette.white,
        },
        ["@variable.parameter"] = {
            fg = palette.white,
            style = 'italic',
        },
        ["@variable.language"] = {
            fg = palette.white,
            style = 'italic',
        },
        ["@variable.language.arguments"] = {
            fg = palette.purple,
        },
        ["@variable.language.super"] = {
            fg = palette.white,
            style = 'italic',
        },
        ["@variable.language.this"] = {
            fg = palette.white,
            style = 'italic',
        },
        ["@variable.language.self"] = {
            fg = palette.white,
            style = 'italic',
        },

        -- LSP Semantic tokens
        ["@lsp.type.class"] = {
            fg = palette.aqua,
        },
        ["@lsp.type.decorator"] = {
            fg = palette.green,
        },
        ["@lsp.type.enum"] = {
            fg = palette.aqua,
        },
        ["@lsp.type.function"] = {
            fg = palette.green,
        },
        ["@lsp.type.interface"] = {
            fg = palette.aqua,
        },
        ["@lsp.type.macro"] = {
            fg = palette.pink,
        },
        ["@lsp.type.method"] = {
            fg = palette.green,
        },
        ["@lsp.type.namespace"] = {
            fg = palette.white,
        },
        ["@lsp.type.parameter"] = {
            fg = palette.white,
        },
        ["@lsp.type.property"] = {
            fg = palette.white,
        },
        ["@lsp.type.struct"] = {
            fg = palette.aqua,
        },
        ["@lsp.type.type"] = {
            fg = palette.aqua,
        },
        ["@lsp.type.variable"] = {
            fg = palette.white,
        },

        -- Diagnostic
        DiagnosticSignError = {
            fg = palette.red,
        },
        DiagnosticSignWarn = {
            fg = palette.orange,
        },
        DiagnosticSignInfo = {
            fg = palette.purple,
        },
        DiagnosticSignHint = {
            fg = palette.aqua,
        },
        DiagnosticVirtualTextError = {
            fg = palette.red,
        },
        DiagnosticVirtualTextWarn = {
            fg = palette.orange,
        },
        DiagnosticVirtualTextInfo = {
            fg = palette.purple,
        },
        DiagnosticVirtualTextHint = {
            fg = palette.aqua,
        },
        DiagnosticUnderlineError = {
            style = 'undercurl',
            sp = palette.red,
        },
        DiagnosticUnderlineWarn = {
            style = 'undercurl',
            sp = palette.orange,
        },
        DiagnosticUnderlineInfo = {
            style = 'undercurl',
            sp = palette.purple,
        },
        DiagnosticUnderlineHint = {
            style = 'undercurl',
            sp = palette.aqua,
        },

        -- Telescope
        TelescopeBorder = {
            fg = palette.base7,
        },
        TelescopeNormal = {
            fg = palette.base8,
            bg = palette.base0,
        },
        TelescopeSelection = {
            fg = palette.white,
            style = 'bold',
        },
        TelescopeSelectionCaret = {
            fg = palette.green,
        },
        TelescopeMultiSelection = {
            fg = palette.pink,
        },
        TelescopeMatching = {
            fg = palette.aqua,
        },

        -- nvim-cmp
        CmpItemAbbr = { fg = palette.white },
        CmpItemAbbrMatch = { fg = palette.aqua },
        CmpItemAbbrMatchFuzzy = { fg = palette.aqua },
        CmpItemMenu = { fg = palette.base6 },
        CmpItemKindFunction = { fg = palette.green },
        CmpItemKindMethod = { fg = palette.green },
        CmpItemKindVariable = { fg = palette.white },
        CmpItemKindKeyword = { fg = palette.pink },
        ["@operator"] = {
            fg = palette.aqua,
        },
        ["@punctuation"] = {
            fg = palette.aqua,
        },
        ["@punctuation.definition.string"] = {
            fg = palette.yellow,
        },
        ["@punctuation.definition.tag"] = {
            fg = palette.white,
        },
        ["@punctuation.definition.comment"] = {
            fg = palette.base5,
        },
        ["@punctuation.definition.variable"] = {
            fg = palette.white,
        },
        ["@punctuation.section.embedded"] = {
            fg = palette.orange,
        },
        ["@punctuation.template-string.element.begin"] = {
            fg = palette.aqua,
        },
        ["@punctuation.template-string.element.end"] = {
            fg = palette.aqua,
        },
        ["@punctuation.definition.string.template.begin"] = {
            fg = palette.aqua,
        },
        ["@punctuation.definition.string.template.end"] = {
            fg = palette.aqua,
        },
        ["@punctuation.definition.template-expression.begin"] = {
            fg = palette.aqua,
        },
        ["@punctuation.definition.template-expression.end"] = {
            fg = palette.aqua,
        },
        ["@punctuation.bracket"] = {
            fg = palette.yellow,
        },
        ["@punctuation.delimiter"] = {
            fg = palette.yellow,
        },
        ["@punctuation.special"] = {
            fg = palette.yellow,
        },
    }
end

local default_config = {
    italics = true,
    custom_hlgroups = {},
}

M.setup = function(config)
    vim.cmd('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end
    vim.o.background = 'dark'
    vim.o.termguicolors = true

    config = config or {}
    config = vim.tbl_deep_extend('keep', config, default_config)

    vim.g.colors_name = M.colors.name

    local syntax = M.load_syntax(M.colors)
    syntax = vim.tbl_deep_extend('keep', config.custom_hlgroups, syntax)

    local highlight = highlighter(config)

    for group, colors in pairs(syntax) do
        highlight(group, colors)
    end

    local plugin_syntax = M.load_plugin_syntax(M.colors)
    plugin_syntax = vim.tbl_deep_extend('keep', config.custom_hlgroups, plugin_syntax)

    for group, colors in pairs(plugin_syntax) do
        highlight(group, colors)
    end
end

return M

