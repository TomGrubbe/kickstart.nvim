
-- From: https://www.youtube.com/watch?v=Bkh-fRbg2BU
-- See also: https://github.com/L3MON4D3/LuaSnip/blob/master/doc/luasnip.txt
--
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

ls.add_snippets('go', {
  s({trig='err', snippetType='snippet', desc='Insert go error handler'},
    fmta(
      [[
        if err != nil {
            <>
        }
      ]],
      {
        i(1, '<your error msg here>'),
      }
    )
  ),
})

ls.add_snippets('sh', {
  s('cwd', {
    t("CWD=$(cd \"$(dirname \"$0\")\" && pwd)")
  }),
  s('here', {
    t({"cat <<EOF",
      "",
      "EOF",
    }),
  }),
  s('fail', {
    t({"fail()",
      "{",
      "  echo \"\"",
      "  echo \"ERROR: $1\"",
      "  echo \"\"",
      "  exit 1",
      "}",
      ""}),
  }),
  s('usage', {
    t({"usage()",
      "{",
      "cat <<EOF",
      "",
      "  USAGE: % ./${PROG} [options] ${1:add options here}",
      "",
      "  OPTIONS:",
      "",
      "    -h                   - Usage",
      "    -f <filename>        - Some description",
      "    <add options here>",
      "",
      "  EXAMPLES:",
      "",
      "    % ./${PROG} <add flags here>",
      "",
      "EOF",
      "  exit 0",
      "}",
      ""}),
  }),
  s('process_args', {
    t({"process_args()",
      "{",
      "  [ $# -eq 0 ] && usage",
      "",
      "  while getopts \"hd:?\" opt",
      "  do",
      "    case \"$opt\" in",
      "      h)",
      "        usage",
      "        ;;",
      "      d)",
      "        INSTALL_DIR=${OPTARG}",
      "        ;;",
      "      *)",
      "        echo \"-- What? --\"",
      "        usage",
      "        ;;",
      "    esac",
      "  done",
      "}",
      ""}),
  }),
  s('wh', fmt('while [ {} ]; then', {
      i(1),
    })),
})


