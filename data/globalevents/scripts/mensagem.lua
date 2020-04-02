function onThink(interval, lastExecution)

MENSAGEM = {
"Para mais informações sobre Quest's e Sistemas acesse: https://trello.com/b/JsUk0DO8/pokémasterx",
"Mantenha sempre 5 espaços livres em sua backpack, não nos responsabilizamos por perdas!",
"Nenhum membro da equipe irá pedir seus dados de acesso, à segurança de conta é sua responsabilidade.",
"Curta nossa pagina no facebook e fique ligado nas noticias, facebook.com/pokemonxmaster",
"Seja um doador e colabore para que o servidor possa evoluir cada vez mais!"
}

	doBroadcastMessage(MENSAGEM[math.random(1,#MENSAGEM)], 22)
	
	return true
end