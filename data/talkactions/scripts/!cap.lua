function onSay(cid, words, param)

doPlayerSetMaxCapacity(cid, 5000)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Pronto. Caso não tenha resolvido, relogue e tente novamente.")
return true
end 