# Install script for directory: E:/develop/mylingdong/lingdong/windows

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "$<TARGET_FILE_DIR:lingdong>")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
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

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/flutter/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/runner/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_lifecycle/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_multi_window/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_window/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/file_selector_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/screen_retriever/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/url_launcher_windows/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("E:/develop/mylingdong/lingdong/build/windows/plugins/window_manager/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/lingdong.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Debug" TYPE EXECUTABLE FILES "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/lingdong.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/lingdong.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile" TYPE EXECUTABLE FILES "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/lingdong.exe")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/lingdong.exe")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release" TYPE EXECUTABLE FILES "E:/develop/mylingdong/lingdong/build/windows/runner/Release/lingdong.exe")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/data" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/icudtl.dat")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data/icudtl.dat")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/icudtl.dat")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Debug" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/flutter_windows.dll")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/flutter_windows.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release" TYPE FILE FILES "E:/develop/mylingdong/lingdong/windows/flutter/ephemeral/flutter_windows.dll")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/desktop_lifecycle_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/desktop_multi_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/desktop_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/file_selector_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/screen_retriever_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/url_launcher_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Debug/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Debug" TYPE FILE FILES
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_lifecycle/Debug/desktop_lifecycle_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_multi_window/Debug/desktop_multi_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_window/Debug/desktop_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/file_selector_windows/Debug/file_selector_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/screen_retriever/Debug/screen_retriever_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/url_launcher_windows/Debug/url_launcher_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/window_manager/Debug/window_manager_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/desktop_lifecycle_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/desktop_multi_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/desktop_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/file_selector_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/screen_retriever_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/url_launcher_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Profile/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile" TYPE FILE FILES
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_lifecycle/Profile/desktop_lifecycle_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_multi_window/Profile/desktop_multi_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_window/Profile/desktop_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/file_selector_windows/Profile/file_selector_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/screen_retriever/Profile/screen_retriever_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/url_launcher_windows/Profile/url_launcher_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/window_manager/Profile/window_manager_plugin.dll"
      )
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/desktop_lifecycle_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/desktop_multi_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/desktop_window_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/file_selector_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/screen_retriever_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/url_launcher_windows_plugin.dll;E:/develop/mylingdong/lingdong/build/windows/runner/Release/window_manager_plugin.dll")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release" TYPE FILE FILES
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_lifecycle/Release/desktop_lifecycle_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_multi_window/Release/desktop_multi_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/desktop_window/Release/desktop_window_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/file_selector_windows/Release/file_selector_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/screen_retriever/Release/screen_retriever_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/url_launcher_windows/Release/url_launcher_windows_plugin.dll"
      "E:/develop/mylingdong/lingdong/build/windows/plugins/window_manager/Release/window_manager_plugin.dll"
      )
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    
  file(REMOVE_RECURSE "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    
  file(REMOVE_RECURSE "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data/flutter_assets")
  
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    
  file(REMOVE_RECURSE "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data/flutter_assets")
  
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Debug/data" TYPE DIRECTORY FILES "E:/develop/mylingdong/lingdong/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data" TYPE DIRECTORY FILES "E:/develop/mylingdong/lingdong/build//flutter_assets")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data/flutter_assets")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data" TYPE DIRECTORY FILES "E:/develop/mylingdong/lingdong/build//flutter_assets")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Runtime" OR NOT CMAKE_INSTALL_COMPONENT)
  if(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Pp][Rr][Oo][Ff][Ii][Ll][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Profile/data" TYPE FILE FILES "E:/develop/mylingdong/lingdong/build/windows/app.so")
  elseif(CMAKE_INSTALL_CONFIG_NAME MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
     "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data/app.so")
    if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
      message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
    endif()
    file(INSTALL DESTINATION "E:/develop/mylingdong/lingdong/build/windows/runner/Release/data" TYPE FILE FILES "E:/develop/mylingdong/lingdong/build/windows/app.so")
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "E:/develop/mylingdong/lingdong/build/windows/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
