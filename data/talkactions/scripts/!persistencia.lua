function onSay(cid, words, param, channel)

doPlayerSendTextMessage(cid, 20, [[
    Persistence Catch System
* Cada pokemon possui uma "m�dia" de balls para ser capturado. Quando voc� ultrapassa essa m�dia, a persist�ncia � ativada, fazendo com que a chance de capturar aquele pokemon v� melhorando para cada nova ball jogada nele at� um limite m�ximo desse b�nus de captura.
* TODOS pokemons, EXCETO OS SHINYS, participam do sistema de persist�ncia, por�m, somente pokemons com m�dia acima de 50 ultra balls notificam o player atrav�s de uma mensagem quando a persist�ncia � ativada.
* A m�dia de balls � feita atrav�s da chance da Ultra Ball, um exemplo: Se a m�dia de um pokemon � de 30 ultra balls e voc� estiver tentando captura-lo com great ball � claro que voc� ir� gastar muito mais do que 30 balls pois a rate da great ball � muito menor. O mesmo se aplica ao contr�rio, caso a m�dia de um dugtrio seja 30 ub e voc� est� utilizando magu ball, voc� gastar� menos de 30 balls nele (isso teoricamente, pensando na maioria de acordo com a m�dia), caso ultrapasse a m�dia, a persist�ncia ser� ativada.
* N�o s�o todas as balls que contam para ativar a persist�ncia e nem melhora-la, somente a Ultra Ball e balls superiores como as novas(magu, tinker, etc) contam para o sistema de persist�ncia e a contagem dessas balls varia de acordo com sua rate, 10 magu balls aumentam mais a chance de catch pela persist�ncia do que 10 ultra balls, isso caso sejam utilizadas corretamente em pokemons do type da ball, no caso fire/ground.
* A Saffari Ball tamb�m conta para o sistema de persist�ncia, por�m, s� funciona dentro do Saffari Zone, e, o b�nus dela � menor do que o da ultra ball e outras balls superiores. Caso n�o saiba como funcionam as novas balls, para mais informa��es, diga !balls]])

      
	return true
end
