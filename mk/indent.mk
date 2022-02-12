indent_opts := -as -bap -bbb -bc -br -brf -brs -c50
indent_opts += -cd0 -cdw -ce -ci4 -cli3 -cp20
indent_opts += -d3 -dj -fnc -hnl -i3 -il3 -l90 -lc90 -lp
indent_opts += -nbad -nbbo -nbc -ncs -npcs -nprs -npsl
indent_opts += -saf -sai -nsaw -sc -sob -nss
indent_opts += -nut -par -sbi1 -slc
indent_opts += -ts3

indent:
	@for i in *.cc include/*.h; do \
		indent ${indent_opts} $$i; \
	done
