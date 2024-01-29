-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = false,
    ---@type Flash.Config
    opts = {
      char = {
        -- keys = { [";"] = "H", [","] = "L" },
        keys = { "f", "F", "t", "T", [";"] = "L", [","] = "H" },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require 'nvim-treesitter.install'.prefer_git = false
      --require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
    end,
  },

  --{
    --"yanky.nvim",
    --dependencies = {
      --"telescope.nvim",
    --},
    --config = function(plugin, opts)
      --plugin.setup(opts)
      --require("telescope").load_extension("yank_history")
    --end,
  --},

  {
    "preservim/nerdcommenter"
  },

  {
    "tpope/vim-surround",
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>f<space>", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
      require("neo-tree").setup()
    end,
  },


  { 'peitalin/vim-jsx-typescript',
    dependencies = {
      { 'leafgarland/typescript-vim', },
    },
  },

  --{
  --"folke/noice.nvim",
    --enabled = false,
    --opts = {
      --notify = {
        --enabled = false,
      --},
    --},
  --},

  --{ "rcarriga/nvim-notify", enabled = false },

  --{ "nvim-treesitter", enabled = false },

  --{ "nvim-ts-autotag", enabled = false },

  { "neo-tree.nvim", enabled = false },

  -- FIXME:
  -- surrounder / pair actions
  -- commenter (<leader>c<space>)
  -- ctrl-c to clear flash.nvim searches
  -- ,<space> to clear comments
  -- autoformatting on save
  -- tab for autocomplete menu
}
