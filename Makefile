.PHONY : help
help :
	echo usage: make [tool]
	echo available tools: iupred

.PHONY : iupred
iupred : bin/iupred/iupred
bin/iupred/iupred :
	$(MAKE) -C bin/iupred GPP=$(CC)

