# ---------- Makefile for simplesync ----------

CC      := gcc
CFLAGS  := -O2 -Wall -pthread
SRC     := simplesync.c

# Build both variants with one command:  make            (default target)
# Or individually:                        make atomic    /   make mutex

.PHONY: all atomic mutex clean

all: atomic mutex                      # default target runs both

atomic: simplesync-atomic.exe
mutex : simplesync-mutex.exe

simplesync-atomic.exe: $(SRC)
	$(CC) $(CFLAGS) -DSYNC_ATOMIC $< -o $@

simplesync-mutex.exe:  $(SRC)
	$(CC) $(CFLAGS) -DSYNC_MUTEX  $< -o $@

clean:                                 # remove build products
	$(RM) simplesync-atomic.exe simplesync-mutex.exe
