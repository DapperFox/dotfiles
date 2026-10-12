local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("react", {
    t({ "import React from 'react'", "", "export default function " }),
    i(1),
    t(" ("),
    i(2, "props"),
    t({ ") {", "\treturn (", "\t\t" }),
    i(3),
    t({ "", "\t)", "}" }),
  }),
  s("cl{", {
    t("console.log({"),
    i(1),
    t("})"),
  }),
  s("high", {
    t("backgroundColor: 'rgba(255, 255, 255, .4)'"),
  }),
  s("cl1", { t("console.log(`%c${"), i(1), t("}`, 'color: hotpink')") }),
  s("cl2", { t("console.log(`%c${"), i(1), t("}`, 'color: springgreen')") }),
  s("cl3", { t("console.log(`%c${"), i(1), t("}`, 'color: dodgerblue')") }),
  s("cl4", { t("console.log(`%c${"), i(1), t("}`, 'color: fuchsia')") }),
}
