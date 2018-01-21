module php;

extern (C):

alias long sxi64;

alias ulong sxu64;

alias int  function(void *, uint , void *)ProcConsumer;

struct ph7
{

}

struct ph7_vm
{

}

struct ph7_value
{

}

struct ph7_context
{

}

struct SyMutex
{

}

struct syiovec
{
    uint nLen;
    char *pBase;
}

struct SyString
{
    char *zString;
    uint nByte;
}

struct Sytm
{
    int tm_sec;
    int tm_min;
    int tm_hour;
    int tm_mday;
    int tm_mon;
    int tm_year;
    int tm_wday;
    int tm_yday;
    int tm_isdst;
    char *tm_zone;
    int tm_gmtoff;
}

struct SyMemMethods
{
    void * function(uint )xAlloc;
    void * function(void *, uint )xRealloc;
    void  function(void *)xFree;
    uint  function(void *)xChunkSize;
    int  function(void *)xInit;
    void  function(void *)xRelease;
    void *pUserData;
}

alias int  function(void *)ProcMemError;

struct SyMutexMethods
{
    int  function()xGlobalInit;
    void  function()xGlobalRelease;
    SyMutex * function(int )xNew;
    void  function(SyMutex *)xRelease;
    void  function(SyMutex *)xEnter;
    int  function(SyMutex *)xTryEnter;
    void  function(SyMutex *)xLeave;
}

const int SXRET_OK = 0;
const int SXERR_MEM = -1;
const int SXERR_IO = -2;
const int SXERR_EMPTY = -3;
const int SXERR_LOCKED = -4;
const int SXERR_ORANGE = -5;
const int SXERR_NOTFOUND = -6;
const int SXERR_LIMIT = -7;
const int SXERR_MORE = -8;
const int SXERR_INVALID = -9;
const int SXERR_ABORT = -10;
const int SXERR_EXISTS = -11;
const int SXERR_SYNTAX = -12;
const int SXERR_UNKNOWN = -13;
const int SXERR_BUSY = -14;
const int SXERR_OVERFLOW = -15;
const int SXERR_WILLBLOCK = -16;
const int SXERR_NOTIMPLEMENTED = -17;
const int SXERR_EOF = -18;
const int SXERR_PERM = -19;
const int SXERR_NOOP = -20;
const int SXERR_FORMAT = -21;
const int SXERR_NEXT = -22;
const int SXERR_OS = -23;
const int SXERR_CORRUPT = -24;
const int SXERR_CONTINUE = -25;
const int SXERR_NOMATCH = -26;
const int SXERR_RESET = -27;
const int SXERR_DONE = -28;
const int SXERR_SHORT = -29;
const int SXERR_PATH = -30;
const int SXERR_TIMEOUT = -31;
const int SXERR_BIG = -32;
const int SXERR_RETRY = -33;
const int SXERR_IGNORE = -63;

const int PH7_OK = SXRET_OK;
/* Standard PH7 return values */
//C     #define PH7_OK      SXRET_OK      /* Successful result */
/* beginning-of-error-codes */

//C     #define PH7_NOMEM   SXERR_MEM     /* Out of memory */
//C     #define PH7_ABORT   SXERR_ABORT   /* Foreign Function request operation abort/Another thread have released this instance */
alias SXERR_MEM PH7_NOMEM;
//C     #define PH7_IO_ERR  SXERR_IO      /* IO error */
alias SXERR_ABORT PH7_ABORT;
//C     #define PH7_CORRUPT SXERR_CORRUPT /* Corrupt pointer/Unknown configuration option */
alias SXERR_IO PH7_IO_ERR;
//C     #define PH7_LOOKED  SXERR_LOCKED  /* Forbidden Operation */
alias SXERR_CORRUPT PH7_CORRUPT;
//C     #define PH7_COMPILE_ERR (-70)     /* Compilation error */
alias SXERR_LOCKED PH7_LOOKED;
//C     #define PH7_VM_ERR      (-71)     /* Virtual machine error */
/* end-of-error-codes */
/*
 * If compiling for a processor that lacks floating point
 * support, substitute integer for floating-point.
 */
//C     #ifdef PH7_OMIT_FLOATING_POINT
//C     typedef sxi64 ph7_real;
//C     #else
//C     typedef double ph7_real;
alias double ph7_real;
//C     #endif
//C     typedef sxi64 ph7_int64;
alias double ph7_int64;
//C     #define PH7_APIEXPORT SX_APIEXPORT
/*
alias SX_APIEXPORT PH7_APIEXPORT;
 * Engine Configuration Commands.
 *
 * The following set of constants are the available configuration verbs that can
 * be used by the host-application to configure the PH7 engine.
 * These constants must be passed as the second argument to the [ph7_config()]
 * interface.
 * Each options require a variable number of arguments.
 * The [ph7_config()] interface will return PH7_OK on success, any other
 * return value indicates failure.
 * For a full discussion on the configuration verbs and their expected
 * parameters, please refer to this page:
 *      http://ph7.symisc.net/c_api_func.html#ph7_config
 */
