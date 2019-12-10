-- namespace
local _, ns = ...;

local ConfirmItemRemovalDialog = {
    dialog = {
        text = "Do you really want to permanently remove %s from your need list?",
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
ConfirmItemRemovalDialog.__index = ConfirmItemRemovalDialog
ns.ConfirmItemRemovalDialog = ConfirmItemRemovalDialog


StaticPopupDialogs["ConfirmItemRemovalDialog"] = ConfirmItemRemovalDialog.dialog

function ConfirmItemRemovalDialog:open(itemName, action)
    local dialog = StaticPopup_Show("ConfirmItemRemovalDialog", itemName)
    if (dialog) then
        dialog.data = action
    end
end

function ConfirmItemRemovalDialog:close()
    StaticPopup_Hide("ConfirmItemRemovalDialog")
end
