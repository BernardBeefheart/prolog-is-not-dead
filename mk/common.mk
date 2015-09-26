# ======================================================================
# common.mk
# ======================================================================

PL = swipl
OPTIONS =  --goal=main --stand_alone=true -O

# EXE est déjà défini
# SOURCES aussi

all: $(EXE)

$(EXE): $(SOURCES)
	$(PL) $(OPTIONS) -o $@ -c $(SOURCES)

clean:
	$(RM) -fv $(EXE)

.PHONY: all clean
