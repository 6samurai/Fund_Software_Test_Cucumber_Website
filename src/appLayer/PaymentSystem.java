package appLayer;

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


    public int systemPrcoess (){

        return  0;
    }
}
