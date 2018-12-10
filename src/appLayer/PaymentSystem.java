package appLayer;

import appLayer.stub.*;
import main.java.PaymentProcessor.PaymentProcessor;
import main.java.TransactionDatabase.TransactionDatabase;

import java.util.ArrayList;
import java.util.List;

public class PaymentSystem {

    String name;
    String address;
    String cardType;
    String cardNumber;
    String expiryDate;
    String cvvCode;
    String amount;

    public PaymentSystem(String name, String address, String cardType, String cardNumber, String expiryDate, String cvvCode, String amount){
        this.name = name;
        this.address = address;
        this.cardType = cardType;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvvCode = cvvCode;
        this.amount = amount;
    }



    public Results systemProcess (){

        TransactionDatabase transactionDB  = new TransactionDatabase();
        StubBankProxySuccess bank = new StubBankProxySuccess();
        List<String> logs = new ArrayList<String>();
        CardInfo.CCInfo ccInfo = new CardInfo.CCInfo(name, address,cardType , cardNumber, expiryDate, cvvCode);

        long id = (long)transactionDB.countTransactions();

        PaymentProcessor paymentProcessor =  new PaymentProcessor(bank, transactionDB, logs);

        int result =  paymentProcessor.processPayment(ccInfo,Long.parseLong(amount),"authorise");

        return new Results(result,logs);

    }
}


