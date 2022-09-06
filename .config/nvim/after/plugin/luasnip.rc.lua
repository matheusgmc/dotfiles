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

local function name_usecase() 
  return vim.fn.expand("%:t"):match("[%a-]*"):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end):gsub("-",""):gsub("case","Case") 
end

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
      func(function()return vim.fn.expand("%:t"):find(".js") and "class " or "export class " end,{}),
      func(name_usecase,{}),
      text({"{","constructor(){}","async execute(){","}","}",""}),
      func(function()return vim.fn.expand("%:t"):find(".js") and {"module.export = "..name_usecase()}or "" end,{}),
      
    }),
  snip({
    trig = "entity",
    namr = "entity",
    dscr = "cria uma entidade",
  },{
      func(function()return vim.fn.expand("%:t"):find(".js") and "class " or "export class " end,{}),
      func(function()return vim.fn.expand("%:t"):match("%a*"):gsub("^%l",string.upper)end,{}),
      text({
        "{",
        "constructor(props){}",
        "static create(){}",
        "}"
      }),
    })
})
extend_snip("typescript",{"javascript"})

add_snip("typescript",{
  snip({
    trig = "dto",
    namr = "DTO",
    dscr = "estrutura base da interface para dto"
  },{
      text("export interface "),
      func(function() return "I"..vim.fn.expand("%:t"):match("[%a-]*"):gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end):gsub("Dto","RequestDTO"):gsub("-","") end,{}),
      text("{}"),
    })
})
