ExternalProject_Add (doxygen
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
  #--Download step--------------
  GIT_REPOSITORY https://github.com/doxygen/doxygen.git
  #--Configure step-------------
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
  #--Build step-----------------
  BUILD_COMMAND make -j2
  #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  )
