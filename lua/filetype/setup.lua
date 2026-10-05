vim.filetype.add({
    extension = {
        mbt = "moonbit",
        mbti = "moonbit",
        moonbit = "moonbit",
        mbtp = "moonbit_mbtp",
        nuon = "nuon",
        wsb = "xml",
    },
    filename = {
        ["moon.pkg"] = "moonbit",
        ["xmake.lua"] = "xmake",
        [".wslconfig"] = "ini",
    },
})
