.PHONY: all compile test clean

REBAR = ./rebar3

all: compile

compile: rebar3
	$(REBAR) compile

test: rebar3
	$(REBAR) eunit

clean: rebar3
	$(REBAR) clean

ct: rebar3
	$(REBAR) ct

dialyzer: rebar3
	$(REBAR) dialyzer

mongooseim-start:
	docker run --rm -d -t -h mongooseim-escalus-test-1 --name mongooseim-escalus-test-1 \
		-p 5222:5222 -p 8888:8888  -v `pwd`/mongooseim-escalus-test-1:/member mongooseim/mongooseim:2.1.0beta2

mongooseim-stop:
	docker stop mongooseim-escalus-test-1

rebar3:
	wget https://s3.amazonaws.com/rebar3/rebar3 &&\
	chmod u+x rebar3
