ifeq ("${THEME}", "")
#echo "* Theme set to default 'night'. Edit board.mk and set it."
THEME=night
endif

ifneq ("$(wildcard themes/${THEME}.h)", "")
color_theme.h:
	@echo "* Applying theme ${THEME} to your build"
	${RM} color_theme.h
	ln -s themes/${THEME}.h color_theme.h
endif

include/board.h:
	${LN} -s boards/${RADIO_TYPE}.h include/board.h

#extra_clean += include/board.h owner.h color_theme.h

owner.h:
	@echo "Please copy Doc/owner.h to the currenty directory, edit it and try again!"
