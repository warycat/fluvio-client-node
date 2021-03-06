all:	build

build:
	npm run build:platform
	npm run build:ts

test_all: build
	RUST_BACKTRACE=full RUST_LOG=fluvio_client_node=debug FLUVIO_DEV=$(shell uname | tr '[:upper:]' '[:lower:]') npx jest -w 1

npm_lint:
	npm run prettier:check

run_docs:
	npm run docs

pack:
	npm	pack
	mv fluvio-client* /tmp

run_publish:
	npm publish

clean:
	rm -rf dist

examples: example_produce example_list_topic example_create_topic \
	example_find_topic example_create_custom_spu \
	example_delete_custom_spu example_create_managed_spu \
	example_delete_managed_spu # TODO: example_consume example_delete_topic


example_produce:	build
	npx ts-node ./examples/produce.ts

example_consume:	build
	npx ts-node ./examples/consume.ts

example_iterator:	build
	npx ts-node ./examples/iterator.ts

example_list_topic:	build
	npx ts-node ./examples/listTopic.ts

example_create_topic:	build
	npx ts-node ./examples/createTopic.ts

example_delete_topic:	build
	npx ts-node ./examples/deleteTopic.ts

example_find_topic:	build
	npx ts-node ./examples/findTopic.ts

example_list_spu:	build
	npx ts-node ./examples/listSpu.ts

example_create_custom_spu:	build
	npx ts-node ./examples/createCustomSpu.ts

example_delete_custom_spu:	build
	npx ts-node ./examples/deleteCustomSpu.ts

example_create_managed_spu:	build
	npx ts-node ./examples/createManagedSpu.ts

example_delete_managed_spu:	build
	npx ts-node ./examples/deleteManagedSpu.ts
