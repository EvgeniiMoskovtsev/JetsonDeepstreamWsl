cmake_minimum_required(VERSION 3.16)
project(deepstream-test1-app LANGUAGES CXX)

# Проверяем, установлена ли переменная CUDA_VER
set(CUDA_VER 11.8)
if(NOT DEFINED CUDA_VER)
    message(FATAL_ERROR "CUDA_VER is not set")
endif()

# Определяем настройки для WSL2, 0 - без, 1 - с
set(ENABLE_WSL2 1 CACHE BOOL "Enable WSL2 specific flags")

# Версия DeepStream
set(NVDS_VERSION 6.2)

# Пути установки
set(LIB_INSTALL_DIR "/opt/nvidia/deepstream/deepstream-${NVDS_VERSION}/lib/")
set(APP_INSTALL_DIR "${CMAKE_SOURCE_DIR}/bin")

# Путь до Deepsteam headers
set(DEEPSTREAM_INCLUDES_PATH "/opt/nvidia/deepstream/deepstream/sources/includes")

# Флаги компилятора и условия для разных целей
if(CMAKE_SYSTEM_PROCESSOR STREQUAL "aarch64")
    add_definitions(-DPLATFORM_TEGRA)
endif()

# Файлы исходного кода и заголовки
file(GLOB SRCS "${CMAKE_SOURCE_DIR}/src/*.cpp")
file(GLOB INCS "${CMAKE_SOURCE_DIR}/src/*.h")

# Находим пакеты
find_package(PkgConfig REQUIRED)
pkg_check_modules(GST REQUIRED gstreamer-1.0)

# Флаги компиляции
include_directories(${GST_INCLUDE_DIRS})
include_directories("${DEEPSTREAM_INCLUDES_PATH}")
include_directories("/usr/local/cuda-${CUDA_VER}/include")

if(ENABLE_WSL2)
    add_definitions(-DENABLE_WSL2)
endif()

# Ссылки на библиотеки
link_directories("/usr/local/cuda-${CUDA_VER}/lib64/")
link_directories(${LIB_INSTALL_DIR})

if(ENABLE_WSL2)
    link_libraries(${GST_LIBRARIES} cudart nvdsgst_meta nvds_meta nvds_yml_parser cuda)
else()
    link_libraries(${GST_LIBRARIES} cudart nvdsgst_meta nvds_meta nvds_yml_parser)
endif()

# Цель для сборки приложения
add_executable(${PROJECT_NAME} ${SRCS})
target_link_libraries(${PROJECT_NAME} ${GST_LIBRARIES} cudart nvdsgst_meta nvds_meta nvds_yml_parser)

# Устанавливаем приложение
install(TARGETS ${PROJECT_NAME} DESTINATION ${APP_INSTALL_DIR})

# Пути для поиска библиотек во время выполнения
set_target_properties(${PROJECT_NAME} PROPERTIES INSTALL_RPATH "${LIB_INSTALL_DIR}")
