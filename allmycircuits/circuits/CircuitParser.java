package circuits;

import java.util.*;

public class CircuitParser extends Circuit
{
	int argNumbers = 0;

	public CircuitParser(String name)
	{
		super(name);
	}

	public void addCmp(String type, String name)
	{
		if(type == "in")
			argNumbers++;
		super.addCmp(type, name);
	}

	public void addInputValue(String state)
	{
		argNumbers--;
		System.out.println("Setting "+state+" to " + argNumbers);
		if(state == "true")
			((Interrupteur)inputs.values().toArray()[argNumbers]).on();
		else
			((Interrupteur)inputs.values().toArray()[argNumbers]).off();
	}

	public void eval()
	{
		System.out.println("Evaluating circuit " + nom);
		Iterator<Vanne> it = outputs.values().iterator();
		while(it.hasNext())
		{
			Vanne tmp = it.next();
			System.out.println("State of this entry is " + tmp.traceEtat());
		}
	}
}	
