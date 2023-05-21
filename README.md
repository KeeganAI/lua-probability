# lua-Probabity

### ENG
This is "just" a weighted random selection algorithm. 
Choose a prize from a list based on the probability awarded to each, the higher the probability of the prize, the more likely it will be chosen.

### ITA
E' "semplicemente" un algoritmo di selezione casuale ponderato.
Scegli un premio da un elenco in base alla probabilità assegnata a ciascuno, più alta è la probabilità del premio, più probabile sarà che verrà scelto.

## Why?

### ENG
Working on a script for a luckywheel, and wanting to remove the prize winnings in "hardcoded", I wanted to do everything user-friendly and done in a decent way.
So, the goal was to let those who have the script choose the probability that a prize will come out rather than another.
Then I came across a little problem....
##
If a prize has a probability of 0.2 (20%), it means that, in theory, it will be chosen 20% of the time. 
Similarly, a prize with a probability of 0.01 (1%) will be chosen only 1% of the time.

(It’s important to note that these are just theoretical odds.)

In practice, because of randomness, the actual results may not exactly match what you think, especially if the number of attempts is relatively small. (> 100)

It is important that the sum of the odds of all prizes is exactly 1 (100%). 
The problem that might arise is, if no prize is selected while performing the function 
(for example, if the randomly generated number is greater than the sum of probabilities)
the alternatives would be (that I came up with): fix the "gap" created, or should be awarded a default award.

I preferred to use "statistical normalization". 
> In mathematics, normalization is the process of dividing all terms of an expression by the same factor so that the resulting expression has a certain norm equal to 1.

-- I could have done something simpler? most likely yes!

# How it works:

**Function "normalizeRawProbabilities"**
This function takes as input a table of rewards and the total raw probabilities. 
It checks if the total raw probabilities is zero, in which case it throws an error (because you can't divide by zero and a zero total suggests there are no rewards to give). Otherwise, for each reward, it calculates the normalized probability by dividing the reward's raw probability by the total raw probabilities. 
This way, the sum of all normalized probabilities will be exactly 1.

**Function "givePrize"**
This function is responsible for choosing and awarding a reward. 
It generates a random number between 0 and 1 and then walks through the reward table, summing the normalized probabilities until it reaches a value that is greater or equal to the randomly generated number. At that point, it awards that reward to the player.

The reward selection in givePrize works because the normalized probabilities sum to 1. If the randomly generated number is, say, 0.7, then the code keeps summing probabilities until it exceeds 0.7. 
Because the probabilities are normalized, the chance of picking a given reward matches its normalized probability. 
If a reward has a normalized probability of 0.2, then there's a 20% chance the random number will be below 0.2, which corresponds to the chance of that reward being picked.

### ITA
Lavorando ad uno script per una ruota della fortuna, e volendo rimuovere la vincita dei premi in "hardcoded" ho voluto fare tutto user-friendly e fatto in maniera decente.
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

# Come funziona:

**Funzione "normalizeRawProbabilities"**
Questa funzione prende in input una tabella di premi e il totale delle probabilità "raw". Controlla se il totale delle probabilità "raw" è zero, nel qual caso genera un errore (non si può dividere per zero, e un totale a zero risulterà l'assenza di premi da dare). 
Altrimenti, per ogni premio, calcola la probabilità normalizzata, dividendo la probabilità "raw" del premio per il totale delle probabilità "raw". 
**In questo modo, la somma di tutte le probabilità normalizzate sarà esattamente 1.**

**Funzione "givePrize"**
Questa funzione è gestisce la scelta e l'assegnazione di un premio. 
Genera un numero casuale tra 0 e 1 e poi scorre la tabella dei premi, sommando le probabilità normalizzate finché non raggiunge un valore che è maggiore o uguale al numero generato casualmente. 
In quel momento, assegna quel premio al giocatore.

La scelta del premio in givePrize funziona perché le probabilità normalizzate sommano a 1. 
Se il numero generato casualmente è (per esempio) 0.7, allora la funzione continua a sommare le probabilità, finché non supera 0.7.
Visto che le probabilità sono normalizzate, la probabilità di scegliere un dato premio corrisponde alla sua probabilità normalizzata.
Se un premio ha una probabilità normalizzata di 0.2, allora c'è una probabilità del 20% che il numero casuale sia inferiore a 0.2, 
che corrisponde alla probabilità che quel premio venga scelto.

## Installation

I made it for fivem, but I think you can use it anywhere (with the appropriate changes)

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Credits
* [pyerino/KorSetta](https://github.com/pyerino) idk, just for mental effort support
