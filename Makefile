CC ?= gcc
CFLAGS ?=
TARGET = bin/hello

all : check-env $(TARGET)
.PHONY : all

check-env :
	script/check_env.sh
.PHONY : check-env

$(TARGET):
	$(CC) $(CFLAGS) -o $@ src/main.c

clean :
	rm -rf src/*.o $(TARGET)
.PHONY : clean

test : all
	file $(TARGET)
	ls -l $(TARGET)
	$(TARGET)
.PHONY : test
