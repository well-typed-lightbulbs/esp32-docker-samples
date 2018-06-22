#
# "main" pseudo-component makefile.
#
# (Uses default behaviour of compiling all source files in directory, adding 'include' to include path.)
COMPONENT_SRCDIRS := .


c_startup.o: $(COMPONENT_PATH)/startup.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(addprefix -I ,$(COMPONENT_INCLUDES)) $(addprefix -I ,$(COMPONENT_EXTRA_INCLUDES)) -c $< -o $@

startup.o: c_startup.o $(COMPONENT_PATH)/main.o
	$(LD) -r c_startup.o $(COMPONENT_PATH)/main.o -o $@
	
.PHONY: build
build: startup.o