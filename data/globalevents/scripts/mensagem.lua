function onThink(interval, lastExecution)

MENSAGEM = {
"Para mais informa��es sobre Quest's e Sistemas acesse: https://trello.com/b/JsUk0DO8/pok�masterx",
"Mantenha sempre 5 espa�os livres em sua backpack, n�o nos responsabilizamos por perdas!",
"Nenhum membro da equipe ir� pedir seus dados de acesso, � seguran�a de conta � sua responsabilidade.",
"Curta nossa pagina no facebook e fique ligado nas noticias, facebook.com/pokemonxmaster",
"Seja um doador e colabore para que o servidor possa evoluir cada vez mais!"
}

	doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)], 22)
	
	return true
end