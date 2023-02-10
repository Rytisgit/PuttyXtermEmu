#fail, not working due to undefined reference to `_vsnprintf'
# Tools
CC=gcc
CFLAGS=-fPIC -fpermissive -Wall -D_WINDLL -D_MBCS -DDLLEXPORTS -DNDEBUG -D_WINDOWS -DPOSIX -D_CRT_SECURE_NO_WARNINGS -D_CRT_NONSTDC_NO_DEPRECATE -O2

TARGET=libPuttyDLL.dll

OBJECTS=callback.o config.o export.o minibidi.o misc.o terminal.o tree234.o version.o wildcard.o

all: $(TARGET)


%.o: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) $< -o $@

$(TARGET): $(OBJECTS)
	$(CC) -static -o $@ $^

clean:
	rm -f $(TARGET) *.o
