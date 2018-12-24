package webApp;

import appLayer.PaymentSystem;
import appLayer.Results;
import appLayer.enums.PaymentSystemInputs;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "webPortal")
public class webPortal extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //obtains respective values after post from jsp web page
        String name = request.getParameter(PaymentSystemInputs.NAME.toString().toLowerCase());
        String address = request.getParameter(PaymentSystemInputs.ADDRESS.toString().toLowerCase());
        String card_types = request.getParameter(PaymentSystemInputs.CARD_TYPE.toString().toLowerCase());
        String card_number = request.getParameter(PaymentSystemInputs.CARD_NUMBER.toString().toLowerCase());
        String expiry_date = request.getParameter(PaymentSystemInputs.EXPIRY_DATE.toString().toLowerCase());
        String CVV_code = request.getParameter(PaymentSystemInputs.CVV_CODE.toString().toLowerCase());
        String amount = request.getParameter(PaymentSystemInputs.AMOUNT.toString().toLowerCase());

        //calls payment system with retrieved values
        PaymentSystem paymentSystem = new PaymentSystem(name, address, card_types, card_number, expiry_date, CVV_code, amount);

        String list = "";
        Results paymentSystemResults = paymentSystem.systemProcess();

        //user error
        if (paymentSystemResults.paymentResults == 1) {
            //obtains all of the logs errors
            for (String log : paymentSystemResults.logs) {
                list = log;
            }

        }
        //valid result
        else if (paymentSystemResults.paymentResults == 0) {

            list = "The payment was successful";

        }
        //unknown error has occurred
        else {
            list = "An error\n" +
                    "occurred while processing your transaction";

        }
        //set pop up message attribute
        request.setAttribute("alertMsg", list);
        RequestDispatcher rd = request.getRequestDispatcher("/webPortal.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