//C     #define PH7_CONFIG_ERR_OUTPUT    1  /* TWO ARGUMENTS: int (*xConsumer)(const void *pOut,unsigned int nLen,void *pUserData),void *pUserData */
//C     #define PH7_CONFIG_ERR_ABORT     2  /* RESERVED FOR FUTURE USE */
const PH7_CONFIG_ERR_OUTPUT = 1;
//C     #define PH7_CONFIG_ERR_LOG       3  /* TWO ARGUMENTS: const char **pzBuf,int *pLen */
const PH7_CONFIG_ERR_ABORT = 2;
const PH7_CONFIG_ERR_LOG = 3;
/*
const PH7_CONFIG_ERR_LOG = 3;
 * Virtual Machine Configuration Commands.
 *
 * The following set of constants are the available configuration verbs that can
 * be used by the host-application to configure the PH7 Virtual machine.
 * These constants must be passed as the second argument to the [ph7_vm_config()]
 * interface.
 * Each options require a variable number of arguments.
 * The [ph7_vm_config()] interface will return PH7_OK on success, any other return
 * value indicates failure.
 * There are many options but the most importants are: PH7_VM_CONFIG_OUTPUT which install
 * a VM output consumer callback, PH7_VM_CONFIG_HTTP_REQUEST which parse and register
 * a HTTP request and PH7_VM_CONFIG_ARGV_ENTRY which populate the $argv array.
 * For a full discussion on the configuration verbs and their expected parameters, please
 * refer to this page:
 *      http://ph7.symisc.net/c_api_func.html#ph7_vm_config
 */
//C     #define PH7_VM_CONFIG_OUTPUT           1  /* TWO ARGUMENTS: int (*xConsumer)(const void *pOut,unsigned int nLen,void *pUserData),void *pUserData */
//C     #define PH7_VM_CONFIG_IMPORT_PATH      3  /* ONE ARGUMENT: const char *zIncludePath */
const PH7_VM_CONFIG_OUTPUT = 1;
//C     #define PH7_VM_CONFIG_ERR_REPORT       4  /* NO ARGUMENTS: Report all run-time errors in the VM output */
const PH7_VM_CONFIG_IMPORT_PATH = 3;
//C     #define PH7_VM_CONFIG_RECURSION_DEPTH  5  /* ONE ARGUMENT: int nMaxDepth */
const PH7_VM_CONFIG_ERR_REPORT = 4;
//C     #define PH7_VM_OUTPUT_LENGTH           6  /* ONE ARGUMENT: unsigned int *pLength */
const PH7_VM_CONFIG_RECURSION_DEPTH = 5;
//C     #define PH7_VM_CONFIG_CREATE_SUPER     7  /* TWO ARGUMENTS: const char *zName,ph7_value *pValue */
const PH7_VM_OUTPUT_LENGTH = 6;
//C     #define PH7_VM_CONFIG_CREATE_VAR       8  /* TWO ARGUMENTS: const char *zName,ph7_value *pValue */
const PH7_VM_CONFIG_CREATE_SUPER = 7;
//C     #define PH7_VM_CONFIG_HTTP_REQUEST     9  /* TWO ARGUMENTS: const char *zRawRequest,int nRequestLength */
const PH7_VM_CONFIG_CREATE_VAR = 8;
//C     #define PH7_VM_CONFIG_SERVER_ATTR     10  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_HTTP_REQUEST = 9;
//C     #define PH7_VM_CONFIG_ENV_ATTR        11  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_SERVER_ATTR = 10;
//C     #define PH7_VM_CONFIG_SESSION_ATTR    12  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_ENV_ATTR = 11;
//C     #define PH7_VM_CONFIG_POST_ATTR       13  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_SESSION_ATTR = 12;
//C     #define PH7_VM_CONFIG_GET_ATTR        14  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_POST_ATTR = 13;
//C     #define PH7_VM_CONFIG_COOKIE_ATTR     15  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_GET_ATTR = 14;
//C     #define PH7_VM_CONFIG_HEADER_ATTR     16  /* THREE ARGUMENTS: const char *zKey,const char *zValue,int nLen */
const PH7_VM_CONFIG_COOKIE_ATTR = 15;
//C     #define PH7_VM_CONFIG_EXEC_VALUE      17  /* ONE ARGUMENT: ph7_value **ppValue */
const PH7_VM_CONFIG_HEADER_ATTR = 16;
//C     #define PH7_VM_CONFIG_IO_STREAM       18  /* ONE ARGUMENT: const ph7_io_stream *pStream */
const PH7_VM_CONFIG_EXEC_VALUE = 17;
//C     #define PH7_VM_CONFIG_ARGV_ENTRY      19  /* ONE ARGUMENT: const char *zValue */
const PH7_VM_CONFIG_IO_STREAM = 18;
//C     #define PH7_VM_CONFIG_EXTRACT_OUTPUT  20  /* TWO ARGUMENTS: const void **ppOut,unsigned int *pOutputLen */
const PH7_VM_CONFIG_ARGV_ENTRY = 19;
//C     #define PH7_VM_CONFIG_ERR_LOG_HANDLER 21  /* ONE ARGUMENT: void (*xErrLog)(const char *,int,const char *,const char *) */
const PH7_VM_CONFIG_EXTRACT_OUTPUT = 20;
/*
const PH7_VM_CONFIG_ERR_LOG_HANDLER = 21;
 * Global Library Configuration Commands.
 *
 * The following set of constants are the available configuration verbs that can
 * be used by the host-application to configure the whole library.
 * These constants must be passed as the first argument to the [ph7_lib_config()]
 * interface.
 * Each options require a variable number of arguments.
 * The [ph7_lib_config()] interface will return PH7_OK on success, any other return
 * value indicates failure.
 * Notes:
 * The default configuration is recommended for most applications and so the call to
 * [ph7_lib_config()] is usually not necessary. It is provided to support rare
 * applications with unusual needs.
 * The [ph7_lib_config()] interface is not threadsafe. The application must insure that
 * no other [ph7_*()] interfaces are invoked by other threads while [ph7_lib_config()]
 * is running. Furthermore, [ph7_lib_config()] may only be invoked prior to library
 * initialization using [ph7_lib_init()] or [ph7_init()] or after shutdown
 * by [ph7_lib_shutdown()]. If [ph7_lib_config()] is called after [ph7_lib_init()]
 * or [ph7_init()] and before [ph7_lib_shutdown()] then it will return PH7_LOCKED.
 * Refer to the official documentation for more information on the configuration verbs
 * and their expected parameters.
 * For a full discussion on the configuration verbs and their expected parameters,please
 * refer to this page:
 *      http://ph7.symisc.net/c_api_func.html#Global_Library_Management_Interfaces
 */
