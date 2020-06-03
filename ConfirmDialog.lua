-- namespace
local _, ns = ...;

local CONFIRM_DIALOG = "ConfirmDialog"

---
-- The static ConfirmDialog is a pop-up window that can be opened to prompt the
-- user with a message dialog that can contain a question and has two buttons
-- [yes, no] to respond to.
-- 
-- The dialog will be opened using ConfirmDialog.open(text, action), where the
-- text will be displayed in the dialog and the action represents a function that
-- will be called wit the user choice [true - on accept, false - on cancel].
-- 
local ConfirmDialog = {
    dialog = {
        text = "%s",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function(self, action) return action(true) end,
        OnCancel = function(self, action) return action(false) end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        showAlert = true,
        exclusive = true,
        preferredIndex = 3,  -- avoid some UI taint
        cancels = CONFIRM_DIALOG
    }
}
ConfirmDialog.__index = ConfirmDialog
ns.ConfirmDialog = ConfirmDialog
-- register the dialog in the static global array
StaticPopupDialogs[CONFIRM_DIALOG] = ConfirmDialog.dialog

---
-- Opens the ConfirmDialog with the given message text and the given function
-- that will be invoked with the user choice [true, false].
-- 
-- @param #string text
--          the message text of the dialog
-- @param #function action
--          the function that will be invoked with the user choice
-- 
ConfirmDialog.open = function(text, action)
    local frame = StaticPopup_Show(CONFIRM_DIALOG, text)
    if (frame) then
        ConfirmDialog.dialog.frame = frame
        frame.data = action
    end
end

---
-- Closes the ConfirmDialog.
-- 
ConfirmDialog.close = function()
    StaticPopup_Hide(CONFIRM_DIALOG)
end

---
-- Indicates whether the ConfirmDialog is currently shown.
--
-- @return #boolean
--          true if the dialog is currently shown, false otherwise
--
ConfirmDialog.isShown = function()
    local frame = ConfirmDialog.dialog.frame
    if (frame) then
    	return frame:IsShown()
    else
        return false
    end
end
