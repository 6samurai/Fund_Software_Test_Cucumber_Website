package appLayer.stub;

import main.java.Bank.BankProxy;

public class StubBankProxySuccess implements BankProxy {
    int count = 0;
    public long auth(CardInfo.CCInfo ccInfo, long amount) {
        count++;
        return count;
    }

    public int capture(long transactionID) {
        return 0;
    }
    public int refund(long transactionID, long amount) {
        return 0;
    }
}
