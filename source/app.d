import std.file;
import std.stdio;
import std.string;
import std.conv;

import php;

extern (C) int compilerOutputConsumer(const(void)* data, uint len, void* userData)
{
	char* msg = cast(char*)data;
	for(int i = 0; i < len; i++)
	{
		writef("%c", msg[i]);
	}
	return PH7_OK;
}

int main(string[] args)
{
    if(args.length < 2)
    {
        writefln("Usage: %s <file.php>", args[0]);
        return -1;
    }
    if(!exists(args[1])) {
        writefln("Path \"%s\" does not exist or cannot be accessed.", args[1]);
        return -2;
    }
    ph7* state;
    ph7_vm* vm;
    ph7_init(&state);
    int rc = ph7_compile_file(state, cast(char*)toStringz(args[1]), &vm, PH7_PHP_EXPR);
    if(rc != PH7_OK) 
    {
    	if(rc == PH7_COMPILE_ERR) {
    		const(char)* errorLog;
    		int len;
    		ph7_config(state, PH7_CONFIG_ERR_LOG, &errorLog, &len);
    		if(len > 0) {
    			writefln("Compilation error: %s", errorLog);
    			return -1;
    		}
    	}
    }

    writefln("Compilation succeeded!");

    rc = ph7_vm_config(vm, PH7_VM_CONFIG_OUTPUT, &compilerOutputConsumer, 0);

    if(rc != PH7_OK) {
    	writefln("Error setting up output consumer!");
    	return -2;
    }

    int x = 0;

    ph7_vm_exec(vm, &x);



    return 0;
}
