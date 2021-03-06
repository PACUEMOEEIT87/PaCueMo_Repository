package _9_42_playerCard_model;

import java.io.Serializable;

public class PlayerCardVO implements Serializable
{

	private static final long serialVersionUID = 1L;

	private String memberId;
	private Boolean playerGender;
	private double playerHeight;
	private double playerWeight;
	private String playerPosition;
	private Boolean playerHand;
	private String playerNote;
	private String playerLoation;
	private int playerSTR;
	private int playerCON;
	private int playerDEX;
	private int playerINT;
	private int playerWIS;
	private int playerCHA;

	public String getMemberId()
	{
		return memberId;
	}

	public void setMemberId(String memberId)
	{
		this.memberId = memberId;
	}

	public Boolean getPlayerGender()
	{
		return playerGender;
	}

	public void setPlayerGender(Boolean playerGender)
	{
		this.playerGender = playerGender;
	}

	public double getPlayerHeight()
	{
		return playerHeight;
	}

	public void setPlayerHeight(double playerHeight)
	{
		this.playerHeight = playerHeight;
	}

	public double getPlayerWeight()
	{
		return playerWeight;
	}

	public void setPlayerWeight(double playerWeight)
	{
		this.playerWeight = playerWeight;
	}

	public String getPlayerPosition()
	{
		return playerPosition;
	}

	public void setPlayerPosition(String playerPosition)
	{
		this.playerPosition = playerPosition;
	}

	public Boolean getPlayerHand()
	{
		return playerHand;
	}

	public void setPlayerHand(Boolean playerHand)
	{
		this.playerHand = playerHand;
	}

	public String getPlayerNote()
	{
		return playerNote;
	}

	public void setPlayerNote(String playerNote)
	{
		this.playerNote = playerNote;
	}

	public String getPlayerLoation()
	{
		return playerLoation;
	}

	public void setPlayerLoation(String playerLoation)
	{
		this.playerLoation = playerLoation;
	}

	public int getPlayerSTR()
	{
		return playerSTR;
	}

	public void setPlayerSTR(int playerSTR)
	{
		this.playerSTR = playerSTR;
	}

	public int getPlayerCON()
	{
		return playerCON;
	}

	public void setPlayerCON(int playerCON)
	{
		this.playerCON = playerCON;
	}

	public int getPlayerDEX()
	{
		return playerDEX;
	}

	public void setPlayerDEX(int playerDEX)
	{
		this.playerDEX = playerDEX;
	}

	public int getPlayerINT()
	{
		return playerINT;
	}

	public void setPlayerINT(int playerINT)
	{
		this.playerINT = playerINT;
	}

	public int getPlayerWIS()
	{
		return playerWIS;
	}

	public void setPlayerWIS(int playerWIS)
	{
		this.playerWIS = playerWIS;
	}

	public int getPlayerCHA()
	{
		return playerCHA;
	}

	public void setPlayerCHA(int playerCHA)
	{
		this.playerCHA = playerCHA;
	}

}