//C     #define PH7_LIB_CONFIG_USER_MALLOC            1 /* ONE ARGUMENT: const SyMemMethods *pMemMethods */
//C     #define PH7_LIB_CONFIG_MEM_ERR_CALLBACK       2 /* TWO ARGUMENTS: int (*xMemError)(void *),void *pUserData */
const PH7_LIB_CONFIG_USER_MALLOC = 1;
//C     #define PH7_LIB_CONFIG_USER_MUTEX             3 /* ONE ARGUMENT: const SyMutexMethods *pMutexMethods */
const PH7_LIB_CONFIG_MEM_ERR_CALLBACK = 2;
//C     #define PH7_LIB_CONFIG_THREAD_LEVEL_SINGLE    4 /* NO ARGUMENTS */
const PH7_LIB_CONFIG_USER_MUTEX = 3;
//C     #define PH7_LIB_CONFIG_THREAD_LEVEL_MULTI     5 /* NO ARGUMENTS */
const PH7_LIB_CONFIG_THREAD_LEVEL_SINGLE = 4;
//C     #define PH7_LIB_CONFIG_VFS                    6 /* ONE ARGUMENT: const ph7_vfs *pVfs */
const PH7_LIB_CONFIG_THREAD_LEVEL_MULTI = 5;
/*
const PH7_LIB_CONFIG_VFS = 6;
 * Compile-time flags.
 * The new compile interfaces [ph7_compile_v2()] and [ph7_compile_file()] takes
 * as their last argument zero or more combination of compile time flags.
 * These flags are used to control the behavior of the PH7 compiler while
 * processing the input.
 * Refer to the official documentation for additional information.
 */
//C     #define PH7_PHP_ONLY 0x01
/* If this flag is set then the code to compile is assumed
                           * to be plain PHP only. That is, there is no need to delimit
						   * the PHP code using the standard tags such as <?php ?> or <? ?>.
						   * Everything will pass through the PH7 compiler.
						   */
//C     #define PH7_PHP_EXPR 0x02 /* This flag is reserved for future use. */
const PH7_PHP_ONLY = 0x01;
/*
const PH7_PHP_EXPR = 0x02;
 * Call Context Error Message Serverity Level.
 *
 * The following constans are the allowed severity level that can
 * passed as the second argument to the [ph7_context_throw_error()] or
 * [ph7_context_throw_error_format()] interfaces.
 * Refer to the official documentation for additional information.
 */
//C     #define PH7_CTX_ERR      1 /* Call context error such as unexpected number of arguments,invalid types and so on. */
//C     #define PH7_CTX_WARNING  2 /* Call context Warning */
const PH7_CTX_ERR = 1;
//C     #define PH7_CTX_NOTICE   3 /* Call context Notice */
const PH7_CTX_WARNING = 2;
/* Current VFS structure version*/
const PH7_CTX_NOTICE = 3;
//C     #define PH7_VFS_VERSION 2
/*
const PH7_VFS_VERSION = 2;
 * PH7 Virtual File System (VFS).
 *
 * An instance of the ph7_vfs object defines the interface between the PH7 core
 * and the underlying operating system. The "vfs" in the name of the object stands
 * for "virtual file system". The vfs is used to implement PHP system functions
 * such as mkdir(), chdir(), stat(), get_user_name() and many more.
 * The value of the iVersion field is initially 2 but may be larger in future versions
 * of PH7.
 * Additional fields may be appended to this object when the iVersion value is increased.
 * Only a single vfs can be registered within the PH7 core. Vfs registration is done
 * using the ph7_lib_config() interface with a configuration verb set to PH7_LIB_CONFIG_VFS.
 * Note that Windows and UNIX (Linux, FreeBSD, Solaris, Mac OS X, etc.) users does not have to
 * worry about registering and installing a vfs since PH7 come with a built-in vfs for these
 * platforms which implement most the methods defined below.
 * Host-application running on exotic systems (ie: Other than Windows and UNIX systems) must
 * register their own vfs in order to be able to use and call PHP system function.
 * Also note that the ph7_compile_file() interface depend on the xMmap() method of the underlying
 * vfs which mean that this method must be available (Always the case using the built-in VFS)
 * in order to use this interface.
 * Developers wishing to implement the vfs methods can contact symisc systems to obtain
 * the PH7 VFS C/C++ Specification manual.
 */
//C     struct ph7_vfs
//C     {
//C     	const char *zName;  /* Underlying VFS name [i.e: FreeBSD/Linux/Windows...] */
//C     	int iVersion;       /* Current VFS structure version [default 2] */
	/* Directory functions */
//C     	int (*xChdir)(const char *);                     /* Change directory */
//C     	int (*xChroot)(const char *);                    /* Change the root directory */
//C     	int (*xGetcwd)(ph7_context *);                   /* Get the current working directory */
//C     	int (*xMkdir)(const char *,int,int);             /* Make directory */
//C     	int (*xRmdir)(const char *);                     /* Remove directory */
//C     	int (*xIsdir)(const char *);                     /* Tells whether the filename is a directory */
//C     	int (*xRename)(const char *,const char *);       /* Renames a file or directory */
//C     	int (*xRealpath)(const char *,ph7_context *);    /* Return canonicalized absolute pathname*/
	/* Systems functions */
