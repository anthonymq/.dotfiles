return {
    -- integration IA model local
    "David-Kunz/gen.nvim",
    keys = {
        { "<leader>ia", ":Gen<CR>", mode = { "n", "v" }, desc = "Call IA" },
    },
    config = function()
        require('gen').model = 'mistral-nemo' -- default 'mistral:instruct'

        require('gen').prompts['Generate'] = {
            prompt =
            "$input. In the language $filetype, only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
            -- replace = true,
            extract = "```$filetype\n(.-)```"
        }
    end
}
