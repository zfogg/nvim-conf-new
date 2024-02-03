return {
  {
    "telescope.nvim",
    opts = {},
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        --build = "make",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension("frecency")
        end,
      },
    },
  },
}
