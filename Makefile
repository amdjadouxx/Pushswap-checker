##
## EPITECH PROJECT, 2024
## 
## File description:
## Makefile
##

GHC	=	ghc

SRC	=	$(shell find . -name '*.hs')

NAME	=	pushswap_checker

all:	$(NAME)

$(NAME):
	$(GHC) -o $(NAME) $(SRC)

clean:
	rm -f *.o
	rm -f *.hi

fclean:	clean
	rm -f $(NAME)

re:	fclean all
