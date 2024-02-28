-- if a file is a .env or .envrc file, set the filetype to sh
vim.filetype.add({
    filename = {
        [".env"] = "sh",
        [".envrc"] = "sh",
    },
    pattern = {
        [".*.envrc"] = "sh",
        [".*.env"] = "sh",
        -- ["*.nomad"] = "hcl",
    },
    extension = {
        templ = "templ",
        nomad = "hcl.nomad"
        -- nomad = "nomad"
    }
})
