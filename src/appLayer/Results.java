package appLayer;

import java.util.List;

//class of results obtained from payment system
public class Results {
    public List<String> logs;
    public int paymentResults;

    public Results(int paymentResult, List<String> logs) {
        this.paymentResults = paymentResult;
        this.logs = logs;
    }
}
