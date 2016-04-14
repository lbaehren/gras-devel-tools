ExternalProject_Add(gpstk
#  [DEPENDS projects...]       # Targets on which the project depends
#  [PREFIX dir]                # Root dir for entire project
  #--Download step--------------
  DOWNLOAD_NAME gpstk-2.5.linux.x86_64.tar.gz
#  [DOWNLOAD_DIR dir]          # Directory to store downloaded files
#  [DOWNLOAD_COMMAND cmd...]   # Command to download source tree
  URL http://downloads.sourceforge.net/project/gpstk/gpstk/2.5/gpstk-2.5.linux.x86_64.tar.gz?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fgpstk%2Ffiles%2F&ts=1459864952&use_mirror=iweb
  #--Update/Patch step----------
#  [UPDATE_COMMAND cmd...]     # Source work-tree update command
#  [PATCH_COMMAND cmd...]      # Command to patch downloaded source
  #--Configure step-------------
#  [SOURCE_DIR dir]            # Source dir to be used for build
  CONFIGURE_COMMAND ""
#  [CMAKE_COMMAND /.../cmake]  # Specify alternative cmake executable
#  [CMAKE_GENERATOR gen]       # Specify generator for native build
#  [CMAKE_GENERATOR_TOOLSET t] # Generator-specific toolset name
#  [CMAKE_ARGS args...]        # Arguments to CMake command line
#  CMAKE_CACHE_ARGS CMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
# #--Build step-----------------
#  [BINARY_DIR dir]            # Specify build dir location
  BUILD_COMMAND ""
#  [BUILD_IN_SOURCE 1]         # Use source dir for build dir
  #--Install step---------------
  INSTALL_DIR ${CMAKE_INSTALL_PREFIX}
  INSTALL_COMMAND ls ${CMAKE_CURRENT_BINARY_DIR}/gpstk-prefix/src/gpstk
# #--Test step------------------
#  [TEST_BEFORE_INSTALL 1]     # Add test step executed before install step
#  [TEST_AFTER_INSTALL 1]      # Add test step executed after install step
#  [TEST_COMMAND cmd...]       # Command to drive test
# #--Output logging-------------
#  [LOG_DOWNLOAD 1]            # Wrap download in script to log output
#  [LOG_UPDATE 1]              # Wrap update in script to log output
#  [LOG_CONFIGURE 1]           # Wrap configure in script to log output
#  [LOG_BUILD 1]               # Wrap build in script to log output
#  [LOG_TEST 1]                # Wrap test in script to log output
#  [LOG_INSTALL 1]             # Wrap install in script to log output
# #--Custom targets-------------
#  [STEP_TARGETS st1 st2 ...]  # Generate custom targets for these steps
  )
  
