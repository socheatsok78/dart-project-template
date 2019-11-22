DART_COMPILER="dart2native"

PROJECT_NAME=$(shell cat pubspec.yaml | grep name | awk '{print $$2}')
PROJECT_VERSION=$(shell cat pubspec.yaml | grep version | awk '{print $$2}')

main: detail
	@echo Building application...
	@${DART_COMPILER} \
		-o build/${PROJECT_NAME} \
		lib/main.dart
	@echo Make application executable...
	@chmod +x build/${PROJECT_NAME}
	@echo Done!

detail:
	@echo PROJECT_NAME ${PROJECT_NAME}
	@echo PROJECT_VERSION ${PROJECT_VERSION}
	@echo
