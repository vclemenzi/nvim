return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override_by_filename = {
        [".gitignore"] = {
          icon = "󰊢",
          color = "#f1502f",
          name = "Gitignore",
        },
        ["bower.json"] = {
          icon = "",
          color = "#ef5734",
          name = "Bower",
        },
        [".eslintrc.js"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".eslintrc.cjs"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".eslintrc.yaml"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".eslintrc.yml"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".eslintrc.json"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".eslintignore"] = {
          icon = "󰱺",
          color = "#4b32c3",
          name = "Eslint",
        },
        [".stackblitzrc"] = {
          icon = "󱐋",
          color = "#3f95c6",
          name = "Stackblitz",
        },
        ["vercel.json"] = {
          icon = "󰔶",
          color = "#ffffff",
          name = "Vercel",
        },
        ["yarn.lock"] = {
          icon = "",
          color = "#2c8ebb",
          name = "Yarn",
        },
        [".yarnrc.yml"] = {
          icon = "",
          color = "#2c8ebb",
          name = "Yarn",
        },
        ["tailwind.config.cjs"] = {
          icon = "󱏿",
          color = "#0677a9",
          name = "Tailwindcss",
        },
        ["tailwind.config.mjs"] = {
          icon = "󱏿",
          color = "#0677a9",
          name = "Tailwindcss",
        },
        ["tailwind.config.js"] = {
          icon = "󱏿",
          color = "#0677a9",
          name = "Tailwindcss",
        },
        ["tailwind.config.ts"] = {
          icon = "󱏿",
          color = "#0ea5e9",
          name = "Tailwindcss",
        },
        ["Cargo.toml"] = {
          icon = "",
          color = "#e4a936",
          name = "Cargo"
        },
        ["Cargo.lock"] = {
          icon = "",
          color = "#e4a936",
          name = "Cargo"
        },
        ["robots.txt"] = {
          icon = "󰚩",
          color = "#d63a2f",
          name = "robots.txt"
        },
        ["rollup.config.js"] = {
          icon = "",
          color = "#ea3335",
          name = "Rollup"
        },
        [".babelrc"] = {
          icon = "",
          color = "#f5db58",
          name = "Babel"
        }
      },
      override_by_extension = {
        ["ts"] = {
          icon = "󰛦",
          color = "#007acc",
          name = "Typescript",
        },
        ["cts"] = {
          icon = "󰛦",
          color = "#007acc",
          name = "Typescript",
        },
        ["js"] = {
          icon = "󰌞",
          color = "#f0db4f",
          name = "Javascript",
        },
        ["cjs"] = {
          icon = "󰌞",
          color = "#f0db4f",
          name = "Javascript",
        },
        ["mjs"] = {
          icon = "󰌞",
          color = "#f0db4f",
          name = "Javascript",
        },
        ["md"] = {
          icon = "",
          color = "#57bce8",
          name = "markdown",
        },
        ["mdx"] = {
          icon = "",
          color = "#fcb32c",
          name = "markdownx",
        },
        ["png"] = {
          icon = "󰋩",
          color = "#8e4191",
          name = "png",
        },
        ["v"] = {
          icon = "",
          color = "#4a607e",
          name = "v"
        },
        ["exe"] = {
          icon = "",
          color = "#0060aa",
          name = "exe"
        },
        ["deb"] = {
          icon = "󰣚",
          color = "#a80030",
          name = "deb"
        },
        ["apk"] = {
          icon = "󰀲",
          color = "#2d9944",
          name = "android"
        }
      },
    })
  end,
}
