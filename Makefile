# vim:ft=make:ts=8:sts=8:sw=8:noet:tw=80:nowrap:list

LIST="images.list.txt"

###
### tasks
###
.PHONY: show pull imgs clean

all: help

help:
	@echo "    make show  - show current list of base images"
	@echo "    make pull  - pull listed base images"
	@echo "    make imgs  - Run 'docker images'"
	@echo "    make clean - Cleanup: TODO..."
	@echo

show:
	@more ${LIST}

pull:
	egrep -v "^#|^$$" ${LIST} \
	| awk '{print "docker pull " $$1":"$$2}' \
	| bash -x

imgs:
	docker images

clean:
	@echo "Todo..."

