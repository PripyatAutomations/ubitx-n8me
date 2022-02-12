distclean: clean
	${RM} -r bin *.hex
	${RM} *~ include/*~
	${RM} ${extra_clean}