//C     	int (*xSleep)(unsigned int);                     /* Delay execution in microseconds */
//C     	int (*xUnlink)(const char *);                    /* Deletes a file */
//C     	int (*xFileExists)(const char *);                /* Checks whether a file or directory exists */
//C     	int (*xChmod)(const char *,int);                 /* Changes file mode */
//C     	int (*xChown)(const char *,const char *);        /* Changes file owner */
//C     	int (*xChgrp)(const char *,const char *);        /* Changes file group */
//C     	ph7_int64 (*xFreeSpace)(const char *);           /* Available space on filesystem or disk partition */
//C     	ph7_int64 (*xTotalSpace)(const char *);          /* Total space on filesystem or disk partition */
//C     	ph7_int64 (*xFileSize)(const char *);            /* Gets file size */
//C     	ph7_int64 (*xFileAtime)(const char *);           /* Gets last access time of file */
//C     	ph7_int64 (*xFileMtime)(const char *);           /* Gets file modification time */
//C     	ph7_int64 (*xFileCtime)(const char *);           /* Gets inode change time of file */
//C     	int (*xStat)(const char *,ph7_value *,ph7_value *);   /* Gives information about a file */
//C     	int (*xlStat)(const char *,ph7_value *,ph7_value *);  /* Gives information about a file */
//C     	int (*xIsfile)(const char *);                    /* Tells whether the filename is a regular file */
//C     	int (*xIslink)(const char *);                    /* Tells whether the filename is a symbolic link */
//C     	int (*xReadable)(const char *);                  /* Tells whether a file exists and is readable */
//C     	int (*xWritable)(const char *);                  /* Tells whether the filename is writable */
//C     	int (*xExecutable)(const char *);                /* Tells whether the filename is executable */
//C     	int (*xFiletype)(const char *,ph7_context *);    /* Gets file type [i.e: fifo,dir,file..] */
//C     	int (*xGetenv)(const char *,ph7_context *);      /* Gets the value of an environment variable */
//C     	int (*xSetenv)(const char *,const char *);       /* Sets the value of an environment variable */
//C     	int (*xTouch)(const char *,ph7_int64,ph7_int64); /* Sets access and modification time of file */
//C     	int (*xMmap)(const char *,void **,ph7_int64 *);  /* Read-only memory map of the whole file */
//C     	void (*xUnmap)(void *,ph7_int64);                /* Unmap a memory view */
//C     	int (*xLink)(const char *,const char *,int);     /* Create hard or symbolic link */
//C     	int (*xUmask)(int);                              /* Change the current umask */
//C     	void (*xTempDir)(ph7_context *);                 /* Get path of the temporary directory */
//C     	unsigned int (*xProcessId)(void);                /* Get running process ID */
//C     	int (*xUid)(void);                               /* user ID of the process */
//C     	int (*xGid)(void);                               /* group ID of the process */
//C     	void (*xUsername)(ph7_context *);                /* Running username */
//C     	int (*xExec)(const char *,ph7_context *);        /* Execute an external program */
//C     };
struct ph7_vfs
{
    char *zName;
    int iVersion;
    int  function(char *)xChdir;
    int  function(char *)xChroot;
    int  function(ph7_context *)xGetcwd;
    int  function(char *, int , int )xMkdir;
    int  function(char *)xRmdir;
    int  function(char *)xIsdir;
    int  function(char *, char *)xRename;
    int  function(char *, ph7_context *)xRealpath;
    int  function(uint )xSleep;
    int  function(char *)xUnlink;
    int  function(char *)xFileExists;
    int  function(char *, int )xChmod;
    int  function(char *, char *)xChown;
    int  function(char *, char *)xChgrp;
    ph7_int64  function(char *)xFreeSpace;
    ph7_int64  function(char *)xTotalSpace;
    ph7_int64  function(char *)xFileSize;
    ph7_int64  function(char *)xFileAtime;
    ph7_int64  function(char *)xFileMtime;
    ph7_int64  function(char *)xFileCtime;
    int  function(char *, ph7_value *, ph7_value *)xStat;
    int  function(char *, ph7_value *, ph7_value *)xlStat;
    int  function(char *)xIsfile;
    int  function(char *)xIslink;
    int  function(char *)xReadable;
    int  function(char *)xWritable;
    int  function(char *)xExecutable;
    int  function(char *, ph7_context *)xFiletype;
    int  function(char *, ph7_context *)xGetenv;
    int  function(char *, char *)xSetenv;
    int  function(char *, ph7_int64 , ph7_int64 )xTouch;
    int  function(char *, void **, ph7_int64 *)xMmap;
    void  function(void *, ph7_int64 )xUnmap;
    int  function(char *, char *, int )xLink;
    int  function(int )xUmask;
    void  function(ph7_context *)xTempDir;
    uint  function()xProcessId;
    int  function()xUid;
    int  function()xGid;
    void  function(ph7_context *)xUsername;
    int  function(char *, ph7_context *)xExec;
}
/* Current PH7 IO stream structure version. */
//C     #define PH7_IO_STREAM_VERSION 1
/*
const PH7_IO_STREAM_VERSION = 1;
 * Possible open mode flags that can be passed to the xOpen() routine
 * of the underlying IO stream device .
 * Refer to the PH7 IO Stream C/C++ specification manual (http://ph7.symisc.net/io_stream_spec.html)
 * for additional information.
 */
