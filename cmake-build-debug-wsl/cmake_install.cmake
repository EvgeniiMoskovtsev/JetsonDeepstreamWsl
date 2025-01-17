# Install script for directory: /mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app"
         RPATH "/opt/nvidia/deepstream/deepstream-6.2/lib/")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin" TYPE EXECUTABLE FILES "/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/cmake-build-debug-wsl/deepstream-test1-app")
  if(EXISTS "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app"
         OLD_RPATH "/usr/local/cuda-11.8/lib64:/opt/nvidia/deepstream/deepstream-6.2/lib:"
         NEW_RPATH "/opt/nvidia/deepstream/deepstream-6.2/lib/")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/bin/deepstream-test1-app")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/mnt/c/Users/user/CLionProjects/JetsonDeepstreamWsl/cmake-build-debug-wsl/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
