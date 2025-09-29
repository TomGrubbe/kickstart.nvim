
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

-- Go snippets
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

-- Bash snippets
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

  s({trig='iif', desc='In-line if statement'},
    fmta(
      [[
        [ <> ] && fail "<>"
      ]],
      {
        i(1, '<condition>'),
        i(2, '<error message>'),
      }
    )
  ),

  s('fail',
    fmta(
      [[
        fail()
        {
          echo ""
          echo "ERROR: $1"
          echo ""
          exit 1
        }

      ]],
      { }
    )
  ),

  s('sanity_check',
    fmta(
      [[
        sanity_check()
        {
          [ <> ] && fail "<>"
        }
      ]],
      {
        i(1, '<condition>'),
        i(2, '<error message>'),
      }
    )
  ),

  s('usage', {
    t({"usage()",
      "{",
      "  [ -n \"$1\" ] && printf \"\\nERROR: %s\\n\" \"$1\"",
      "",
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
      "  NOTES:",
      "",
      "    * <add notes here>",
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

  s('getopts', {
    t({"while getopts \"hd:?\" opt",
      "do",
      "  case \"$opt\" in",
      "    h)",
      "      usage",
      "      ;;",
      "    d)",
      "      INSTALL_DIR=${OPTARG}",
      "      ;;",
      "    *)",
      "      echo \"-- What? --\"",
      "      usage",
      "      ;;",
      "  esac",
      "done",
      ""}),
  }),

  s({trig='wh', snippetType='snippet', desc='Basic while loop'},
    fmta(
      [[
        while [ <> ]; do
          <>
        done
      ]],
      {
        i(1, '<enter condition>'),
        i(2, '<add logic>'),
      }
    )
  ),
})


