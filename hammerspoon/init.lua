-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- Hyper+key for all the below are setup somewhere
-- The handler already exists, usually in Keyboard Maestro
-- we just have to get the right keystroke sent
hyperBindings = {'f', 'y', 'm', 'o', 'b', 'i', 'p', 'u', 'h', 'j', 'k', 'l', 'TAB'}

for i,key in ipairs(hyperBindings) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
    k.triggered = true
  end)
end

-- tmux prefix
k:bind({}, 'a', nil, function() hs.eventtap.keyStroke({"ctrl"}, 'a')
  k.triggered = true
end)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
  k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)

-- vi cursor movement commands
movements = {
 { 'h', {}, 'LEFT'},
 { 'j', {}, 'DOWN'},
 { 'k', {}, 'UP'},
 { 'l', {}, 'RIGHT'},
}
for i,bnd in ipairs(movements) do
  hs.hotkey.bind({'cmd','alt','shift','ctrl'}, bnd[1], function()
    hs.eventtap.keyStroke(bnd[2],bnd[3])
  end)
end
