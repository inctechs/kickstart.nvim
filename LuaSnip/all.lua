return {
  -- Example: how to set snippet parameters
  require('luasnip').snippet(
    { -- Table 1: snippet parameters
      trig = 'hi',
      dscr = "An autotriggering snippet that expands 'hi' into 'Hello, world!'",
      regTrig = false,
      priority = 100,
    },
    { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
      t 'Hello, world!', -- A single text node
    }
    -- Table 3, the advanced snippet options, is left blank.
  ),
}
