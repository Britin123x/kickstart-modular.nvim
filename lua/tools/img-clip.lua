return {
  'HakonHarnes/img-clip.nvim',
  event = 'VeryLazy',
  opts = {
    -- add options here
    -- or leave it empty to use the default settings
    filetypes = {
      tex = {
        use_absolute_path = true,
        template = [[
\begin{figure}[h]
  \centering
  \includegraphics[width=\columnwidth]{$FILE_PATH}
  \caption{$CURSOR}
  \label{fig:$LABEL}
\end{figure}
    ]],
      },
    },
  },
  keys = {
    -- suggested keymap
    { '<leader>p', '<cmd>PasteImage<cr>', desc = '[P]aste image from clipboard' },
  },
}
