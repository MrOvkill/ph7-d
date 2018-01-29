module php;

extern (C):

alias long sxi64;

alias ulong sxu64;

alias int function(void *, uint , void *)ProcConsumer;

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

/* Standard PH7 return values */
const int PH7_OK = SXRET_OK;
/* beginning-of-error-codes */
alias SXERR_MEM PH7_NOMEM;
alias SXERR_ABORT PH7_ABORT;
alias SXERR_IO PH7_IO_ERR;
alias SXERR_CORRUPT PH7_CORRUPT;
alias SXERR_LOCKED PH7_LOOKED;
const int PH7_COMPILE_ERR = -70;
const int PH7_VM_ERR = -71;
/* end-of-error-codes */
/*
 * If compiling for a processor that lacks floating point
 * support, substitute integer for floating-point.
 */
alias double ph7_real;
alias double ph7_int64;
/*
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
const PH7_CONFIG_ERR_OUTPUT = 1;
const PH7_CONFIG_ERR_ABORT = 2;
const PH7_CONFIG_ERR_LOG = 3;
/*
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
const PH7_VM_CONFIG_OUTPUT = 1;
const PH7_VM_CONFIG_IMPORT_PATH = 3;
const PH7_VM_CONFIG_ERR_REPORT = 4;
const PH7_VM_CONFIG_RECURSION_DEPTH = 5;
const PH7_VM_OUTPUT_LENGTH = 6;
const PH7_VM_CONFIG_CREATE_SUPER = 7;
const PH7_VM_CONFIG_CREATE_VAR = 8;
const PH7_VM_CONFIG_HTTP_REQUEST = 9;
const PH7_VM_CONFIG_SERVER_ATTR = 10;
const PH7_VM_CONFIG_ENV_ATTR = 11;
const PH7_VM_CONFIG_SESSION_ATTR = 12;
const PH7_VM_CONFIG_POST_ATTR = 13;
const PH7_VM_CONFIG_GET_ATTR = 14;
const PH7_VM_CONFIG_COOKIE_ATTR = 15;
const PH7_VM_CONFIG_HEADER_ATTR = 16;
const PH7_VM_CONFIG_EXEC_VALUE = 17;
const PH7_VM_CONFIG_IO_STREAM = 18;
const PH7_VM_CONFIG_ARGV_ENTRY = 19;
const int PH7_VM_CONFIG_EXTRACT_OUTPUT = 20;
const int PH7_VM_CONFIG_ERR_LOG_HANDLER = 21;
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
const int PH7_LIB_CONFIG_USER_MALLOC = 1;
const int PH7_LIB_CONFIG_MEM_ERR_CALLBACK = 2;
const int PH7_LIB_CONFIG_USER_MUTEX = 3;
const int PH7_LIB_CONFIG_THREAD_LEVEL_SINGLE = 4;
const int PH7_LIB_CONFIG_THREAD_LEVEL_MULTI = 5;
const int PH7_LIB_CONFIG_VFS = 6;
/*
 * Compile-time flags.
 * The new compile interfaces [ph7_compile_v2()] and [ph7_compile_file()] takes
 * as their last argument zero or more combination of compile time flags.
 * These flags are used to control the behavior of the PH7 compiler while
 * processing the input.
 * Refer to the official documentation for additional information.
 */
 /* If this flag is set then the code to compile is assumed
 * to be plain PHP only. That is, there is no need to delimit
 * the PHP code using the standard tags such as <?php ?> or <? ?>.
 * Everything will pass through the PH7 compiler.
 */
const int PH7_PHP_ONLY = 0x01;
const int PH7_PHP_EXPR = 0x02;
/*
 * Call Context Error Message Serverity Level.
 *
 * The following constans are the allowed severity level that can
 * passed as the second argument to the [ph7_context_throw_error()] or
 * [ph7_context_throw_error_format()] interfaces.
 * Refer to the official documentation for additional information.
 */
