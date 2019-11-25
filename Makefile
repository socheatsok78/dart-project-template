DART="dart"
PUB="pub"

DART_COMPILER="dart2native"
BUILDS_DIR="builds"
TEST_DIR="test"

PROJECT_NAME=$(shell cat pubspec.yaml | grep name: | awk '{print $$2}')
PROJECT_VERSION=$(shell cat pubspec.yaml | grep version: | awk '{print $$2}')

.PHONY: main detail pub

main: detail pub
	@echo Building application...
	@${DART_COMPILER} \
		-o ${BUILDS_DIR}/${PROJECT_NAME} \
		lib/main.dart
	@echo Make application executable...
	@chmod +x ${BUILDS_DIR}/${PROJECT_NAME}
	@echo Done!

run:
	@${DART} --packages=./.packages \
		package:${PROJECT_NAME}/main.dart

tests:
	@${PUB} run test

detail:
	@echo PROJECT_NAME ${PROJECT_NAME}
	@echo PROJECT_VERSION ${PROJECT_VERSION}
	@echo ========================================

pub:
	@${PUB} get
	@echo ========================================
