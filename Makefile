all: antlr cjava test

antlr:
	antlr4 ElConcatenator.g4

cjava:
	javac *.java

test:
	cat test.txt | grun ElConcatenator prog


clean:
	rm -f *.class *java *tokens
