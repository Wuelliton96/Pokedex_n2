# quizpokemonn2

Baseado nas aplicações de quiz que implementamos no início do semestre e pokedex, recentemente implementada, Você deve implementar um quiz de pokemons.

## Especificações:
    A tela deve mostrar a imagem de um pokemon e quatro botões com nomes de pokemons aleatórios. Um deles corresponde à imagem mostrada
    Aproximadamente metade da tela deve ser ocupada pela imagem, a outra metade pelos 4 botões. Use a imagem anexa como referência
    Os botões devem estar separados entre si (com uma margem entre eles)
    Se o usuário escolher o nome correto, deve receber uma mensagem de acerto, ou mensagem de erro, caso contrário. 
    Você deve contar quantos acertos o usuário teve.
    O jogo deve terminar depois de 10 pokemons.
    Para a lista de pokemons, utilize a pokeapi, consultada pela pokedex.
## O funcionamento do jogo:
Peque uma lista dos 150 primeiros pokemons da pokeapi.
Obtenha um pokemon aleatório, dentro dessa lista. Armazene-o
A imagem deste pokemon deve ser mostrada na tela
O nome deste pokemon deve ser atribuído, aleatoriamente, a um dos 4 botões.
Os outros nomes devem ser preenchidos com nomes de pokemons, obtidos aleatoriamente da mesma lista
Lembre-se de que não podem ter nomes repetidos nos quatro botões
Após o usuário clicar em um dos botões, verifique se a resposta foi correta e volte ao passo 2
Após 10 palpites, termine o jogo e mostre o resultado para o usuário.

!!!