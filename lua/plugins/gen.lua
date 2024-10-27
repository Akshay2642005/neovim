return {
  {
    'David-Kunz/gen.nvim',
    cmd = { 'Gen' },
    opts = {
      -- model = 'llama3',
      model = 'qwen2.5-coder:7b-instruct-q8_0',
      host = '127.0.0.1',
      port = '11434',
      quit_map = 'q',
      retry_map = '<C-r>',
      show_model = true,
    },
  },
}