const int PH7_CTX_ERR = 1;
const int PH7_CTX_WARNING = 2;
const int PH7_CTX_NOTICE = 3;
const int PH7_VFS_VERSION = 2;
/*
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
const int PH7_IO_STREAM_VERSION = 1;
/*
 * Possible open mode flags that can be passed to the xOpen() routine
 * of the underlying IO stream device .
 * Refer to the PH7 IO Stream C/C++ specification manual (http://ph7.symisc.net/io_stream_spec.html)
 * for additional information.
 */
const int PH7_IO_OPEN_RDONLY = 0x001;
const int PH7_IO_OPEN_WRONLY = 0x002;
const int PH7_IO_OPEN_RDWR = 0x004;
const int PH7_IO_OPEN_CREATE = 0x008;
const int PH7_IO_OPEN_TRUNC = 0x010;
const int PH7_IO_OPEN_APPEND = 0x020;
const int PH7_IO_OPEN_EXCL = 0x040;
const int PH7_IO_OPEN_BINARY = 0x080;
const int PH7_IO_OPEN_TEMP = 0x100;
const int PH7_IO_OPEN_TEXT = 0x200;
/*
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
int  ph7_init(ph7 **ppEngine);
int  ph7_config(ph7 *pEngine, int nConfigOp,...);
int  ph7_release(ph7 *pEngine);
/* Compile Interfaces */
int  ph7_compile(ph7 *pEngine, char *zSource, int nLen, ph7_vm **ppOutVm);
int  ph7_compile_v2(ph7 *pEngine, char *zSource, int nLen, ph7_vm **ppOutVm, int iFlags);
int  ph7_compile_file(ph7 *pEngine, char *zFilePath, ph7_vm **ppOutVm, int iFlags);
/* Virtual Machine Handling Interfaces */
int  ph7_vm_config(ph7_vm *pVm, int iConfigOp,...);
int  ph7_vm_exec(ph7_vm *pVm, int *pExitStatus);
int  ph7_vm_reset(ph7_vm *pVm);
int  ph7_vm_release(ph7_vm *pVm);
int  ph7_vm_dump_v2(ph7_vm *pVm, int  function(void *, uint , void *)xConsumer, void *pUserData);
/* In-process Extending Interfaces */
int  ph7_create_function(ph7_vm *pVm, char *zName, int  function(ph7_context *, int , ph7_value **)xFunc, void *pUserData);
int  ph7_delete_function(ph7_vm *pVm, char *zName);
int  ph7_create_constant(ph7_vm *pVm, char *zName, void  function(ph7_value *, void *)xExpand, void *pUserData);
int  ph7_delete_constant(ph7_vm *pVm, char *zName);
/* Foreign Function Parameter Values */
int  ph7_value_to_int(ph7_value *pValue);
int  ph7_value_to_bool(ph7_value *pValue);
ph7_int64  ph7_value_to_int64(ph7_value *pValue);
double  ph7_value_to_double(ph7_value *pValue);
char * ph7_value_to_string(ph7_value *pValue, int *pLen);
void * ph7_value_to_resource(ph7_value *pValue);
int  ph7_value_compare(ph7_value *pLeft, ph7_value *pRight, int bStrict);
/* Setting The Result Of A Foreign Function */
int  ph7_result_int(ph7_context *pCtx, int iValue);
int  ph7_result_int64(ph7_context *pCtx, ph7_int64 iValue);
int  ph7_result_bool(ph7_context *pCtx, int iBool);
int  ph7_result_double(ph7_context *pCtx, double Value);
int  ph7_result_null(ph7_context *pCtx);
int  ph7_result_string(ph7_context *pCtx, char *zString, int nLen);
int  ph7_result_string_format(ph7_context *pCtx, char *zFormat,...);
int  ph7_result_value(ph7_context *pCtx, ph7_value *pValue);
int  ph7_result_resource(ph7_context *pCtx, void *pUserData);
/* Call Context Handling Interfaces */
int  ph7_context_output(ph7_context *pCtx, char *zString, int nLen);
int  ph7_context_output_format(ph7_context *pCtx, char *zFormat,...);
int  ph7_context_throw_error(ph7_context *pCtx, int iErr, char *zErr);
int  ph7_context_throw_error_format(ph7_context *pCtx, int iErr, char *zFormat,...);
uint  ph7_context_random_num(ph7_context *pCtx);
int  ph7_context_random_string(ph7_context *pCtx, char *zBuf, int nBuflen);
void * ph7_context_user_data(ph7_context *pCtx);
int  ph7_context_push_aux_data(ph7_context *pCtx, void *pUserData);
void * ph7_context_peek_aux_data(ph7_context *pCtx);
void * ph7_context_pop_aux_data(ph7_context *pCtx);
uint  ph7_context_result_buf_length(ph7_context *pCtx);
char * ph7_function_name(ph7_context *pCtx);
/* Call Context Memory Management Interfaces */
void * ph7_context_alloc_chunk(ph7_context *pCtx, uint nByte, int ZeroChunk, int AutoRelease);
void * ph7_context_realloc_chunk(ph7_context *pCtx, void *pChunk, uint nByte);
void  ph7_context_free_chunk(ph7_context *pCtx, void *pChunk);
/* On Demand Dynamically Typed Value Object allocation interfaces */
ph7_value * ph7_new_scalar(ph7_vm *pVm);
ph7_value * ph7_new_array(ph7_vm *pVm);
int  ph7_release_value(ph7_vm *pVm, ph7_value *pValue);
ph7_value * ph7_context_new_scalar(ph7_context *pCtx);
ph7_value * ph7_context_new_array(ph7_context *pCtx);
void  ph7_context_release_value(ph7_context *pCtx, ph7_value *pValue);
/* Dynamically Typed Value Object Management Interfaces */
int  ph7_value_int(ph7_value *pVal, int iValue);
int  ph7_value_int64(ph7_value *pVal, ph7_int64 iValue);
int  ph7_value_bool(ph7_value *pVal, int iBool);
int  ph7_value_null(ph7_value *pVal);
int  ph7_value_double(ph7_value *pVal, double Value);
int  ph7_value_string(ph7_value *pVal, char *zString, int nLen);
int  ph7_value_string_format(ph7_value *pVal, char *zFormat,...);
int  ph7_value_reset_string_cursor(ph7_value *pVal);
int  ph7_value_resource(ph7_value *pVal, void *pUserData);
int  ph7_value_release(ph7_value *pVal);
ph7_value * ph7_array_fetch(ph7_value *pArray, char *zKey, int nByte);
int  ph7_array_walk(ph7_value *pArray, int  function(ph7_value *, ph7_value *, void *)xWalk, void *pUserData);
int  ph7_array_add_elem(ph7_value *pArray, ph7_value *pKey, ph7_value *pValue);
int  ph7_array_add_strkey_elem(ph7_value *pArray, char *zKey, ph7_value *pValue);
int  ph7_array_add_intkey_elem(ph7_value *pArray, int iKey, ph7_value *pValue);
uint  ph7_array_count(ph7_value *pArray);
int  ph7_object_walk(ph7_value *pObject, int  function(char *, ph7_value *, void *)xWalk, void *pUserData);
ph7_value * ph7_object_fetch_attr(ph7_value *pObject, char *zAttr);
char * ph7_object_get_class_name(ph7_value *pObject, int *pLength);
int  ph7_value_is_int(ph7_value *pVal);
int  ph7_value_is_float(ph7_value *pVal);
int  ph7_value_is_bool(ph7_value *pVal);
int  ph7_value_is_string(ph7_value *pVal);
int  ph7_value_is_null(ph7_value *pVal);
int  ph7_value_is_numeric(ph7_value *pVal);
int  ph7_value_is_callable(ph7_value *pVal);
int  ph7_value_is_scalar(ph7_value *pVal);
int  ph7_value_is_array(ph7_value *pVal);
int  ph7_value_is_object(ph7_value *pVal);
int  ph7_value_is_resource(ph7_value *pVal);
int  ph7_value_is_empty(ph7_value *pVal);
/* Global Library Management Interfaces */
int  ph7_lib_init();
int  ph7_lib_config(int nConfigOp,...);
int  ph7_lib_shutdown();
int  ph7_lib_is_threadsafe();
char * ph7_lib_version();
char * ph7_lib_signature();
char * ph7_lib_ident();
char * ph7_lib_copyright();
