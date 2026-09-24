# Nombre del ejecutable final
PROGRAMA := scanner2

# Compilador
CC := gcc

# Regla principal
all: $(PROGRAMA)

# Regla para construir el scanner
# Dependencias: scanner2.l (Flex genera lex.yy.c a partir de él)
# Regla para construir el scanner
$(PROGRAMA): scanner2.l
	flex scanner2.l
	$(CC) lex.yy.c -o $(PROGRAMA)


# Regla para limpiar archivos generados
clean:
	rm -f $(PROGRAMA) $(PROGRAMA).exe lex.yy.c

.PHONY: all clean