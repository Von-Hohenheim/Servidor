function onSay(cid, words, param, channel)

doPlayerSendTextMessage(cid, 20, [[
    Persistence Catch System
* Cada pokemon possui uma "média" de balls para ser capturado. Quando você ultrapassa essa média, a persistência é ativada, fazendo com que a chance de capturar aquele pokemon vá melhorando para cada nova ball jogada nele até um limite máximo desse bônus de captura.
* TODOS pokemons, EXCETO OS SHINYS, participam do sistema de persistência, porém, somente pokemons com média acima de 50 ultra balls notificam o player através de uma mensagem quando a persistência é ativada.
* A média de balls é feita através da chance da Ultra Ball, um exemplo: Se a média de um pokemon é de 30 ultra balls e você estiver tentando captura-lo com great ball é claro que você irá gastar muito mais do que 30 balls pois a rate da great ball é muito menor. O mesmo se aplica ao contrário, caso a média de um dugtrio seja 30 ub e você está utilizando magu ball, você gastará menos de 30 balls nele (isso teoricamente, pensando na maioria de acordo com a média), caso ultrapasse a média, a persistência será ativada.
* Não são todas as balls que contam para ativar a persistência e nem melhora-la, somente a Ultra Ball e balls superiores como as novas(magu, tinker, etc) contam para o sistema de persistência e a contagem dessas balls varia de acordo com sua rate, 10 magu balls aumentam mais a chance de catch pela persistência do que 10 ultra balls, isso caso sejam utilizadas corretamente em pokemons do type da ball, no caso fire/ground.
* A Saffari Ball também conta para o sistema de persistência, porém, só funciona dentro do Saffari Zone, e, o bônus dela é menor do que o da ultra ball e outras balls superiores. Caso não saiba como funcionam as novas balls, para mais informações, diga !balls]])

      
	return true
end
