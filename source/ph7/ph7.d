module ph7;

import std.conv;
import std.string;

extern (C) {
	int ph7_ph7_new();
	int ph7_ph7_vm_compile(int ph7_ph7_ptr, const char* src);
}

class Extension
{
	
}

class Script
{
	private int ph7_vm_ptr;

	public this(int ph7_vm_ptr)
	{
		this.ph7_vm_ptr = ph7_vm_ptr;
	}

	void exec()
	{

	}
}

class PH7
{
	private int ph7_ptr;

	public this()
	{
		this.ph7_ptr = ph7_ph7_new();
	}

	public Script compile(string src)
	{
		return new Script(ph7_ph7_vm_compile(this.ph7_ptr, toStringz(src)));
	}


}