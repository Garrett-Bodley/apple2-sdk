CC=cl65
AC=aplc
C2T=c2t

START_ADDRESS=2000

CFLAGS= -O -t apple2 --start-addr 0x$(START_ADDRESS) -Wl -D__EXEHDR__=0

SRC_DIR=src
OBJ_DIR=obj
BIN_DIR=bin

DISK_IMAGE=lib/TEMPLATE.dsk

TARGET=$(BIN_DIR)/main

all: target wav aif disk

target: $(TARGET)

wav: $(TARGET).wav

aif: $(TARGET).aif

disk: $(TARGET).dsk

install:
	scripts/install

uninstall:
	scripts/uninstall

SOURCES:=$(wildcard $(SRC_DIR)/*.c)
OBJECTS=$(SOURCES:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

# Rule to make object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c -o $@ $<

# Rule to make target
$(TARGET): $(OBJECTS) | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# Generate .wav file using c2t
$(TARGET).wav: $(TARGET)
	$(C2T) -bc8 $(TARGET),$(START_ADDRESS) $(TARGET).wav

# Generate .aif file using c2t
$(TARGET).aif: $(TARGET)
	$(C2T) -bc8 $(TARGET),$(START_ADDRESS) $(TARGET).aif

# Generate disk image using AppleCommander
$(TARGET).dsk: $(TARGET)
	cp $(DISK_IMAGE) $(TARGET).dsk
	aplc -p $(TARGET).dsk main.system sys 0x$(START_ADDRESS) < $(TARGET)

# Rule to make directories
$(SRC_DIR) $(BIN_DIR) $(OBJ_DIR):
	mkdir -p $@

clean:
	@[ -n "${OBJ_DIR}" ] || { echo "OBJ_DIR unset or null"; exit 127; }
	@[ -n "${BIN_DIR}" ] || { echo "BIN_DIR unset or null"; exit 127; }
	rm -rf $(BIN_DIR) $(OBJ_DIR)

.PHONY: all target wav aif disk clean dir init uninstall