//C     #define PH7_IO_OPEN_RDONLY   0x001  /* Read-only open */
//C     #define PH7_IO_OPEN_WRONLY   0x002  /* Write-only open */
const PH7_IO_OPEN_RDONLY = 0x001;
//C     #define PH7_IO_OPEN_RDWR     0x004  /* Read-write open. */
const PH7_IO_OPEN_WRONLY = 0x002;
//C     #define PH7_IO_OPEN_CREATE   0x008  /* If the file does not exist it will be created */
const PH7_IO_OPEN_RDWR = 0x004;
//C     #define PH7_IO_OPEN_TRUNC    0x010  /* Truncate the file to zero length */
const PH7_IO_OPEN_CREATE = 0x008;
//C     #define PH7_IO_OPEN_APPEND   0x020  /* Append mode.The file offset is positioned at the end of the file */
const PH7_IO_OPEN_TRUNC = 0x010;
//C     #define PH7_IO_OPEN_EXCL     0x040  /* Ensure that this call creates the file,the file must not exist before */
const PH7_IO_OPEN_APPEND = 0x020;
//C     #define PH7_IO_OPEN_BINARY   0x080  /* Simple hint: Data is binary */
const PH7_IO_OPEN_EXCL = 0x040;
//C     #define PH7_IO_OPEN_TEMP     0x100  /* Simple hint: Temporary file */
const PH7_IO_OPEN_BINARY = 0x080;
//C     #define PH7_IO_OPEN_TEXT     0x200  /* Simple hint: Data is textual */
const PH7_IO_OPEN_TEMP = 0x100;
/*
const PH7_IO_OPEN_TEXT = 0x200;
 * PH7 IO Stream Device.
 *
 * An instance of the ph7_io_stream object defines the interface between the PH7 core
 * and the underlying stream device.
 * A stream is a smart mechanism for generalizing file, network, data compression
 * and other IO operations which share a common set of functions using an abstracted
 * unified interface.
 * A stream device is additional code which tells the stream how to handle specific
 * protocols/encodings. For example, the http device knows how to translate a URL
 * into an HTTP/1.1 request for a file on a remote server.
 * PH7 come with two built-in IO streams device:
 * The file:// stream which perform very efficient disk IO and the php:// stream
 * which is a special stream that allow access various I/O streams (See the PHP official
 * documentation for more information on this stream).
 * A stream is referenced as: scheme://target
 * scheme(string) - The name of the wrapper to be used. Examples include: file,http,https,ftp,
 * ftps, compress.zlib, compress.bz2, and php. If no wrapper is specified,the function default
 * is used (typically file://).
 * target - Depends on the device used. For filesystem related streams this is typically a path
 * and filename of the desired file.For network related streams this is typically a hostname,often
 * with a path appended.
 * IO stream devices are registered using a call to ph7_vm_config() with a configuration verb
 * set to PH7_VM_CONFIG_IO_STREAM.
 * Currently the PH7 development team is working on the implementation of the http:// and ftp://
 * IO stream protocols. These devices will be available in the next major release of the PH7 engine.
 * Developers wishing to implement their own IO stream devices must understand and follow
 * The PH7 IO Stream C/C++ specification manual (http://ph7.symisc.net/io_stream_spec.html).
 */
//C     struct ph7_io_stream
//C     {
//C     	const char *zName;                                     /* Underlying stream name [i.e: file/http/zip/php,..] */
//C     	int iVersion;                                          /* IO stream structure version [default 1]*/
//C     	int  (*xOpen)(const char *,int,ph7_value *,void **);   /* Open handle*/
//C     	int  (*xOpenDir)(const char *,ph7_value *,void **);    /* Open directory handle */
//C     	void (*xClose)(void *);                                /* Close file handle */
//C     	void (*xCloseDir)(void *);                             /* Close directory handle */
//C     	ph7_int64 (*xRead)(void *,void *,ph7_int64);           /* Read from the open stream */
//C     	int (*xReadDir)(void *,ph7_context *);                 /* Read entry from directory handle */
//C     	ph7_int64 (*xWrite)(void *,const void *,ph7_int64);    /* Write to the open stream */
//C     	int (*xSeek)(void *,ph7_int64,int);                    /* Seek on the open stream */
//C     	int (*xLock)(void *,int);                              /* Lock/Unlock the open stream */
//C     	void (*xRewindDir)(void *);                            /* Rewind directory handle */
//C     	ph7_int64 (*xTell)(void *);                            /* Current position of the stream  read/write pointer */
//C     	int (*xTrunc)(void *,ph7_int64);                       /* Truncates the open stream to a given length */
//C     	int (*xSync)(void *);                                  /* Flush open stream data */
//C     	int (*xStat)(void *,ph7_value *,ph7_value *);          /* Stat an open stream handle */
//C     };
struct ph7_io_stream
{
    char *zName;
    int iVersion;
    int  function(char *, int , ph7_value *, void **)xOpen;
    int  function(char *, ph7_value *, void **)xOpenDir;
    void  function(void *)xClose;
    void  function(void *)xCloseDir;
    ph7_int64  function(void *, void *, ph7_int64 )xRead;
    int  function(void *, ph7_context *)xReadDir;
    ph7_int64  function(void *, void *, ph7_int64 )xWrite;
    int  function(void *, ph7_int64 , int )xSeek;
    int  function(void *, int )xLock;
    void  function(void *)xRewindDir;
    ph7_int64  function(void *)xTell;
    int  function(void *, ph7_int64 )xTrunc;
    int  function(void *)xSync;
    int  function(void *, ph7_value *, ph7_value *)xStat;
}
/*
 * C-API-REF: Please refer to the official documentation for interfaces
 * purpose and expected parameters.
 */
