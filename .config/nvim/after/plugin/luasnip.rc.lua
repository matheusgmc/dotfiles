local status, ls = pcall(require,"luasnip")

if(not status) then return end

local add_snip = ls.add_snippets
local extend_snip = ls.filetype_extend

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

add_snip(nil,{
  all ={
    snip({
      trig = "date",
      namr = "Date",
      dscr = "retorna uma data no formato: DD-MM-YYYY",
    },{
        func(function() return {os.date('%d-%m-%Y')} end,{})
      })
  },
})

-- Snippets Javascript/Typescript
add_snip("javascript",{
  snip({
      trig = "ternary",
      namr = "Ternary",
      dscr = 'estrutura de um ternário simples',
    },{
      insert(1,"condition"),
      text(" ? "),
      insert(2,"then"),
      text(" : "),
      insert(3,"else"),
      }),
  snip({
   trig = "usecase",
   namr = "UseCase",
   dscr = "cria uma estrutura simples para casos de uso.",
    },{
      text("export class "),
      func(
        function() return 
          vim.fn.expand("%:t"):match("[%a-]*"):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end):gsub("-","")
         end,{}),
      text({"{","constructor(){}","async execute(){","}","}"})
    })
})

extend_snip("typescript",{"javascript"})
