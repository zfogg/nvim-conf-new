-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    enabled = true,
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
    end,
  },

  {
    "telescope.nvim",
    --config = function(opts)
      --print(opts)
    --end,
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      --build = "make",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  {
    "preservim/nerdcommenter"
  },

  {
    "tpope/vim-surround",
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

  -- FIXME:
  -- surrounder / pair actions
  -- commenter (<leader>c<space>)
  -- ctrl-c to clear flash.nvim searches
  -- ,<space> to clear comments
  -- autoformatting on save
  -- tab for autocomplete menu
}
