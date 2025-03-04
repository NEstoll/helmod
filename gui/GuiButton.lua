-------------------------------------------------------------------------------
---Class to help to build GuiButton
---@class GuiButton
GuiButton = newclass(GuiElement,function(base,...)
  GuiElement.init(base,...)
  base.classname = "HMGuiButton"
  base.options.type = "button"
  base.options.style = "helmod_button_default"
end)

-------------------------------------------------------------------------------
---Set Sprite
---@param type string
---@param name string
---@param hovered string
---@return GuiButton
function GuiButton:sprite(type, name, hovered)
  self.options.type = "sprite-button"
  self.is_caption = false
  if type == "menu" then
    self.options.sprite = GuiElement.getSprite(name)
    if hovered then
      self.options.hovered_sprite = GuiElement.getSprite(hovered)
    end
  elseif type == "energy" and (name == "energy" or name == "steam-heat") then
    self.options.sprite = GuiElement.getSprite(string.format("%s-white", name))
    if hovered then
      self.options.hovered_sprite = GuiElement.getSprite(hovered)
    end
    table.insert(self.name, name)
  else
    self.options.sprite = GuiElement.getSprite(type, name)
    if hovered then
      self.options.hovered_sprite = GuiElement.getSprite(type, hovered)
    end
    table.insert(self.name, name)
  end
  return self
end

-------------------------------------------------------------------------------
---Set option
---@param name string
---@param value any
---@return GuiButton
function GuiButton:option(name, value)
  self.options[name] = value
end

-------------------------------------------------------------------------------
---Set index
---@param index number
---@return GuiButton
function GuiButton:index(index)
  self.m_index = index
  table.insert(self.name, index)
  return self
end

-------------------------------------------------------------------------------
---Set index
---@param value number
---@return GuiButton
function GuiButton:number(value)
  self.options.number = value
  return self
end

-------------------------------------------------------------------------------
---Set Choose button style
---@param type string
---@param name string
---@return GuiButton
function GuiButton:choose(type, name)
  self.options.type = "choose-elem-button"
  --self.options.style = "slot_button"
  if type ==  "recipe-burnt" then type = "recipe" end
  if type ==  "resource" then type = "entity" end
  if type ==  "rocket" then type = "item" end
  self.options.elem_type = type
  self.options[type] = name
  table.insert(self.name, name)
  return self
end

-------------------------------------------------------------------------------
---Get options
---@return table
function GuiButton:onErrorOptions()
  local options = self:getOptions()
  options.style = "helmod_button_default"
  options.type = "button"
  if (type(options.caption) == "boolean") then
    Logging:error(self.classname, "addGuiButton - caption is a boolean")
  elseif self.m_caption ~= nil then
    options.caption = self.m_caption
  else
    options.caption = options.key
  end
  return options
end

-------------------------------------------------------------------------------
---@class GuiButtonSprite
GuiButtonSprite = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_icon"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSprite
GuiButtonSelectSprite = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_select_icon"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSprite
function GuiButtonSelectSprite:color(color)
  local style = "helmod_button_select_icon"
  if color == "red" then style = "helmod_button_select_icon_red" end
  if color == "yellow" then style = "helmod_button_select_icon_yellow" end
  if color == "green" then style = "helmod_button_select_icon_green" end
  if color == "flat" then style = "helmod_button_select_icon_flat" end
  self.options.style = style
  return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteM
GuiButtonSpriteM = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_icon_m"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteM
GuiButtonSelectSpriteM = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_select_icon_m"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteM
function GuiButtonSelectSpriteM:color(color)
  local style = "helmod_button_select_icon_m"
  if color == "red" then style = "helmod_button_select_icon_m_red" end
  if color == "yellow" then style = "helmod_button_select_icon_m_yellow" end
  if color == "green" then style = "helmod_button_select_icon_m_green" end
  if color == "flat" then style = "helmod_button_select_icon_m_flat" end
  self.options.style = style
  return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteSm
GuiButtonSpriteSm = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_icon_sm"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteSm
GuiButtonSelectSpriteSm = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_select_icon_sm"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteSm
function GuiButtonSelectSpriteSm:color(color)
  local style = "helmod_button_select_icon_sm"
  if color == "red" then style = "helmod_button_select_icon_sm_red" end
  if color == "yellow" then style = "helmod_button_select_icon_sm_yellow" end
  if color == "green" then style = "helmod_button_select_icon_sm_green" end
  if color == "flat" then style = "helmod_button_select_icon_sm_flat" end
  self.options.style = style
  return self
end

-------------------------------------------------------------------------------
---@class GuiButtonSpriteXxl
GuiButtonSpriteXxl = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_icon_xxl"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---@class GuiButtonSelectSpriteXxl
GuiButtonSelectSpriteXxl = newclass(GuiButton,function(base,...)
  GuiButton.init(base,...)
  base.options.style = "helmod_button_select_icon_xxl"
  base.is_caption = false
end)

-------------------------------------------------------------------------------
---Set color
---@param color string
---@return GuiButtonSelectSpriteXxl
function GuiButtonSelectSpriteXxl:color(color)
  local style = "helmod_button_select_icon_xxl"
  if color == "red" then style = "helmod_button_select_icon_xxl_red" end
  if color == "yellow" then style = "helmod_button_select_icon_xxl_yellow" end
  if color == "green" then style = "helmod_button_select_icon_xxl_green" end
  self.options.style = style
  return self
end