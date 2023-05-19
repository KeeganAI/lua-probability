# lua-Probabity

### ENG
This is "just" a weighted random selection algorithm. 
Choose a prize from a list based on the probability awarded to each, with higher probability prizes that are more likely to be selected.

### ITA
E' "semplicemente" un algoritmo di selezione casuale ponderato.
Sceglie un premio da un elenco in base alla probabilità assegnata a ciascuno, con più probabilità che i premi siano selezionati.

## Why?

### ENG
Working on a script for a wheel of fortune, and wanting to remove the prize winnings in "hardcoded" I wanted to do everything user-friendly and done in a decent way.
So, the goal was to let those who have the script choose the probability that a prize will come out rather than another.
Then I came across a little problem....
##
If a prize has a probability of 0.2 (20%), it means that, in theory, it will be chosen 20% of the time. 
Similarly, a prize with a probability of 0.01 (or 1%) will be chosen only 1% of the time.

(It’s important to note that these are just theoretical odds.)

In practice, because of randomness, the actual results may not exactly match what you think, especially if the number of attempts is relatively small. (> 100)

It is important that the sum of the odds of all prizes is exactly 1 (100%). 
The problem that might arise is, if no prize is selected while performing the function 
(for example, if the randomly generated number is greater than the sum of probabilities)
the alternatives would be (that I came up with): fix the "gap" created, or should be awarded a default award.

I preferred to use "statistical normalization". 
> In mathematics, normalization is the process of dividing all terms of an expression by the same factor so that the resulting expression has a certain norm equal to 1.

-- I could have done something simpler? most likely yes!

# Here's what happens in detail:

The givePrize function generates a random number, roll, between 0 and 1.
Then iterates through each prize in the Prizes array.
For each prize, it adds that prize's normalized probability to cumulativeProbability.
It checks if roll is less than or equal to cumulativeProbability.
If roll is less than or equal to cumulativeProbability, it means that prize has been chosen. The corresponding give function is called, and the givePrize function is exited.
If roll is greater than cumulativeProbability, it means that prize has not been chosen. The code moves on to the next prize in the list.
This process continues until a prize is selected. Because the normalized probabilities sum to 1, 
a prize is guaranteed to be selected every time givePrize is called, as long as there is at least one prize in the Prizes array.

The effect of this algorithm is that prizes with higher normalized probabilities are more likely to be chosen than those with lower normalized probabilities. 
This is because the range of random numbers for which they will be selected is larger.


### ITA
Lavorando ad unno script per una ruota della fortuna, e volendo rimuovere la vincita dei premi in "hardcoded" ho voluto fare tutto user-friendly e fatto in maniera decente.
Quindi, l'obiettivo era di far scegliere a chi ha in mano lo script, la probabilità che esca un premio piuttosto che un altro.
Successivamente mi sono imbattuto su un problemino....
##
Se un premio ha una probabilità di 0.2 (20%), significa che, in teoria, verrà scelto il 20% delle volte. 
Allo stesso modo, un premio con una probabilità di 0.01 (o 1%) verrà scelto solo l'1% delle volte.

(E' importante notare che queste sono solo probabilità teoriche.)

Nella pratica, a causa della casualità, i risultati effettivi potrebbero non corrispondere esattamente a quello che si pensa, soprattutto se il numero di tentativi è relativamente piccolo. (> 100)

E' importante che la somma delle probabilità di tutti i premi sia esattamente 1 (100%). 
Il problema che potrebbe sorgere è, se nessun premio viene selezionato durante l'esecuzione della funzione 
(ad esempio, se il numero generato casualmente è maggiore della somma delle probabilità)
le alternative sarebbero (che mi sono venute in mente): sistemare il "gap" creato, oppure dovrebbe essere assegnato un premio di default.

Ho preferito usare la  "normalizzazione statistica". 
> In matematica per normalizzazione si intende il procedimento di dividere tutti i termini di un'espressione per uno stesso fattore in modo che l'espressione risultante abbia una certa norma uguale a 1.

-- Avrei potuto fare una cosa più semplice? molto probabilmente si!

# Quindi, per riassumere:

Genera un numero casuale tra 0 e 1.
Scorre l'elenco dei premi, accumulando la probabilità di ciascuno.
Se il numero casuale è inferiore o uguale alla probabilità cumulativa, il premio viene selezionato; altrimenti, continua a scorrere nel prossimo premio nell'elenco.

Questo processo continua fino a quando viene selezionato un premio. 
Poiché le probabilità normalizzate ammontano a 1, un premio è garantito per essere selezionato ogni volta givePrize è chiamato, 
fino a quando c'è almeno un premio nella matrice.

L'effetto di questo algoritmo è che i premi con più alte probabilità normalizzate sono più probabilità di essere scelti rispetto a quelli con minori probabilità normalizzate. 
Questo perché l'intervallo di numeri casuali per i quali saranno selezionati è più grande.

Tutto ciò, garantisce che alla fine verrà selezionato un premio, e i premi con una probabilità normalizzata maggiore hanno più possibilità di essere selezionati.


## Installation

I made it for fivem, but I think you can use it anywhere (with the appropriate changes)

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Credits
* [pyerino/KorSetta](https://github.com/pyerino) idk, just for mental effort support
