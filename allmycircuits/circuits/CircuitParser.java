package circuits;

import java.util.*;
import java.io.*;

public class CircuitParser extends Circuit
{
	public CircuitParser(String name)
	{
		super(name);
	}

	public void eval()
	{
		System.out.println("Evaluating circuit " + nom);
	}
}	
