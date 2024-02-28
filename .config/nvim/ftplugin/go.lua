local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

require("dap-go").setup {
    dap_configurations = {
        {
            -- Must be "go" or it will be ignored by the plugin
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
        },
    },
    -- delve configurations
    delve = {
        -- the path to the executable dlv which will be used for debugging.
        -- by default, this is the "dlv" executable on your PATH.
        path = "dlv",
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        -- port = "${port}",
        port = "2345",
        -- additional args to pass to dlv
        args = {},
        -- the build flags that are passed to delve.
        -- defaults to empty string, but can be used to provide flags
        -- such as "-tags=unit" to make sure the test suite is
        -- compiled during debugging, for example.
        -- passing build flags using args is ineffective, as those are
        -- ignored by delve in dap mode.
        build_flags = "",
    },
}


ls.add_snippets("go", {
    s(
        { trig = "id", name = "import default" },
        fmt('import (\n	"{}"\n)\n\n{}', { i(1), i(0) })
    ),

    s(
        { trig = "gm", name = "go main" },
        fmt("package main\n\nfunc main() {{\n	{}\n}}", { i(0) })
    ),

    s(
        { trig = "fd", name = "function definition" },
        fmt("func {}({}) {} {{\n	{}\n}}\n\n{}", { i(1), i(2), i(3), i(4), i(0) })
    ),

    s(
        { trig = "de", name = "expect equals" },
        fmt(
            [[
if got != want {{
  t.Errorf("got %v want %v", got, want)
}}

{}
  ]],
            { i(0) }
        )
    ),

    s(
        { trig = "ded", name = "deep equals" },
        fmt(
            [[
if !reflect.DeepEqual(got, want) {{
  t.Errorf("got %v want %v", got, want)
}}

{}
  ]],
            { i(0) }
        )
    ),

    s(
        { trig = "de", name = "expect equals" },
        fmt(
            'if {} != {} {{\n	t.Errorf("{} %v {} %v", {}, {})\n}}{}',
            { i(1, "got"), i(2, "want"), rep(2), rep(2), rep(1), rep(2), i(0) }
        )
    ),
    s(
        { trig = "ded", name = "deep equals" },
        fmt(
            'if !reflect.DeepEqual({}, {}) {{\n	t.Errorf("{} %v {} %v", {}, {})\n}}',
            { i(1, "got"), i(2, "want"), rep(1), rep(2), rep(1), rep(2) }
        )
    ),

    s(
        { trig = "df", name = "test file" },
        fmt(
            [[
package {}_test

import ("testing")

{}
]],
            { i(1), i(0) }
        )
    ),

    s(
        { trig = "ds", name = "test suite" },
        fmt(
            [[
func Test{}(t *testing.T) {{
  t.Run("{}", func(t *testing.T) {{
    got := {}
    want := {}

    if got != want {{
      t.Errorf("got %v want %v", got, want)
    }}
  }})

  {}
}}
]],
            { i(1), i(2), i(3), i(4), i(0) }
        )
    ),

    s(
        { trig = "dc", name = "test case" },
        fmt(
            [[
t.Run("{}", func(t *testing.T) {{
  got := {}
  want := {}

  if got != want {{
    t.Errorf("got %v want %v", got, want)
  }}
}})

{}
]],
            { i(1), i(2), i(3), i(0) }
        )
    ),

    s(
        { trig = "dh", name = "test helper" },
        fmt(
            [[
func {}(t testing.TB, {}) {{
  t.Helper()

  {}
}}

{}
]],
            { i(1), i(2), i(3), i(0) }
        )
    ),

    s(
        { trig = "db", name = "test benchmark" },
        fmt(
            [[
func Benchmark{}(b testing.B, {}) {{
  {}
}}

{}
]],
            { i(1), i(2), i(3), i(0) }
        )
    ),

    s(
        { trig = "dx", name = "test example" },
        fmt(
            [[
func Example{}() {{
  {}
}}

{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "dt", name = "table test" },
        fmt(
            [[
t.Run("{}", func(t *testing.T) {{
  type {} struct {{
    name string
    {} {}
    want {}
  }}

  cases := []{} {{
      {{ name: {}, {}: {}, want: {} }},
  }}

  for _, c := range cases {{
    t.Run("{}", func(t *testing.T) {{
      got := {}

      if !reflect.DeepEqual(got, c.want) {{
          t.Errorf("%#v, got %v want %v", c.{}, got, c.want)
      }}
    }})
  }}
}})

{}
]],
            {
                i(1),
                i(2, "testCase"),
                i(3),
                i(4),
                i(5),
                rep(2),
                i(6),
                rep(3),
                i(7),
                i(8),
                i(9),
                i(10),
                rep(3),
                i(0),
            }
        )
    ),

    s(
        { trig = "ll", name = "log standard" },
        fmt(
            [[
fmt.Printf({})
{}
]],
            { i(1), i(0) }
        )
    ),

    s(
        { trig = "lf", name = "log format" },
        fmt("fmt.Sprintf({}){}", { i(1), i(0) })
    ),

    s(
        { trig = "ci", name = "if statement" },
        fmt(
            [[
if {} {{
  {}
}}

{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "ch", name = "handle error" },
        fmt(
            [[
if err != nil {{
    return nil, err
}}

{}
]],
            { i(0) }
        )
    ),

    s(
        { trig = "cs", name = "switch statement" },
        fmt(
            [[
switch {} {{
  case {}:
    {}
  {}
}}

{}
]],
            { i(1), i(2), i(3), i(4), i(0) }
        )
    ),

    s(
        { trig = "cc", name = "switch case" },
        fmt(
            [[
case {}:
  {}
{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "cw", name = "select (wait) statement" },
        fmt(
            [[
select {} {{
  case {}:
    {}
  {}
}}

{}
]],
            { i(1), i(2), i(3), i(4), i(0) }
        )
    ),

    s(
        { trig = "cd", name = "switch default" },
        fmt(
            [[
default:
  {}
]],
            { i(0) }
        )
    ),

    s(
        { trig = "cf", name = "for each" },
        fmt(
            [[
for _, {} := range {} {{
  {}
}}

{}
]],
            { i(1), i(2), i(3), i(0) }
        )
    ),

    s(
        { trig = "cfr", name = "for range" },
        fmt(
            [[
for {} := 0; {} < {}; {}++ {{
  {}
}}

{}
]],
            { i(1), rep(1), i(2), rep(1), i(3), i(4) }
        )
    ),

    s(
        { trig = "cl", name = "loop" },
        fmt(
            [[
for {} {{
  {}
}}

{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "ti", name = "type interface" },
        fmt(
            [[
type {} interface {{
  {}
}}

{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "ts", name = "type struct" },
        fmt(
            [[
type {} struct {{
  {}
}}

{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "ta", name = "type alias" },
        fmt(
            [[
type {} = {}
{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "md", name = "method declaration" },
        fmt(
            [[
func ({} *{}) {}({}) {} {{
  {}
}}

{}
]],
            { i(1), i(2), i(3), i(4), i(5), i(6), i(0) }
        )
    ),

    s(
        { trig = "vd", name = "variable declaration" },
        fmt(
            [[
{} := {}
{}
]],
            { i(1), i(2), i(0) }
        )
    ),

    s(
        { trig = "vv", name = "var" },
        fmt(
            [[
var {}
{}
]],
            { i(1), i(0) }
        )
    ),

    s(
        { trig = "vc", name = "const" },
        fmt(
            [[
const {}
{}
]],
            { i(1), i(0) }
        )
    ),
})
