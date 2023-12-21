require('gen').model = 'codellama' -- default 'mistral:instruct'
vim.keymap.set('v', '<leader>ia', ':Gen<CR>')
vim.keymap.set('n', '<leader>ia', ':Gen<CR>')

require('gen').prompts['Generate'] = {
    prompt =
    "$input. In the language $filetype, only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
    -- replace = true,
    extract = "```$filetype\n(.-)```"
}
