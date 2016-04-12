ExternalProject_Add(gprof2dot
#  [DEPENDS projects...]       # Targets on which the project depends
  PREFIX ${CMAKE_CURRENT_BINARY_DIR}
 #--Download step--------------
#  DOWNLOAD_DIR ${CMAKE_CURRENT_BINARY_DIR}/download
  GIT_REPOSITORY https://github.com/jrfonseca/gprof2dot.git
 #--Configure step-------------
  SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR}/source
  CONFIGURE_COMMAND export PYTHONPATH="${CMAKE_INSTALL_PREFIX}/lib/python2.7/site-packages"
 #--Build step-----------------
  BUILD_COMMAND python ${CMAKE_CURRENT_BINARY_DIR}/source/setup.py build
 #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  INSTALL_COMMAND python ${CMAKE_CURRENT_BINARY_DIR}/source/setup.py install --prefix ${CMAKE_INSTALL_PREFIX}
  )