/* Engine Handling Interfaces */
//C     PH7_APIEXPORT int ph7_init(ph7 **ppEngine);
int  ph7_init(ph7 **ppEngine);
//C     PH7_APIEXPORT int ph7_config(ph7 *pEngine,int nConfigOp,...);
int  ph7_config(ph7 *pEngine, int nConfigOp,...);
//C     PH7_APIEXPORT int ph7_release(ph7 *pEngine);
int  ph7_release(ph7 *pEngine);
/* Compile Interfaces */
//C     PH7_APIEXPORT int ph7_compile(ph7 *pEngine,const char *zSource,int nLen,ph7_vm **ppOutVm);
int  ph7_compile(ph7 *pEngine, char *zSource, int nLen, ph7_vm **ppOutVm);
//C     PH7_APIEXPORT int ph7_compile_v2(ph7 *pEngine,const char *zSource,int nLen,ph7_vm **ppOutVm,int iFlags);
int  ph7_compile_v2(ph7 *pEngine, char *zSource, int nLen, ph7_vm **ppOutVm, int iFlags);
//C     PH7_APIEXPORT int ph7_compile_file(ph7 *pEngine,const char *zFilePath,ph7_vm **ppOutVm,int iFlags);
int  ph7_compile_file(ph7 *pEngine, char *zFilePath, ph7_vm **ppOutVm, int iFlags);
/* Virtual Machine Handling Interfaces */
//C     PH7_APIEXPORT int ph7_vm_config(ph7_vm *pVm,int iConfigOp,...);
int  ph7_vm_config(ph7_vm *pVm, int iConfigOp,...);
//C     PH7_APIEXPORT int ph7_vm_exec(ph7_vm *pVm,int *pExitStatus);
int  ph7_vm_exec(ph7_vm *pVm, int *pExitStatus);
//C     PH7_APIEXPORT int ph7_vm_reset(ph7_vm *pVm);
int  ph7_vm_reset(ph7_vm *pVm);
//C     PH7_APIEXPORT int ph7_vm_release(ph7_vm *pVm);
int  ph7_vm_release(ph7_vm *pVm);
//C     PH7_APIEXPORT int ph7_vm_dump_v2(ph7_vm *pVm,int (*xConsumer)(const void *,unsigned int,void *),void *pUserData);
int  ph7_vm_dump_v2(ph7_vm *pVm, int  function(void *, uint , void *)xConsumer, void *pUserData);
/* In-process Extending Interfaces */
//C     PH7_APIEXPORT int ph7_create_function(ph7_vm *pVm,const char *zName,int (*xFunc)(ph7_context *,int,ph7_value **),void *pUserData);
int  ph7_create_function(ph7_vm *pVm, char *zName, int  function(ph7_context *, int , ph7_value **)xFunc, void *pUserData);
//C     PH7_APIEXPORT int ph7_delete_function(ph7_vm *pVm,const char *zName);
int  ph7_delete_function(ph7_vm *pVm, char *zName);
//C     PH7_APIEXPORT int ph7_create_constant(ph7_vm *pVm,const char *zName,void (*xExpand)(ph7_value *,void *),void *pUserData);
int  ph7_create_constant(ph7_vm *pVm, char *zName, void  function(ph7_value *, void *)xExpand, void *pUserData);
//C     PH7_APIEXPORT int ph7_delete_constant(ph7_vm *pVm,const char *zName);
int  ph7_delete_constant(ph7_vm *pVm, char *zName);
/* Foreign Function Parameter Values */
//C     PH7_APIEXPORT int ph7_value_to_int(ph7_value *pValue);
int  ph7_value_to_int(ph7_value *pValue);
//C     PH7_APIEXPORT int ph7_value_to_bool(ph7_value *pValue);
int  ph7_value_to_bool(ph7_value *pValue);
//C     PH7_APIEXPORT ph7_int64 ph7_value_to_int64(ph7_value *pValue);
ph7_int64  ph7_value_to_int64(ph7_value *pValue);
//C     PH7_APIEXPORT double ph7_value_to_double(ph7_value *pValue);
double  ph7_value_to_double(ph7_value *pValue);
//C     PH7_APIEXPORT const char * ph7_value_to_string(ph7_value *pValue,int *pLen);
char * ph7_value_to_string(ph7_value *pValue, int *pLen);
//C     PH7_APIEXPORT void * ph7_value_to_resource(ph7_value *pValue);
void * ph7_value_to_resource(ph7_value *pValue);
//C     PH7_APIEXPORT int ph7_value_compare(ph7_value *pLeft,ph7_value *pRight,int bStrict);
int  ph7_value_compare(ph7_value *pLeft, ph7_value *pRight, int bStrict);
/* Setting The Result Of A Foreign Function */
//C     PH7_APIEXPORT int ph7_result_int(ph7_context *pCtx,int iValue);
int  ph7_result_int(ph7_context *pCtx, int iValue);
//C     PH7_APIEXPORT int ph7_result_int64(ph7_context *pCtx,ph7_int64 iValue);
int  ph7_result_int64(ph7_context *pCtx, ph7_int64 iValue);
//C     PH7_APIEXPORT int ph7_result_bool(ph7_context *pCtx,int iBool);
int  ph7_result_bool(ph7_context *pCtx, int iBool);
//C     PH7_APIEXPORT int ph7_result_double(ph7_context *pCtx,double Value);
int  ph7_result_double(ph7_context *pCtx, double Value);
//C     PH7_APIEXPORT int ph7_result_null(ph7_context *pCtx);
int  ph7_result_null(ph7_context *pCtx);
//C     PH7_APIEXPORT int ph7_result_string(ph7_context *pCtx,const char *zString,int nLen);
int  ph7_result_string(ph7_context *pCtx, char *zString, int nLen);
//C     PH7_APIEXPORT int ph7_result_string_format(ph7_context *pCtx,const char *zFormat,...);
int  ph7_result_string_format(ph7_context *pCtx, char *zFormat,...);
//C     PH7_APIEXPORT int ph7_result_value(ph7_context *pCtx,ph7_value *pValue);
int  ph7_result_value(ph7_context *pCtx, ph7_value *pValue);
//C     PH7_APIEXPORT int ph7_result_resource(ph7_context *pCtx,void *pUserData);
int  ph7_result_resource(ph7_context *pCtx, void *pUserData);
/* Call Context Handling Interfaces */
//C     PH7_APIEXPORT int ph7_context_output(ph7_context *pCtx,const char *zString,int nLen);
int  ph7_context_output(ph7_context *pCtx, char *zString, int nLen);
//C     PH7_APIEXPORT int ph7_context_output_format(ph7_context *pCtx,const char *zFormat,...);
int  ph7_context_output_format(ph7_context *pCtx, char *zFormat,...);
//C     PH7_APIEXPORT int ph7_context_throw_error(ph7_context *pCtx,int iErr,const char *zErr);
int  ph7_context_throw_error(ph7_context *pCtx, int iErr, char *zErr);
//C     PH7_APIEXPORT int ph7_context_throw_error_format(ph7_context *pCtx,int iErr,const char *zFormat,...);
int  ph7_context_throw_error_format(ph7_context *pCtx, int iErr, char *zFormat,...);
//C     PH7_APIEXPORT unsigned int ph7_context_random_num(ph7_context *pCtx);
uint  ph7_context_random_num(ph7_context *pCtx);
//C     PH7_APIEXPORT int ph7_context_random_string(ph7_context *pCtx,char *zBuf,int nBuflen);
int  ph7_context_random_string(ph7_context *pCtx, char *zBuf, int nBuflen);
//C     PH7_APIEXPORT void * ph7_context_user_data(ph7_context *pCtx);
void * ph7_context_user_data(ph7_context *pCtx);
//C     PH7_APIEXPORT int    ph7_context_push_aux_data(ph7_context *pCtx,void *pUserData);
int  ph7_context_push_aux_data(ph7_context *pCtx, void *pUserData);
//C     PH7_APIEXPORT void * ph7_context_peek_aux_data(ph7_context *pCtx);
void * ph7_context_peek_aux_data(ph7_context *pCtx);
//C     PH7_APIEXPORT void * ph7_context_pop_aux_data(ph7_context *pCtx);
void * ph7_context_pop_aux_data(ph7_context *pCtx);
//C     PH7_APIEXPORT unsigned int ph7_context_result_buf_length(ph7_context *pCtx);
uint  ph7_context_result_buf_length(ph7_context *pCtx);
//C     PH7_APIEXPORT const char * ph7_function_name(ph7_context *pCtx);
char * ph7_function_name(ph7_context *pCtx);
/* Call Context Memory Management Interfaces */
//C     PH7_APIEXPORT void * ph7_context_alloc_chunk(ph7_context *pCtx,unsigned int nByte,int ZeroChunk,int AutoRelease);
void * ph7_context_alloc_chunk(ph7_context *pCtx, uint nByte, int ZeroChunk, int AutoRelease);
//C     PH7_APIEXPORT void * ph7_context_realloc_chunk(ph7_context *pCtx,void *pChunk,unsigned int nByte);
void * ph7_context_realloc_chunk(ph7_context *pCtx, void *pChunk, uint nByte);
//C     PH7_APIEXPORT void ph7_context_free_chunk(ph7_context *pCtx,void *pChunk);
void  ph7_context_free_chunk(ph7_context *pCtx, void *pChunk);
/* On Demand Dynamically Typed Value Object allocation interfaces */
//C     PH7_APIEXPORT ph7_value * ph7_new_scalar(ph7_vm *pVm);
ph7_value * ph7_new_scalar(ph7_vm *pVm);
//C     PH7_APIEXPORT ph7_value * ph7_new_array(ph7_vm *pVm);
ph7_value * ph7_new_array(ph7_vm *pVm);
//C     PH7_APIEXPORT int ph7_release_value(ph7_vm *pVm,ph7_value *pValue);
int  ph7_release_value(ph7_vm *pVm, ph7_value *pValue);
//C     PH7_APIEXPORT ph7_value * ph7_context_new_scalar(ph7_context *pCtx);
ph7_value * ph7_context_new_scalar(ph7_context *pCtx);
//C     PH7_APIEXPORT ph7_value * ph7_context_new_array(ph7_context *pCtx);
ph7_value * ph7_context_new_array(ph7_context *pCtx);
//C     PH7_APIEXPORT void ph7_context_release_value(ph7_context *pCtx,ph7_value *pValue);
void  ph7_context_release_value(ph7_context *pCtx, ph7_value *pValue);
/* Dynamically Typed Value Object Management Interfaces */
//C     PH7_APIEXPORT int ph7_value_int(ph7_value *pVal,int iValue);
int  ph7_value_int(ph7_value *pVal, int iValue);
//C     PH7_APIEXPORT int ph7_value_int64(ph7_value *pVal,ph7_int64 iValue);
int  ph7_value_int64(ph7_value *pVal, ph7_int64 iValue);
//C     PH7_APIEXPORT int ph7_value_bool(ph7_value *pVal,int iBool);
int  ph7_value_bool(ph7_value *pVal, int iBool);
//C     PH7_APIEXPORT int ph7_value_null(ph7_value *pVal);
int  ph7_value_null(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_double(ph7_value *pVal,double Value);
int  ph7_value_double(ph7_value *pVal, double Value);
//C     PH7_APIEXPORT int ph7_value_string(ph7_value *pVal,const char *zString,int nLen);
int  ph7_value_string(ph7_value *pVal, char *zString, int nLen);
//C     PH7_APIEXPORT int ph7_value_string_format(ph7_value *pVal,const char *zFormat,...);
int  ph7_value_string_format(ph7_value *pVal, char *zFormat,...);
//C     PH7_APIEXPORT int ph7_value_reset_string_cursor(ph7_value *pVal);
int  ph7_value_reset_string_cursor(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_resource(ph7_value *pVal,void *pUserData);
int  ph7_value_resource(ph7_value *pVal, void *pUserData);
//C     PH7_APIEXPORT int ph7_value_release(ph7_value *pVal);
int  ph7_value_release(ph7_value *pVal);
//C     PH7_APIEXPORT ph7_value * ph7_array_fetch(ph7_value *pArray,const char *zKey,int nByte);
ph7_value * ph7_array_fetch(ph7_value *pArray, char *zKey, int nByte);
//C     PH7_APIEXPORT int ph7_array_walk(ph7_value *pArray,int (*xWalk)(ph7_value *,ph7_value *,void *),void *pUserData);
int  ph7_array_walk(ph7_value *pArray, int  function(ph7_value *, ph7_value *, void *)xWalk, void *pUserData);
//C     PH7_APIEXPORT int ph7_array_add_elem(ph7_value *pArray,ph7_value *pKey,ph7_value *pValue);
int  ph7_array_add_elem(ph7_value *pArray, ph7_value *pKey, ph7_value *pValue);
//C     PH7_APIEXPORT int ph7_array_add_strkey_elem(ph7_value *pArray,const char *zKey,ph7_value *pValue);
int  ph7_array_add_strkey_elem(ph7_value *pArray, char *zKey, ph7_value *pValue);
//C     PH7_APIEXPORT int ph7_array_add_intkey_elem(ph7_value *pArray,int iKey,ph7_value *pValue);
int  ph7_array_add_intkey_elem(ph7_value *pArray, int iKey, ph7_value *pValue);
//C     PH7_APIEXPORT unsigned int ph7_array_count(ph7_value *pArray);
uint  ph7_array_count(ph7_value *pArray);
//C     PH7_APIEXPORT int ph7_object_walk(ph7_value *pObject,int (*xWalk)(const char *,ph7_value *,void *),void *pUserData);
int  ph7_object_walk(ph7_value *pObject, int  function(char *, ph7_value *, void *)xWalk, void *pUserData);
//C     PH7_APIEXPORT ph7_value * ph7_object_fetch_attr(ph7_value *pObject,const char *zAttr);
ph7_value * ph7_object_fetch_attr(ph7_value *pObject, char *zAttr);
//C     PH7_APIEXPORT const char * ph7_object_get_class_name(ph7_value *pObject,int *pLength);
char * ph7_object_get_class_name(ph7_value *pObject, int *pLength);
//C     PH7_APIEXPORT int ph7_value_is_int(ph7_value *pVal);
int  ph7_value_is_int(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_float(ph7_value *pVal);
int  ph7_value_is_float(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_bool(ph7_value *pVal);
int  ph7_value_is_bool(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_string(ph7_value *pVal);
int  ph7_value_is_string(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_null(ph7_value *pVal);
int  ph7_value_is_null(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_numeric(ph7_value *pVal);
int  ph7_value_is_numeric(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_callable(ph7_value *pVal);
int  ph7_value_is_callable(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_scalar(ph7_value *pVal);
int  ph7_value_is_scalar(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_array(ph7_value *pVal);
int  ph7_value_is_array(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_object(ph7_value *pVal);
int  ph7_value_is_object(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_resource(ph7_value *pVal);
int  ph7_value_is_resource(ph7_value *pVal);
//C     PH7_APIEXPORT int ph7_value_is_empty(ph7_value *pVal);
int  ph7_value_is_empty(ph7_value *pVal);
/* Global Library Management Interfaces */
//C     PH7_APIEXPORT int ph7_lib_init(void);
int  ph7_lib_init();
//C     PH7_APIEXPORT int ph7_lib_config(int nConfigOp,...);
int  ph7_lib_config(int nConfigOp,...);
//C     PH7_APIEXPORT int ph7_lib_shutdown(void);
int  ph7_lib_shutdown();
//C     PH7_APIEXPORT int ph7_lib_is_threadsafe(void);
int  ph7_lib_is_threadsafe();
//C     PH7_APIEXPORT const char * ph7_lib_version(void);
char * ph7_lib_version();
//C     PH7_APIEXPORT const char * ph7_lib_signature(void);
char * ph7_lib_signature();
//C     PH7_APIEXPORT const char * ph7_lib_ident(void);
char * ph7_lib_ident();
//C     PH7_APIEXPORT const char * ph7_lib_copyright(void);
char * ph7_lib_copyright();
//C     #ifdef __cplusplus
//C     }
//C     #endif /* __cplusplus */
//C     #endif /* _PH7_H_ */
