local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    "williamboman/mason-lspconfig.nvim",
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      config = true
    },
    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { "j-hui/fidget.nvim", opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
    -- Autocompletion
    "hrsh7th/cmp-nvim-lsp",
  },
}

function M.config()
  -- LSP settings.
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function (_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.

    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function (keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end

      vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
    end

    nmap("<leader>lr", vim.lsp.buf.rename, "[R]ename")
    nmap("<leader>lc", vim.lsp.buf.code_action, "[C]ode Action")
    nmap("<leader>lf", vim.lsp.buf.format, "[F]ormat")
    nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
    nmap("gr", require"telescope.builtin".lsp_references, "[G]oto [R]eferences")
    nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
    nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
    nmap("<leader>ds", require"telescope.builtin".lsp_document_symbols, "[D]ocument [S]ymbols")
    nmap("<leader>ws", require"telescope.builtin".lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    -- See `:help K` for why this keymap
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("<c-k>", vim.lsp.buf.signature_help, "signature documentation")
    -- Lesser used LSP functionality
    nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
    nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
    nmap("<leader>wl", function ()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "[W]orkspace [L]ist Folders")
    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function (_)
      vim.lsp.buf.format()
    end, { desc = "Format current buffer with LSP" })
  end

  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  local servers = {
    clangd = {},
    cssls = {},
    eslint = {},
    gopls = {},
    html = {},
    jsonls = {},
    lua_ls = {
      Lua = {
        -- workspace = { checkThirdParty = false },
        -- telemetry = { enable = false },
        format = {
          enable = true,
          defaultConfig = {
            align_array_table = "false",
            align_call_args = "false",
            align_continuous_assign_statement = "true",
            align_continuous_inline_comment = "true",
            align_continuous_line_space = "2",
            align_continuous_rect_table_field = "true",
            align_function_params = "true",
            align_if_branch = "false",
            auto_collapse_lines = "false",
            break_all_list_when_line_exceed = "false",
            call_arg_parentheses = "remove",
            detect_end_of_line = "false",
            ignore_space_after_colon = "false",
            ignore_spaces_inside_function_call = "false",
            indent_size = "2",
            indent_style = "space",
            insert_final_newline = "true",
            line_space_after_comment = "keep",
            line_space_after_do_statement = "keep",
            line_space_after_expression_statement = "keep",
            line_space_after_for_statement = "keep",
            line_space_after_function_statement = "fixed(2)",
            line_space_after_if_statement = "keep",
            line_space_after_local_or_assign_statement = "keep",
            line_space_after_repeat_statement = "keep",
            line_space_after_while_statement = "keep",
            max_line_length = "120",
            never_indent_before_if_condition = "false",
            never_indent_comment_on_if_branch = "false",
            quote_style = "double",
            remove_call_expression_list_finish_comma = "false",
            space_after_comma = "true",
            space_after_comma_in_for_statement = "true",
            space_around_concat_operator = "true",
            space_around_math_operator = "true",
            space_around_table_append_operator = "false",
            space_around_table_field_list = "true",
            space_before_attribute = "true",
            space_before_closure_open_parenthesis = "true",
            space_before_function_call_open_parenthesis = "false",
            space_before_function_call_single_arg = "none",
            space_before_function_open_parenthesis = "false",
            space_before_inline_comment = "1",
            space_before_open_square_bracket = "false",
            space_inside_function_call_parentheses = "false",
            space_inside_function_param_list_parentheses = "false",
            space_inside_square_brackets = "false",
            trailing_table_separator = "none",
          },
        },
        diagnostics = {
          neededFileStatus = {
            ["codestyle-check"] = "Any"
          }
        }
      },
    },
    pyright = {},
    rust_analyzer = {},
    tsserver = {},
  }

  -- Setup neovim lua configuration
  require"neodev".setup()
  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = require"cmp_nvim_lsp".default_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Ensure the servers above are installed
  local mason_lspconfig = require"mason-lspconfig"

  mason_lspconfig.setup{
    ensure_installed = vim.tbl_keys(servers),
  }

  mason_lspconfig.setup_handlers{
    function (server_name)
      require"lspconfig"[server_name].setup{
        on_attach = on_attach,
        capabilities = capabilities,
        settings = servers[server_name],
      }
    end,
  }
end

return M
