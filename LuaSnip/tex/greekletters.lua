---@diagnostic disable: undefined-global
require('luasnip.loaders.from_lua').lazy_load()
local tsutils = require 'tsutils'
local autosnippet = require('luasnip').extend_decorator.apply(s, { snippetType = 'autosnippet' })

-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else -- If LS_SELECT_RAW is empty, return a blank insert node
    return sn(nil, i(1))
  end
end
-- ----------------------------------------------------------------------------

return {
  autosnippet({ trig = 'NN', name = 'Natural numbers' }, t '\\mathbb{N}', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'ZZ', name = 'Integers' }, t '\\mathbb{Z}', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'QQ', name = 'Rational numbers' }, t '\\mathbb{Q}', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'RR', name = 'Real numbers' }, t '\\mathbb{R}', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'CC', name = 'Complex numbers' }, t '\\mathbb{C}', { condition = tsutils.in_mathzone }),
  -- greek alphabet
  autosnippet({ trig = ';a', name = 'Greek alpha' }, t '\\alpha', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';b', name = 'Greek beta' }, t '\\beta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';g', name = 'Greek gamma' }, t '\\gamma', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';G', name = 'Greek Gamma' }, t '\\Gamma', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';d', name = 'Greek delta' }, t '\\delta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';D', name = 'Greek Delta' }, t '\\Delta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'eps', name = 'Greek epsilon' }, t '\\epsilon', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';z', name = 'Greek zeta' }, t '\\zeta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';e', name = 'Greek eta' }, t '\\eta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';q', name = 'Greek theta' }, t '\\theta', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';i', name = 'Greek iota' }, t '\\iota', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';k', name = 'Greek kappa' }, t '\\kappa', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';l', name = 'Greek lambda' }, t '\\lambda', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';L', name = 'Greek Lambda' }, t '\\Lambda', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';m', name = 'Greek mu' }, t '\\mu', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';n', name = 'Greek nu' }, t '\\nu', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';x', name = 'Greek xi' }, t '\\xi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';w', name = 'Greek omicron' }, t '\\omicron', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = 'pi', name = 'Greek pi' }, t '\\pi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';r', name = 'Greek rho' }, t '\\rho', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';vr', name = 'Greek var-rho' }, t '\\varrho', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';s', name = 'Greek sigma' }, t '\\sigma', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';t', name = 'Greek tau' }, t '\\tau', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';u', name = 'Greek upsilon' }, t '\\upsilon', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';p', name = 'Greek phi' }, t '\\phi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';vp', name = 'Greek var-phi' }, t '\\varphi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';c', name = 'Greek chi' }, t '\\chi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';y', name = 'Greek psi' }, t '\\psi', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';o', name = 'Greek omega' }, t '\\omega', { condition = tsutils.in_mathzone }),
  autosnippet({ trig = ';O', name = 'Greek Omega' }, t '\\Omega', { condition = tsutils.in_mathzone }),
}
