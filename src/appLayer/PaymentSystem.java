package appLayer;

import appLayer.stub.StubBankProxySuccess;
import code.CardInfo.CCInfo;
import code.PaymentProcessor.PaymentProcessor;
import code.TransactionDatabase.TransactionDatabase;

import java.util.ArrayList;
import java.util.List;

public class PaymentSystem {

    private String name;
    private String address;
    private String cardType;
    private String cardNumber;
    private String expiryDate;
    private String cvvCode;
    private String amount;

    public PaymentSystem(String name, String address, String cardType, String cardNumber, String expiryDate, String cvvCode, String amount) {
        this.name = name;
        this.address = address;

        //to convert american express string to its assigned value of the system
        if (cardType.contains("American Express"))
            this.cardType = "American_Express";
        else
            this.cardType = cardType;

        //removes any blank spaces
        this.cardNumber = cardNumber.replaceAll("\\s+", "");
        this.expiryDate = expiryDate;
        this.cvvCode = cvvCode;
        this.amount = amount;
    }


    public Results systemProcess() {
        //database
        TransactionDatabase transactionDB = new TransactionDatabase();
        //bank
        StubBankProxySuccess bank = new StubBankProxySuccess();
        //error log
        List<String> logs = new ArrayList<String>();

        //card info from user input
        CCInfo ccInfo = new CCInfo(name, address, cardType, cardNumber, expiryDate, cvvCode);

        PaymentProcessor paymentProcessor = new PaymentProcessor(bank, transactionDB, logs);
        //payment processor
        int result = paymentProcessor.processPayment(ccInfo, Long.parseLong(amount));

        return new Results(result, logs);
    }
}


