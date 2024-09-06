return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "{Left-Mapping}",     ":<C-U>TmuxNavigateLeft<cr>",     desc = "Navigate left in Tmux" },
      { "{Down-Mapping}",     ":<C-U>TmuxNavigateDown<cr>",     desc = "Navigate down in Tmux" },
      { "{Up-Mapping}",       ":<C-U>TmuxNavigateUp<cr>",       desc = "Navigate up in Tmux" },
      { "{Right-Mapping}",    ":<C-U>TmuxNavigateRight<cr>",    desc = "Navigate right in Tmux" },
      { "{Previous-Mapping}", ":<C-U>TmuxNavigatePrevious<cr>", desc = "Navigate to the previous location in Tmux" },
    },
  },
}
