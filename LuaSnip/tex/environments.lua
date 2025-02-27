---@diagnostic disable: undefined-global
require('luasnip.loaders.from_lua').lazy_load()
local autosnippet = require('luasnip').extend_decorator.apply(s, { snippetType = 'autosnippet' })

local table_node = function(args)
  local tabs = {}
  local count
  table = args[1][1]:gsub('%s', ''):gsub('|', '')
  count = table:len()
  for j = 1, count do
    local iNode
    iNode = i(j)
    tabs[2 * j - 1] = iNode
    if j ~= count then
      tabs[2 * j] = t ' & '
    end
  end
  return sn(nil, tabs)
end

local rec_table
rec_table = function()
  return sn(nil, {
    c(1, {
      t { '' },
      sn(nil, { t { '\\\\', '' }, d(1, table_node, { ai[1] }), d(2, rec_table, { ai[1] }) }),
    }),
  })
end

-- Function to generate the content of the matrix
local matrix_content = function(args)
  local rows = tonumber(args[1][1]) or 2 -- Default to 2 rows if no input
  local cols = tonumber(args[2][1]) or 2 -- Default to 2 columns if no input
  print('Rows: ', rows, 'Columns: ', cols)
  local nodes = {}
  local order = 1

  for i = 1, rows do
    for j = 1, cols do
      table.insert(nodes, i(order)) -- Insert an insert node for each cell
      order = order + 1
      if j < cols then
        table.insert(nodes, t ' & ') -- Add '&' between columns
      end
    end
    if i < rows then
      table.insert(nodes, t { ' \\\\', '' }) -- Add '\\' between rows
    end
  end

  return sn(nil, nodes) -- Return the snippet node containing the matrix cells
end

return {
  s(
    { trig = 'begin', name = 'LaTex environment' },
    fmta(
      [[
    \begin{<>}
      <>
    \end{<>}
    ]],
      {
        i(1),
        i(0),
        rep(1),
      }
    ),
    { condition = line_begin }
  ),
  s(
    'itemize',
    fmta(
      [[
    \begin{itemize}
      \item <>
    \end{itemize}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    'enumerate',
    fmta(
      [[
    \begin{enumerate}
      \item <>
    \end{enumerate}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    'desc',
    fmta(
      [[
    \begin{description}
      \item[<>] <>
    \end{description}
    ]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    'eq',
    fmta(
      [[
    \begin{equation}
      <>
    \end{equation}
    ]],
      {
        i(1),
      }
    )
  ),
  autosnippet(
    'dm',
    fmta(
      [[
    \begin{align}
      <>
    \end{align}
    ]],
      {
        i(1),
      }
    )
  ),
  autosnippet(
    'fm',
    fmta(
      [[
      $<>$
      ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'eqa', name = 'Equation Array' },
    fmta(
      [[
			\begin{eqarray}
				<> & <> & <>
			\end{eqarray}
			]],
      {
        i(1),
        i(2),
        i(0),
      }
    )
  ),
  s('table', {
    t '\\begin{tabular}{',
    i(1, '0'),
    t { '}', '' },
    d(2, table_node, { 1 }, {}),
    d(3, rec_table, { 1 }),
    t { '', '\\end{tabular}' },
  }),
  -- LuaSnip matrix snippet using `fmta`
  s('mat', {
    t '\\begin{',
    i(1, 'bmatrix'), -- Insert node for matrix type (default to bmatrix)
    t { '}', '' },
    i(2, '2'), -- Insert node for number of rows (default to 2)
    t { ' ', '' }, -- Space before number of columns
    i(3, '2'), -- Insert node for number of columns (default to 2)
    t { '', '' }, -- Empty line for formatting
    d(4, matrix_content, { i(2), i(3) }), -- Dynamic node for matrix cells based on rows and columns
    t { '', '\\end{' },
    rep(1), -- Repeat the matrix type for the closing tag
    t '}',
  }),
  s(
    'abs',
    fmta(
      [[
		\begin{abstract}
			<>
		\end{abstract}
	]],
      { i(0) }
    )
  ),

  s(
    'image',
    fmta(
      [[
			\begin{center}
			\includegraphics[width=<>}\linewidth]{<>}
			\end{center}
			<>
		]],
      { i(1, '0.8'), i(2), i(0) }
    )
  ),
  s(
    'fig',
    fmta(
      [[
			\begin{figure}[<>]
				\centering
				\includegraphics[width=<>\linewidth]{<>}
				\caption{<>}
				\label{fig:<>}
			\end{figure}
			]],
      { i(1, 'htpb'), i(2, '0.8'), i(3), i(4), i(0) }
    )
  ),
  s(
    'wfig',
    fmta(
      [[
			\begin{wrapfigure}{<>}{<>\textwidth}
				\includegraphics[width=<>\linewidth]{<>}
				\caption{<>}
				\label{fig:<>}
			\end{wrapfigure}
			]],
      { i(1, 'pos'), i(2, '0.2'), i(3, '0.8'), i(4), i(5), i(0) }
    )
  ),
  s(
    'lst',
    fmta(
      [[
		\begin{lstlisting}[caption=<>,captionpos=b]
			<>
		\end{lstlisting}
		<>
		]],
      { i(1), i(2), i(0) }
    )
  ),
  s(
    { trig = 'cases', name = 'Cases environment' },
    fmta(
      [[
    \begin{cases}
       <> \\
       <> \\
    \end{cases}
    ]],
      {
        i(1, 'case a'),
        i(2, 'case b'),
      }
    )
  ),
  s(
    { trig = 'definition', name = 'Definiton Environment' },
    fmta(
      [[
      \begin{definition}[<>]\label{def}
        <>
      \end{definition}
      ]],
      {
        i(1),
        i(2),
      }
    )
  ),
}
