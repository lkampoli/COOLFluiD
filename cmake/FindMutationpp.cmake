#Sets:
# MUTATIONPP_INCLUDE_DIR  = where Mixture.h can be found
# MUTATIONPP_LIBRARY      = the library to link against (mutation++ etc)
# CF_HAVE_MUTATIONPP        = set to true after finding the library

OPTION ( CF_SKIP_MUTATIONPP "Skip search for mutation++ library" OFF )

IF ( NOT CF_SKIP_MUTATIONPP )

  SET_TRIAL_INCLUDE_PATH ("") # clear include search path
  SET_TRIAL_LIBRARY_PATH ("") # clear library search path

  ADD_TRIAL_INCLUDE_PATH( ${MUTATIONPP_INCLUDEDIR} )
  ADD_TRIAL_INCLUDE_PATH( ${MUTATIONPP_HOME}/include )
  ADD_TRIAL_INCLUDE_PATH( $ENV{MUTATIONPP_HOME}/include )
  ADD_TRIAL_INCLUDE_PATH( ${MUTATIONPP_HOME}/include/mutation++ )
  ADD_TRIAL_INCLUDE_PATH( $ENV{MUTATIONPP_HOME}/include/mutation++ )

  FIND_PATH(MUTATIONPP_INCLUDE_DIR mutation++.h ${TRIAL_INCLUDE_PATHS} NO_DEFAULT_PATH)

  ADD_TRIAL_LIBRARY_PATH( ${MUTATIONPP_LIBRARYDIR} )
  ADD_TRIAL_LIBRARY_PATH( ${MUTATIONPP_HOME}/lib ${MUTATIONPP_HOME}/lib64 )

  FIND_LIBRARY(MUTATIONPP_LIBRARY mutation++ ${TRIAL_LIBRARY_PATHS} NO_DEFAULT_PATH)

  IF(MUTATIONPP_INCLUDE_DIR AND MUTATIONPP_LIBRARY)
    SET(CF_HAVE_MUTATIONPP 1 CACHE BOOL "Found mutation++ library")
  ELSE()
    SET(CF_HAVE_MUTATIONPP 0 CACHE BOOL "Not found mutation++ library")
  ENDIF()
  
ELSE()
    SET(CF_HAVE_MUTATIONPP 0 CACHE BOOL "Skipped mutation++ library")
ENDIF()

  MARK_AS_ADVANCED(
    MUTATIONPP_INCLUDE_DIR
    MUTATIONPP_LIBRARY
    CF_HAVE_MUTATIONPP
  )

  LOG ( "CF_HAVE_MUTATIONPP: [${CF_HAVE_MUTATIONPP}]" )
  IF(CF_HAVE_MUTATIONPP)
    LOG ( "  MUTATIONPP_INCLUDE_DIR:  [${MUTATIONPP_INCLUDE_DIR}]" )
    LOG ( "  MUTATIONPP_LIBRARY:      [${MUTATIONPP_LIBRARY}]" )
  ENDIF(CF_HAVE_MUTATIONPP)
