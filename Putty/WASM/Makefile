
# Tools
CC=emcc
CFLAGS=-fPIC -fpermissive -Wall -O2 -s SAFE_HEAP=1 -s ALLOW_MEMORY_GROWTH=1

TARGET=../bin/wasm/Release/libPuttyDLL.bc/3.1.28/st/libPuttyDLL.bc

OBJECTS=callback.o config.o export.o minibidi.o misc.o terminal.o tree234.o version.o wildcard.o

all: $(TARGET)

%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) -r -o $@ $^

clean:
	rm -f $(TARGET) *.o
