package appLayer.stub;

import code.Bank.BankProxy;
import code.CardInfo.CCInfo;

public class StubBankProxySuccess implements BankProxy {
    int count = 0;

    public long auth(CCInfo ccInfo, long amount) {
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
