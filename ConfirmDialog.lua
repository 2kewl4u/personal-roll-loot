-- namespace
local _, ns = ...;

local CONFIRM_DIALOG = "ConfirmDialog"

local ConfirmDialog = {
    dialog = {
        text = "%s",
        button1 = "Yes",
        button2 = "No",
        OnAccept = function(self, action) action(true) end,
        OnCancel = function(self, action) action(false) end,
        timeout = 0,
        whileDead = true,
        hideOnEscape = true,
        showAlert = true,
        exclusive = true,
        preferredIndex = 3,  -- avoid some UI taint
    }
}
ConfirmDialog.__index = ConfirmDialog
ns.ConfirmDialog = ConfirmDialog


StaticPopupDialogs[CONFIRM_DIALOG] = ConfirmDialog.dialog

function ConfirmDialog:open(itemName, action)
    local dialog = StaticPopup_Show(CONFIRM_DIALOG, itemName)
    if (dialog) then
        dialog.data = action
    end
end

function ConfirmDialog:close()
    StaticPopup_Hide(CONFIRM_DIALOG)
end
