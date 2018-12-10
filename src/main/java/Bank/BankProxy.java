package main.java.Bank;

import CardInfo.CCInfo;

public interface BankProxy {
public long    auth(CCInfo ccInfo, long amount);
public int     capture(long transactionID);
public int     refund(long transactionID, long amount);
}
