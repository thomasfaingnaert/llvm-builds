LLVM_VERSION=llvmorg-11.0.0

help:
	@echo "Usage:"
	@echo "    make <debug|release> [LLVM_VERSION=branch or commit or tag]"
	@echo "    make clean"

debug:
	docker build . -t llvmbuild:debug --build-arg LLVM_VERSION=${LLVM_VERSION} --build-arg BUILD_TYPE=Debug
	docker run --rm -v ${PWD}:/mount llvmbuild:debug bash -c 'cp /*.7z /mount && chown $(shell id -u):$(shell id -g) /mount/*.7z'
	docker image rm llvmbuild:debug

release:
	docker build . -t llvmbuild:release --build-arg LLVM_VERSION=${LLVM_VERSION} --build-arg BUILD_TYPE=Release
	docker run --rm -v ${PWD}:/mount llvmbuild:release bash -c 'cp /*.7z /mount && chown $(shell id -u):$(shell id -g) /mount/*.7z'
	docker image rm llvmbuild:release

clean:
	-rm -r ${PWD}/*.7z
