# Pushswap-checker


## Description
Le pushswap_checker est un outil conçu pour vérifier la validité de la séquence de commandes utilisée pour trier une pile à l'aide d'un programme pushswap. Ce programme est généralement un projet réalisé dans le cadre du cursus d'études à Epitech.

## Utilisation
1. **Compilation :**
   - Assurez-vous d'avoir le programme pushswap_checker compilé. Si ce n'est pas le cas, compilez-le à l'aide de la commande:
     ```bash
     make
     ```

2. **Vérification avec le Checker :**
    - Exécutez le programme pushswap_checker avec une séquence de nombres en entrée et des instructions. Par exemple :
     ```bash
     echo "ra ra" | ./pushswap_checker 4 2 7 1
     ```
   - Le checker affichera "OK" si la séquence est valide, sinon il affichera "KO".

## Opérations de Tri possibles
- **sa**: Échange les deux premiers éléments de la pile A.
- **sb**: Échange les deux premiers éléments de la pile B.
- **sc**: Équivalent à effectuer "sa" suivi de "sb".
- **pa**: Prend le premier élément de la pile B et l'ajoute au début de la pile A.
- **pb**: Prend le premier élément de la pile A et l'ajoute au début de la pile B.
- **ra**: Effectue une rotation vers le début de la pile A (déplace le premier élément à la fin).
- **rb**: Effectue une rotation vers le début de la pile B (déplace le premier élément à la fin).
- **rr**: Équivalent à effectuer "ra" suivi de "rb".
- **rra**: Effectue une rotation vers la fin de la pile A (déplace le dernier élément au début).
- **rrb**: Effectue une rotation vers la fin de la pile B (déplace le dernier élément au début).
- **rrr**: Équivalent à effectuer "rra" suivi de "rrb".
