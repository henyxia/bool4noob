package circuits;

import java.util.*;

public class CircuitParser extends Circuit
{
	public Map<String, Interrupteur> intNames = new LinkedHashMap<String, Interrupteur> ();
	public Map<String, Vanne> outNames = new LinkedHashMap<String, Vanne> ();
	public List<Boolean> intVals = new ArrayList<Boolean> ();

	public CircuitParser(String name)
	{
		super(name);
	}

	public void eval()
	{
		System.out.println("Evaluating circuit " + nom);
	}
}	
