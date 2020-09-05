set(GLIB_REQUIRED_VERSION 2.15.0)
set(GTK_REQUIRED_VERSION 2.12.0)
message("-- Checking for Glib >= ${GLIB_REQUIRED_VERSION}...")
pkg_check_modules(GLIB2 glib-2.0>=${GLIB_REQUIRED_VERSION})
message("-- Checking for GTK+ >= ${GTK_REQUIRED_VERSION}...")
pkg_check_modules(GTK2 gtk+-2.0>=${GTK_REQUIRED_VERSION})
message("-- Checking for GThread...")
pkg_check_modules(GTHREAD gthread-2.0)

if(GLIB2_FOUND AND GTK2_FOUND)
    set(GTK2_ALL_INCLUDES ${GLIB2_INCLUDE_DIRS} ${GTK2_INCLUDE_DIRS} ${GTHREAD_INCLUDE_DIRS})
    set(GTK2_ALL_CFLAGS ${GLIB2_CFLAGS_OTHER} ${GTK2_CFLAGS_OTHER} ${GTHREAD_CFLAGS_OTHER})
    set(GTK2_ALL_LIBS ${GLIB2_LDFLAGS} ${GTK2_LDFLAGS} ${GTHREAD_LDFLAGS})
else()
    message(FATAL_ERROR "Glib/GTK+ not found")
endif()