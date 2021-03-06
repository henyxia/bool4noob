package circuits;

public abstract class Porte2Entrees extends Porte
{
	private static final long serialVersionUID = 7526471155612776147L;

	protected Composant in1;
	protected Composant in2;

	public abstract boolean eval() throws NonConnecteException;
	
	public void setIn1(Composant comp)
	{	
		in1 = comp;
	}

	public void setIn2(Composant comp)
	{	
		in2 = comp;
	}

	public Composant getIn1()
	{
		return in1;
	}

	public Composant getIn2()
	{
		return in2;
	}

	public String description()
	{
		return getId() + " in1: " + (in1 == null ? "Non connecté" : in1.getId()) + " in2: " + (in2 == null ? "Non connecté" : in2.getId());
	}

	public boolean getEtat() throws NonConnecteException
	{
		if(in1 == null)
			throw new NonConnecteException();
		else if(in2 == null)
			throw new NonConnecteException();
		else
			return eval();
	}
}
