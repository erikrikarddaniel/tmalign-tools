DIFF = grep -v "^[ ]*$$" $@.out | diff $@.expect -

CHECK = if [ ` $(DIFF) | wc -l ` -eq 0 ]; then echo "*** $@ OK ***"; else echo "*** $@ FAILED ***"; echo "Here's a diff: "; $(DIFF); exit 1; fi

SIZE_CHECK = if [ ` stat -c "%s" $@.out ` -eq ` stat -c "%s" $@.expect ` ]; then echo "*** $@ OK ***"; else echo "*** $@ FAILED ($@.out and $@.expect different sizes) ***"; exit 1; fi

GREP_CHECK = pattern=`cat $@.expect`; if [ `grep "$$pattern" $@.out | wc -l` -gt 0 ]; then echo "*** $@ OK ***"; else echo "*** $@ FAILED ***"; echo "Didn't find $$pattern in output"; exit 1; fi

XML_CHECK =

all: tmalign2matrix

clean:
	@rm -rf *.out *.tmp err 

tmalign2matrix: tmalign2matrix.00 tmalign2matrix.01 tmalign2matrix.02

tmalign2matrix.00:
	@../scripts/tmalign2matrix --transform=minus *.tmalign > $@.out
	@$(CHECK)

tmalign2matrix.01:
	@../scripts/tmalign2matrix --transform=inverse *.tmalign > $@.out
	@$(CHECK)

tmalign2matrix.02:
	@../scripts/tmalign2matrix --score=mean --transform=minus *.tmalign > $@.out
	@$(CHECK)
